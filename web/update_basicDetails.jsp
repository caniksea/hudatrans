<%-- 
    Document   : update_basicDetails
    Created on : Mar 9, 2017, 5:46:14 PM
    Author     : caniksea
--%>

<%@page import="com.hudatrans.caniksea.controller.RPEngine"%>
<%@page import="com.hudatrans.caniksea.model.PostGenericResponse"%>
<%@page import="com.hudatrans.caniksea.model.User"%>
<%
    String source = request.getParameter("source");
    String firstName = request.getParameter("mgt_firstname") == null ? "" : request.getParameter("mgt_firstname").trim();
    String lastName = request.getParameter("mgt_lastname") == null ? "" : request.getParameter("mgt_lastname").trim();
    String dob = request.getParameter("mgt_dob") == null ? "" : request.getParameter("mgt_dob").trim();

    User user = (User) session.getAttribute("user");
    if (user != null) {
        RPEngine engine = new RPEngine();
        User tempUser = User.builder().copy(user).first_name(firstName).last_name(lastName)
                .dob(dob).build();

        PostGenericResponse pgr = engine.updateUser(tempUser);
        if (pgr.getResponse_code().equals("00")) {
            user = engine.getUserFromJson(pgr.getData());
            session.setAttribute("user", user); //set user session
            session.setAttribute("success", pgr.getResponse_description());
        } else {
            session.setAttribute("error", pgr.getResponse_description());
        }
        String redirectString = source.equals("address") ? "profile#contact-3" : "profile";
        response.sendRedirect(redirectString);
    } else {
        response.sendRedirect("indizea");
    }
%>
