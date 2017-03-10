<%-- 
    Document   : dashboard
    Created on : Jan 23, 2017, 5:07:18 PM
    Author     : caniksea
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.util.HashSet"%>
<%@page import="com.hudatrans.caniksea.model.Beneficiary"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonArray"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.hudatrans.caniksea.model.Sale"%>
<%@page import="java.util.Set"%>
<%@page import="com.hudatrans.caniksea.model.GenericCollectionResponse"%>
<%@page import="com.hudatrans.caniksea.controller.RPEngine"%>
<%@page import="com.hudatrans.caniksea.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String successMessage = "", errorMessage = "";
    boolean showSuccess = false, showError = false;
    User user = (User) session.getAttribute("user");
    String customerName = "", customerFirstName = "";
    String pageTitle = "", tnxType = "";
    int noOfPendingTransaction = 0, noOfTransactions = 0, noOfSuccessfulTxn = 0, noOfFailedTxn = 0, noOfActive = 0;
    JsonArray pendingT = null, allT = null, beneficiaries = null,
            successT = null, failedT = null, activeT = null;
    Set<Object> beneficiarySet = new HashSet<>();
    boolean limit = false, showSearch = false;

    String activeDesc = "Last Ten (10) Transactions";

//    if(currentPage.contains("arbel")) activeStyle = "active";
    if (user != null) {
        RPEngine engine = new RPEngine();
        customerFirstName = user.getFirst_name();
        customerName = user.getFirst_name() + " " + user.getLast_name();
        pageTitle = customerFirstName + "'s Dashboard";

        successMessage = (String) session.getAttribute("success");
        if (successMessage != null && !successMessage.isEmpty()) {
            showSuccess = true;
            session.removeAttribute("success");
        }

        errorMessage = (String) session.getAttribute("error");
        if (errorMessage != null && !errorMessage.isEmpty()) {
            showError = true;
            session.removeAttribute("error");
        }

        //get pending transactions
        GenericCollectionResponse gcr = engine.getTransactions(user.getContact_id(), "PENDING");
        if (gcr.getResponse_code().equals("00")) {
            if (!gcr.getResponse_data().isEmpty()) {
                pendingT = engine.getJsonArrayFromObjects(gcr.getResponse_data());
                noOfPendingTransaction = pendingT.size();
            }
        }

        //get all transactions
        GenericCollectionResponse allTransactions = engine.getTransactions(user.getContact_id(), "ALL");
        if (allTransactions.getResponse_code().equals("00")) {
            if (!allTransactions.getResponse_data().isEmpty()) {
                allT = engine.getJsonArrayFromObjects(allTransactions.getResponse_data());
                noOfTransactions = allT.size();
            }
        }

        //get successful transactions
        GenericCollectionResponse successfulTransactions = engine.getTransactions(user.getContact_id(), "COMPLETED");
        if (successfulTransactions.getResponse_code().equals("00")) {
            if (!successfulTransactions.getResponse_data().isEmpty()) {
                successT = engine.getJsonArrayFromObjects(successfulTransactions.getResponse_data());
                noOfSuccessfulTxn = successT.size();
            }
        }

        //get successful transactions
        GenericCollectionResponse failedTransactions = engine.getTransactions(user.getContact_id(), "FAILED");
        if (failedTransactions.getResponse_code().equals("00")) {
            if (!failedTransactions.getResponse_data().isEmpty()) {
                failedT = engine.getJsonArrayFromObjects(failedTransactions.getResponse_data());
                noOfFailedTxn = failedT.size();
            }
        }

        //get beneficiaries
        beneficiarySet = (Set<Object>) session.getAttribute("beneficiaries");
        if (beneficiarySet == null) {
            GenericCollectionResponse gcr_ben = engine.getBeneficiaries(user);
            if (gcr_ben.getResponse_code().equals("00")) {
                session.setAttribute("beneficiaries", gcr_ben.getResponse_data());
                beneficiarySet = (Set<Object>) gcr_ben.getResponse_data();
            }
        }
        beneficiaries = engine.getJsonArrayFromObjects(beneficiarySet);

        String startDate = request.getParameter("tnx_dateFrom");
        String endDate = request.getParameter("tnx_dateTo");
        tnxType = request.getParameter("tnxType");
        tnxType = tnxType == null ? (String) session.getAttribute("tnx_type") : tnxType;

        if (tnxType == null) {
            limit = true;
            activeT = allT;
            noOfActive = noOfTransactions;
        } else {
            limit = false;
            if (startDate == null || endDate == null) {
                if (tnxType.equals("a")) {
                    activeDesc = "All Transactions";
                    activeT = allT;
                    noOfActive = noOfTransactions;
                } else if (tnxType.equals("s")) {
                    activeDesc = "All Successful Transactions";
                    activeT = successT;
                    noOfActive = noOfSuccessfulTxn;
                } else if (tnxType.equals("f")) {
                    activeDesc = "All Failed Transactions";
                    activeT = failedT;
                    noOfActive = noOfFailedTxn;
                }
                showSearch = noOfActive > 1;
            } else {
                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                Date start = sdf.parse(startDate);
                Date end = sdf.parse(endDate);
                limit = false;
                activeT = new JsonArray();
                JsonArray tempArray = new JsonArray();
                String pre = "";
                if (tnxType.equals("a")) {
                    tempArray = allT;
                    pre = "Transaction(s) between  ";
                } else if (tnxType.equals("s")) {
                    pre = "Successful Transaction(s) between  ";
                    tempArray = successT;
                } else if (tnxType.equals("f")) {
                    pre = "Failed Transaction(s) between  ";
                    tempArray = failedT;
                }
                for (int i = 0; i < tempArray.size(); i++) {
                    JsonObject o = (JsonObject) tempArray.get(i);
                    String dateString = o.get("order_date").getAsString();
                    Date d = new Date(dateString);
                    String formattedDate = sdf.format(d);
                    d = sdf.parse(formattedDate);
                    if (d.equals(start) || d.equals(end)) {
                        activeT.add(o);
                    }
                    if (d.after(start) && d.before(end)) {
                        activeT.add(o);
                    }
                }
                activeDesc = pre + startDate + "  and  " + endDate;
                noOfActive = activeT.size();
            }
        }
        session.removeAttribute("tnx_type");

    } else {
        response.sendRedirect("indizea");
    }
