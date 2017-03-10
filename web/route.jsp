<%-- 
    Document   : route
    Created on : Mar 10, 2017, 5:30:17 PM
    Author     : caniksea
--%>

<%@page import="com.hudatrans.caniksea.model.User"%>
<%
    User user = (User) session.getAttribute("user");
    if (user != null) {
        String tt = request.getParameter("tt");
        if (tt == null) {
            response.sendRedirect("indizea");
        } else {
            session.setAttribute("tnx_type", tt);
            response.sendRedirect("arbel");
        }
    } else {
        response.sendRedirect("indizea");
    }
%>
