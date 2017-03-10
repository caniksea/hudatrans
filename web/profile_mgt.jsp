<%-- 
    Document   : profile_mgt
    Created on : Feb 5, 2017, 8:51:13 PM
    Author     : caniksea
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.hudatrans.caniksea.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String pageTitle = "";
    String customerName = "", customerFirstName = "", message = "",
            address = "", dob = "", country = "", city = "", postal_code = "",
            phone = "", mobile = "", fax = "", dial_code = "";
    String infoStyle = "alert-success";
    boolean showInfo = false;

    User user = (User) session.getAttribute("user");
    if (user != null) {
        customerFirstName = user.getFirst_name();
        customerName = user.getFirst_name() + " " + user.getLast_name();
        pageTitle = customerFirstName + "'s Profile";

        dob = user.getDob() == null ? dob : user.getDob();
        address = user.getAddress() == null ? address : user.getAddress();
        country = user.getCountry() == null ? country : user.getCountry();
        city = user.getCity() == null ? city : user.getCity();
        postal_code = user.getPostal_code() == null ? postal_code : user.getPostal_code();
        phone = user.getPhone() == null ? phone : user.getPhone();
        if (!phone.isEmpty()) {
            String phoneArr[] = phone.split("-");
            phone = phoneArr[1];
            dial_code = phoneArr[0];
        }
        mobile = user.getMobile() == null ? mobile : user.getMobile();
        fax = user.getFax() == null ? fax : user.getFax();
        //get error message
        String error = (String) session.getAttribute("error");
        if (error != null && !error.isEmpty()) {
            infoStyle = "alert-danger";
            message = error;
            showInfo = true;
            session.removeAttribute("error");
        }
        String success = (String) session.getAttribute("success");
        if (success != null && !success.isEmpty()) {
            message = success;
            showInfo = true;
            session.removeAttribute("success");
        }
    } else {
        response.sendRedirect("indizea");
    }
%>

<%@include file="WEB-INF/jspf/mgt_header.jspf" %>
<%@include file="WEB-INF/jspf/mgt_nav.jspf" %>