%>

<%@include file="WEB-INF/jspf/mgt_header.jspf" %>

<%@include file="WEB-INF/jspf/mgt_nav.jspf" %>

<aside class="right-side">
    <!-- Main content -->
    <section class="content">
        <div class="row" style="margin-bottom:5px;">
            <div class="col-md-4">
                <a href="route.jsp?tt=a">
                    <div class="sm-st clearfix">
                        <span class="sm-st-icon st-blue"><i class="fa fa-th-list"></i></span>
                        <div class="sm-st-info">
                            <span><%= noOfTransactions%></span>
                            Total Transactions
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-md-4">
                <a href="route.jsp?tt=s">
                    <div class="sm-st clearfix">
                        <span class="sm-st-icon st-green"><i class="fa fa-check-square-o"></i></span>
                        <div class="sm-st-info">
                            <span><%= noOfSuccessfulTxn%></span>
                            Successful Transactions
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-md-4">
                <a href="route.jsp?tt=f">
                    <div class="sm-st clearfix">
                        <span class="sm-st-icon st-red"><i class="fa fa-stop"></i></span>
                        <div class="sm-st-info">
                            <span><%= noOfFailedTxn%></span>
                            Failed Transactions
                        </div>
                    </div>
                </a>
            </div>
        </div>
        <!-- Main row -->
        <div class="row">
            <div class="col-md-8">
                <section class="panel">
                    <header class="panel-heading">
                        <%= activeDesc%>
                    </header>
                    <%
                        if (showSearch) {
                    %>
                    <div class="row" style="padding-top: 10px;">
                        <div class="col-lg-9 col-lg-offset-3">
                            <form class="form-inline" action="arbel" method="POST">
                                <input type="hidden" id="tnxType" name="tnxType" value="<%= tnxType%>" />
                                <div class="form-group">
                                    <div class='input-group date' id='datetimepicker_from'>
                                        <input type='text' class="form-control" id="tnx_dateFrom" name="tnx_dateFrom" value="" placeholder="From" required />
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class='input-group date' id='datetimepicker_to' style="padding-left: 15px">
                                        <input type='text' class="form-control" id="tnx_dateTo" name="tnx_dateTo" value="" placeholder="To" required />
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-success" style="padding-left: 15px">filter</button>
                            </form>
                        </div>
                    </div>
                    <%
                        }
                    %>
                    <div class="panel-body table-responsive">

                        <table class="table table-hover">
                            <tr>
                                <th>Transaction Date</th>
                                <th>Beneficiary</th>
                                <th class="amount-align">Order Amount</th>
                                <th class="amount-align">Order Amount</th>
                                <th>Status</th>
                            </tr>
                            <%
                                if (noOfActive > 0) {
                                    int upperBound = activeT.size();
                                    if (limit) {
                                        upperBound = activeT.size() > 10 ? 10 : activeT.size();
                                    }
                                    for (int i = 0; i < upperBound; i++) {
                                        JsonObject o = (JsonObject) activeT.get(i);
                                        String benId = o.get("beneficiary_id").getAsString();
                                        String currency = o.get("currency").getAsString();
                                        if (currency.equalsIgnoreCase("Naira")) {
                                            currency = "&#8358;";
                                        } else if (currency.equalsIgnoreCase("Cedis")) {
                                            currency = "&#8373;";
                                        } else if (currency.equalsIgnoreCase("Rand")) {
                                            currency = "ZAR";
                                        } else if (currency.equalsIgnoreCase("Pounds")) {
                                            currency = "&pound;";
                                        }
                                        String statusStyle = "label-success", status = o.get("status").getAsString();
                                        if (status.equalsIgnoreCase("PENDING")) {
                                            statusStyle = "label-warning";
                                        } else if (status.equalsIgnoreCase("Failed")) {
                                            statusStyle = "label-danger";
                                        }
                                        //get beneficiary name
                                        String name = "";
                                        if (beneficiaries != null) {
                                            for (int j = 0; j < beneficiaries.size(); j++) {
                                                JsonObject p = (JsonObject) beneficiaries.get(j);
                                                double idDbl = p.get("beneficiary_id").getAsDouble();
                                                int id = (int) idDbl;
                                                String idStr = String.valueOf(id);
                                                if (idStr.equals(benId)) {
                                                    name = p.get("first_name").getAsString() + " " + p.get("last_name").getAsString();
                                                    break;
                                                }
                                            }
                                        }
                            %>
                            <tr>
                                <td><%= o.get("order_date").getAsString()%></td>
                                <td><%= name%></td>
                                <td class="amount-align">&pound; <%= o.get("sending_amount").getAsString()%></td>
                                <td class="amount-align"><%= currency%> <%= o.get("receiving_amount").getAsString()%></td>
                                <td><span class="label <%= statusStyle%>"><%= status%></span></td>
                            </tr>
                            <%
                                }
                            } else {
                            %>
                            <tr>
                                <td colspan="5" style="text-align: center;">No Record</td>
                            </tr>
                            <%}%>
                        </table>


                    </div>
                </section>
            </div>
            <div class="col-lg-4">
                <section class="panel">
                    <header class="panel-heading">
                        Notifications
                    </header>
                    <div class="panel-body" id="noti-box">
                        <% if (!showSuccess && !showError) { %>
                        <div class="alert alert-info">
                            <button data-dismiss="alert" class="close close-sm" type="button">
                                <i class="fa fa-times"></i>
                            </button>
                            <strong>All good!</strong> No recent notification.
                        </div>
                        <% } else if (showError) {%>
                        <div class="alert alert-block alert-danger">
                            <button data-dismiss="alert" class="close close-sm" type="button">
                                <i class="fa fa-times"></i>
                            </button>
                            <strong>Oh snap!</strong> Your last transaction was not successful. <%= errorMessage%>
                        </div>
                        <% } else if (showSuccess) { %>
                        <div class="alert alert-success">
                            <button data-dismiss="alert" class="close close-sm" type="button">
                                <i class="fa fa-times"></i>
                            </button>
                            <strong>Well done!</strong> Your last transaction was successful.
                        </div>
                        <% }%>
                        <div class="alert alert-warning">
                            <button data-dismiss="alert" class="close close-sm" type="button">
                                <i class="fa fa-times"></i>
                            </button>
                            <strong>**</strong> You have <%= noOfPendingTransaction%> pending transactions.
                        </div>
                    </div>
                </section>
            </div>
        </div>

        <!--        <div class="row">
                    <div class="col-xs-12">
                        <div class="panel">
                            <header class="panel-heading">
                                Pending Transactions (9)
                            </header>
                             <div class="box-header"> 
                             <h3 class="box-title">Responsive Hover Table</h3> 
        
                             </div> 
                            <div class="panel-body table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>Transaction Date</th>
                                            <th>Beneficiary</th>
                                            <th class="amount-align">Order Amount</th>
                                            <th class="amount-align">Beneficiary Amount</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
        
        <!--%
