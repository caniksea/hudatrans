<%-- 
    Document   : update_userContact
    Created on : Mar 9, 2017, 8:26:09 PM
    Author     : caniksea
--%>

<%@page import="com.hudatrans.caniksea.model.PostGenericResponse"%>
<%@page import="com.hudatrans.caniksea.controller.RPEngine"%>
<%@page import="com.hudatrans.caniksea.model.User"%>
<%
    String source = request.getParameter("source");
    String firstName = request.getParameter("mgt_firstname") == null ? "" : request.getParameter("mgt_firstname").trim();
    String lastName = request.getParameter("mgt_lastname") == null ? "" : request.getParameter("mgt_lastname").trim();
    String address = request.getParameter("mgt_addy") == null ? "" : request.getParameter("mgt_addy").trim();
    String country = request.getParameter("mgt_country") == null ? "" : request.getParameter("mgt_country").trim();
    String city = request.getParameter("mgt_city") == null ? "" : request.getParameter("mgt_city").trim();
    String postalCode = request.getParameter("mgt_postcode") == null ? "" : request.getParameter("mgt_postcode").trim();
    String dialCode = request.getParameter("mgt_preLandLine") == null ? "" : request.getParameter("mgt_preLandLine").trim();
    String landLine = request.getParameter("mgt_landline") == null ? "" : request.getParameter("mgt_landline").trim();
    String mobile = request.getParameter("mgt_mobile") == null ? "" : request.getParameter("mgt_mobile").trim();
    String fax = request.getParameter("mgt_fax") == null ? "" : request.getParameter("mgt_fax").trim();
    
    String phone = dialCode + "-" + landLine;
    phone = phone.trim().equals("-") ? "" : phone.trim();

    User user = (User) session.getAttribute("user");
    if (user != null) {
        RPEngine engine = new RPEngine();
        User tempUser = User.builder().copy(user).first_name(firstName).last_name(lastName)
                .address(address).country(country).city(city).postal_code(postalCode)
                .phone(phone).mobile(mobile).fax(fax).build();

        PostGenericResponse pgr = engine.updateUser(tempUser);
        if (pgr.getResponse_code().equals("00")) {
            user = engine.getUserFromJson(pgr.getData());
            session.setAttribute("user", user); //set user session
            session.setAttribute("success", pgr.getResponse_description());
        } else {
            session.setAttribute("error", pgr.getResponse_description());
        }
        response.sendRedirect("profile#contact-3");
    } else {
        response.sendRedirect("indizea");
    }
%>