<aside class="right-side">
    <!-- Main content -->
    <section class="content">

        <div class="row">
            <div class="col-xs-12">
                <section class="panel">
                    <header class="panel-heading tab-bg-dark-navy-blue tab-right ">
                        <ul class="nav nav-tabs pull-right">
                            <li class="active">
                                <a data-toggle="tab" href="#home-3">
                                    <i class="fa fa-user"></i>
                                </a>
                            </li>
                            <li class="">
                                <a data-toggle="tab" href="#contact-3">
                                    <i class="fa fa-envelope-o"></i> 
                                    Contact
                                </a>
                            </li>
                            <!--                            <li class="">
                                                            <a data-toggle="tab" href="#about-3">
                                                                <i class="fa fa-unsorted"></i> 
                                                                Other Details
                                                            </a>
                                                        </li>-->
                        </ul>
                    </header>
                    <div class="panel-body">
                        <%if (showInfo) {%>
                        <div class="alert alert=block <%= infoStyle%>">
                            <button data-dismiss="alert" class="close close-sm" type="button">
                                <i class="fa fa-times"></i>
                            </button>
                            <%= message%>
                        </div>
                        <%}%>
                        <div class="tab-content">
                            <div id="home-3" class="tab-pane active">
                                <section class="panel">
                                    <header class="panel-heading">
                                        Basic Details
                                    </header>
                                    <div class="panel-body">
                                        <form id="basic_form" method="POST" class="form-horizontal" role="form" action="upd-bd">
                                            <input type="hidden" name="source" value="basic" />
                                            <div class="form-group">
                                                <label for="mgt_email" class="col-lg-2 col-sm-2 control-label">Email</label>
                                                <div class="col-lg-10">
                                                    <p class="form-control-static" id="mgt_email" name="mgt_email"
                                                       value=""><%= user.getEmail()%></p>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="mgt_firstname" class="col-lg-2 col-sm-2 control-label">First Name</label>
                                                <div class="col-lg-6">
                                                    <input type="text" class="form-control" id="mgt_firstname" name="mgt_firstname"
                                                           value="<%= customerFirstName%>" placeholder="First Name" required disabled>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="mgt_lastname" class="col-lg-2 col-sm-2 control-label">Last Name</label>
                                                <div class="col-lg-6">
                                                    <input type="text" class="form-control" id="mgt_lastname" name="mgt_lastname"
                                                           value="<%= user.getLast_name()%>" placeholder="Last Name" disabled required>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="mgt_dob" class="col-lg-2 col-sm-2 control-label">Date of Birth</label>
                                                <div class='col-lg-5 col-sm-5 input-group date' id='datetimepicker' style="padding-left: 15px">
                                                    <input type='text' class="form-control" id="mgt_dob" name="mgt_dob" value="<%= dob%>" placeholder="Date of Birth" disabled required />
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-lg-offset-2 col-md-6 col-sm-8 col-xs-8">
                                                    <button id="edit_basic" type="button" class="btn btn-warning">
                                                        <i class="fa fa-edit"></i> Edit</button>
                                                </div>
                                                <div class="col-lg-offset-2 col-md-6 col-sm-8 col-xs-8">
                                                    <button id="cancel_basic" type="button" class="btn btn-danger">Cancel</button>
                                                </div>
                                                <div class="col-sm-4 col-xs-4 col-md-4">
                                                    <button type="submit" class="btn btn-info" id="update_basic" style="float: right;">Update</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </section>
                            </div>
                            <div id="contact-3" class="tab-pane">
                                <form id="contact_form" class="form-horizontal" role="form" action="update_userContact.jsp" method="POST">
                                    <input type="hidden" name="mgt_firstname" value="<%= customerFirstName%>" />
                                    <input type="hidden" name="mgt_lastname" value="<%= user.getLast_name()%>" />
                                    <input type="hidden" name="source" value="address" />
                                    <section class="panel">
                                        <header class="panel-heading">
                                            Address
                                        </header>
                                        <div class="panel-body">
                                            <div class="form-group col-sm-12">
                                                <label for="mgt_addy">Address</label>
                                                <textarea cols="30" required rows="3" class="form-control" id="mgt_addy" name="mgt_addy" placeholder="Address" disabled
                                                          required><%= address%></textarea>
                                            </div>
                                            <div class="form-group col-sm-4">
                                                <label for="mgt_country">Country</label>
                                                <select id="mgt_country" name="mgt_country" class="form-control" required value="<%= country%>" disabled >
                                                    <!--<option value="">Select Country</option>-->
                                                </select>
                                            </div>
                                            <div class="form-group col-sm-4" style="margin-left: 15px;">
                                                <label for="mgt_city">City</label>
                                                <input type="text" class="form-control" id="mgt_city" name="mgt_city" placeholder="City" value="<%= city%>" disabled required>
                                            </div>
                                            <div class="form-group col-sm-4" style="margin-left: 15px;">
                                                <label for="mgt_postcode">Post Code</label>
                                                <input type="text" class="form-control" id="mgt_postcode" name="mgt_postcode" value="<%= postal_code%>" placeholder="Post Code" disabled>
                                            </div>
                                        </div>
                                    </section>
                                    <section class="panel">
                                        <header class="panel-heading">
                                            Phone
                                        </header>
                                        <div class="panel-body">
                                            <div class="form-group col-sm-4">
                                                <label for="mgt_landline">Land Line</label>
                                                <div class="row">
                                                    <div class="col-sm-3" style="padding-right: 0;">
                                                        <input type="text" class="form-control" id="mgt_preLandLine" name="mgt_preLandLine" value="<%= dial_code%>"
                                                               placeholder="CC" required readonly >
                                                    </div>
                                                    <div class="col-sm-9" style="padding-left: 0;">
                                                        <input type="text" class="form-control" id="mgt_landline" name="mgt_landline" placeholder="WITHOUT country dial code" value="<%= phone%>"
                                                               required disabled>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group col-sm-4" style="margin-left: 15px;">
                                                <label for="mgt_mobile">Mobile</label>
                                                <input type="text" class="form-control" id="mgt_mobile" name="mgt_mobile" placeholder="Mobile WITH country dial code" value="<%= mobile%>"
                                                        disabled>
                                            </div>
                                            <div class="form-group col-sm-4" style="margin-left: 15px;">
                                                <label for="mgt_fax">Fax</label>
                                                <input type="text" class="form-control" id="mgt_fax" name="mgt_fax" placeholder="Fax" value="<%= fax%>" disabled>
                                            </div>
                                        </div>
                                    </section>
                                    <div class="form-group col-sm-8">
                                        <button id="edit_address" type="button" class="btn btn-warning">
                                            <i class="fa fa-edit"></i> Edit</button>
                                    </div>
                                    <div class="form-group col-sm-8">
                                        <button id="cancel_address" type="button" class="btn btn-danger">Cancel</button>
                                    </div>
                                    <div class="form-group col-sm-4">
                                        <button type="submit" class="btn btn-info" id="update_address" style="float: right;">Update</button>
                                    </div>
                                </form>
                            </div>
                            <!--<div id="about-3" class="tab-pane">About</div>-->
                        </div>
                    </div>
                </section>
            </div>                
        </div>
    </section>
</aside>


<%@include file="WEB-INF/jspf/mgt_footer.jspf" %>
