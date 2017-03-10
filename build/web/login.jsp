<%-- 
    Document   : login
    Created on : Jan 6, 2017, 6:51:02 PM
    Author     : caniksea
--%>
<%@page import="com.hudatrans.caniksea.model.GenericCollectionResponse"%>
<%@page import="com.hudatrans.caniksea.controller.RPEngine"%>
<%@page import="com.hudatrans.caniksea.model.User"%>
<%@page import="com.hudatrans.caniksea.model.TransactionRequest"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String currentPage = "login";
    String source = request.getParameter("sp") == null ? "" : request.getParameter("sp");
    String merchantCode = "";
    String destinationCountry = "";
    String payMethod = "";
    String sourceAmount = "";
    String message = "";
    String css_style = "msg";
    boolean showMsg = false;

    if (source.equals("home")) {
        merchantCode = request.getParameter("merchant_code");
        destinationCountry = request.getParameter("destination_country_code");
        payMethod = request.getParameter("pay_method");
        sourceAmount = request.getParameter("source_amount");

        try {
            double sourceAmountDbl = Double.parseDouble(sourceAmount);
            TransactionRequest tr = TransactionRequest.builder().merchant_code(merchantCode)
                    .source_amount(sourceAmountDbl).destination_country(destinationCountry)
                    .pay_method(payMethod).build();
            session.setAttribute("TransactionRequest", tr);

            User user = (User) session.getAttribute("user");
            if (user != null) {
                RPEngine engine = new RPEngine();
                TransactionRequest responseTR = engine.initiateTransaction(tr);
                if (responseTR.getResponse_code().equals("00")) {
                    session.setAttribute("TransactionRequest", responseTR); //set transaction session

                    GenericCollectionResponse gcr = engine.getBeneficiaries(user);

                    if (gcr.getResponse_code().equals("00")) {
                        session.setAttribute("beneficiaries", gcr.getResponse_data());
                        response.sendRedirect("select_beneficiary");
                    } else {
//                        session.setAttribute("error", gcr.getResponse_description());
//                        response.sendRedirect("identifier");
                    }
                } else {
                    session.setAttribute("error", responseTR.getResponse_description());
                    response.sendRedirect("identifier");
                }
            }

        } catch (Exception e) {
            response.sendRedirect("index.jsp");
        }
    } else if (source.equals("r")) {
    } else {
        message = (String) session.getAttribute("error");
        if (message != null && !message.isEmpty()) {
            showMsg = true;
            css_style += " msg-error";
            session.removeAttribute("error");
        }
    }
%>

<%@include file="WEB-INF/jspf/top-head.jspf" %>
<%@include file="WEB-INF/jspf/nav-header.jspf" %>

<div class="container">
    <div class="container_inner default_template_holder clearfix page_container_inner" >
        <div class="vc_row wpb_row section vc_row-fluid  vc_custom_1468974318634" style=' text-align:left;'>
            <div class=" full_section_inner clearfix">
                <div class="wpb_column vc_column_container vc_col-sm-4">
                    <div class="vc_column-inner ">
                        <div class="wpb_wrapper"></div>                            
                    </div>                        
                </div>
                <div class="wpb_column vc_column_container vc_col-sm-4">
                    <div class="vc_column-inner ">
                        <div class="wpb_wrapper">
                            <div class="wpb_raw_code wpb_content_element wpb_raw_html">
                                <div class="wpb_wrapper">
                                    <div class="login-box">
                                        <div class="details-container">
                                            <form method="POST" action="ensaluti" >
                                                <% if (showMsg) {%>                                                
                                                <div class="<%= css_style%>"><%= message%></div>
                                                <% }%>
                                                <div class="input-container">
                                                    <input id="l_customer_email" placeholder="Please enter email" type="email" name="l_customer_email" required/>
                                                </div>
                                                <div class="input-container">
                                                    <input id="l_password" placeholder="Enter Password" type="password" name="l_password" required/>
                                                </div>
                                                <button id="log-in-btn" class="btn button-submit"  type="submit" value="Login" name="checktrack">Log in</button>
                                            </form>
                                            <a class="" href="../forgot-password/index.html">Forgot your password?</a>
                                            <div class="spacer-or"><span>or</span></div>
                                            <div class="social-buttons">
                                                <a href="http://conscraftpayments.themoneytransferapplication.com/social_external_login?social-provider=facebook" class="button-facebook">
                                                    <span class="facebook-icon"></span>Login with Facebook</a>
                                                <a href="http://conscraftpayments.themoneytransferapplication.com/social_external_login?social-provider=google" class="button-google">
                                                    <span class="google-icon"></span> Login with Google</a>
                                            </div>
                                            <a class="" href="registrate?sp=l">Don't have an account? Sign up for free!</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="wpb_column vc_column_container vc_col-sm-4">
                    <div class="vc_column-inner ">
                        <div class="wpb_wrapper"></div>                            
                    </div>                        
                </div>                    
            </div>                
        </div>
    </div>
</div>

<%@include file="WEB-INF/jspf/bottom-end.jspf" %>