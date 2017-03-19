<%-- 
    Document   : delete_beneficiary
    Created on : Jan 27, 2017, 1:36:21 PM
    Author     : caniksea
--%>

<%@page import="com.hudatrans.caniksea.model.GenericCollectionResponse"%>
<%@page import="com.hudatrans.caniksea.model.PostGenericResponse"%>
<%@page import="com.hudatrans.caniksea.controller.RPEngine"%>
<%@page import="com.hudatrans.caniksea.model.User"%>
<%
    User user = (User) session.getAttribute("user");
    if (user != null) {
        String beneficiary_id = request.getParameter("bg_benid");

        RPEngine engine = new RPEngine();

        PostGenericResponse pgr = engine.deleteBeneficiary(beneficiary_id);
        if (pgr.getResponse_code().equals("00")) {
            GenericCollectionResponse gcr = engine.getBeneficiaries(user);
            if (gcr.getResponse_code().equals("00")) {
                session.setAttribute("beneficiaries", gcr.getResponse_data());
            }
            session.setAttribute("success", pgr.getResponse_description());
        } else {
            session.setAttribute("error", pgr.getResponse_description());
        }
        response.sendRedirect("benepisyaryo");
    } else {
        response.sendRedirect("indizea");
    }
%>