//                                    if (noOfPendingTransaction > 0) {
//                                        int upperBound = pendingT.size() > 9 ? 9 : pendingT.size();
//                                        for (int i = 0; i < upperBound; i++) {
//                                            JsonObject o = (JsonObject) pendingT.get(i);
//                                            String currency = o.get("currency").getAsString();
//                                            String benId = o.get("beneficiary_id").getAsString();
//                                            if (currency.equalsIgnoreCase("Naira")) {
//                                                currency = "&#8358;";
//                                            } else if (currency.equalsIgnoreCase("Cedis")) {
//                                                currency = "&#8373;";
//                                            } else if (currency.equalsIgnoreCase("Rand")) {
//                                                currency = "ZAR";
//                                            } else if (currency.equalsIgnoreCase("Pounds")) {
//                                                currency = "&pound;";
//                                            }
//                                            //get beneficiary name
//                                            String name = "";
//                                            if (beneficiaries != null) {
//                                                for (int j = 0; j < beneficiaries.size(); j++) {
//                                                    JsonObject p = (JsonObject) beneficiaries.get(j);
//                                                    double idDbl = p.get("beneficiary_id").getAsDouble();
//                                                    int id = (int) idDbl;
//                                                    String idStr = String.valueOf(id);
//                                                    if (idStr.equals(benId)) {
//                                                        name = p.get("first_name").getAsString() + " " + p.get("last_name").getAsString();
//                                                        break;
//                                                    }
//                                                }
//                                            }
        %>
        <tr>
            <td><!--%= //o.get("order_date").getAsString()%></td>
            <td><!--%= //name%></td>
            <td class="amount-align">&pound; <!--%= //o.get("sending_amount").getAsString()%></td>
            <td class="amount-align"><!--%= //currency%> <!--%= //o.get("receiving_amount").getAsString()%></td>
        </tr>
        <!--%
//                                        }
//                                    }
        %-->


        </tbody>
        </table>
        </div> <!-- /.box-body -->
        </div> <!-- /.box  -->
        </div>
        </div>
        <!-- row end -->
    </section><!-- /.content -->
    <div class="footer-main">
        &copy; 2016 hudatransfer.com All rights
    </div>
</aside><!-- /.right-side -->

<%@include file="WEB-INF/jspf/mgt_footer.jspf" %>