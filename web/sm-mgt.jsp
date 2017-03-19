<%-- 
    Document   : sm-mgt
    Created on : Jan 27, 2017, 2:19:06 PM
    Author     : caniksea
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.hudatrans.caniksea.controller.RPEngine"%>
<%@page import="com.hudatrans.caniksea.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String pageTitle = "Initiate Transaction";
    String customerName = "", customerFirstName = "", message = "";

    User user = (User) session.getAttribute("user");
    if (user != null) {
        RPEngine engine = new RPEngine();
        customerFirstName = user.getFirst_name();
        customerName = user.getFirst_name() + " " + user.getLast_name();

    } else {
        response.sendRedirect("indizea");
    }
%>
<%@include file="WEB-INF/jspf/mgt_header.jspf" %>
<%@include file="WEB-INF/jspf/mgt_nav.jspf" %>

<aside class="right-side">    
    <!-- Main content -->
    <section class="content">
        <!-- Main row -->
        <div class="row">
            <div class="col-md-8">
                <section class="panel">
                    <header class="panel-heading">
                        Intiate Payment
                    </header>
                    <form id="sm_mgt_form" method="POST" action="pre_add_sales.jsp">
                        <input type="hidden" id="bg_countryCode" name="bg_countryCode" />
                        <div class="panel-body">

                            <div class="row">
                                <div class="col-md-10 col-sm-10 col-xs-9 form-group">
                                    <select id="bg_beneficiary" name="destination_country_code" class="form-control" required>
                                        <option value="" >Select Beneficiary</option>
                                        <c:forEach var="beneficiary" items="${beneficiaries}">
                                            <option value="${beneficiary.beneficiary_id}">
                                                ${beneficiary.first_name}  ${beneficiary.middle_name} ${beneficiary.last_name} - ${beneficiary.account_number}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="col-md-2 col-sm-2 col-xs-3 form-group">
                                    <img style="float: right; height: 30px;" id="bg_countryFlag" src="" alt="" />
                                </div>

                                <div class="col-md-12 form-group">
                                    <select id="delivery-method" name="pay_method" class="form-control" required>
                                        <option value="">Select Payment Method</option>
                                    </select>
                                </div>


                                <div class="col-md-6 form-group">
                                    <span class="input-group-addon">POUNDS</span>
                                    <input type="text" id="sending-amount" name="source_amount" class="form-control" disabled placeholder="Sending Amount" required>
                                </div>

                                <div class="col-md-6 form-group">
                                    <span class="input-group-addon" id="bg_destinationCurr">RECEIVING CURRENCY</span>
                                    <input type="text" id="receiving-amount" class="form-control" disabled placeholder="Receiving Amount">
                                </div>

                                <div class="col-md-6 col-xs-6 form-group">
                                    <button type="submit" class="btn btn-info">Send Money</button>
                                </div>

                                <div class="col-md-6 form-group">
                                    <button type="button" onclick="resetForm(sm_mgt_form);" class="btn btn-danger" style="float: right;">clear</button>
                                </div>
                            </div>

                        </div>
                    </form>
                </section>
            </div>
            <div class="col-md-4">
                <section class="panel">
                    <header class="panel-heading">
                        Transaction Details
                    </header>
                    <div class="panel-body">
                        <div id="bg_tnxInfo_dest" class="alert alert-info">
                            <div class="row">
                                <div class="col-md-7">
                                    Destination Country:
                                </div>
                                <div class="col-md-5" style="text-align: right;"><strong id="bg_destinationCountry"></strong> </div>
                            </div>
                        </div>
                        <div id="bg_tnxInfo_exchange" class="alert alert-block alert-info">
                            <div class="row">
                                <div class="col-md-7">
                                    Exchange Rate:
                                </div>
                                <div class="col-md-5" style="text-align: right;"> <strong id="bg_exchange"></strong> </div>
                            </div>
                        </div>
                        <div id="bg_tnxInfo_fee" class="alert alert-block alert-info">
                            <div class="row">
                                <div class="col-md-7">
                                    Transaction Fee:
                                </div>
                                <div class="col-md-5" style="text-align: right;"> <strong id="bg_fee"></strong> </div>
                            </div>
                        </div>
                        <div id="bg_tnxInfo_total" class="alert alert-success">
                            <div class="row">
                                <div class="col-md-7">
                                    Total:
                                </div>
                                <div class="col-md-5" style="text-align: right;"> <strong id="bg_total"></strong> </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>        
    </section>
</aside>

<%@include file="WEB-INF/jspf/mgt_footer.jspf" %>
