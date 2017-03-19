<%-- 
    Document   : logout
    Created on : Jan 25, 2017, 6:45:46 PM
    Author     : caniksea
--%>

<%
    session.invalidate();
    response.sendRedirect("indizea");
%>
