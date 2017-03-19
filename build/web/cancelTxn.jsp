<%-- 
    Document   : cancelTxn
    Created on : Jan 26, 2017, 3:46:13 PM
    Author     : caniksea
--%>

<%@page import="com.hudatrans.caniksea.model.User"%>
<%
    User user = (User) session.getAttribute("user");
    if(user != null){
        session.removeAttribute("TransactionRequest");
        response.sendRedirect("arbel");
    }else{
        response.sendRedirect("indizea");
    }
%>
