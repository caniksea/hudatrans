<%-- 
    Document   : pre_add_sales
    Created on : Jan 31, 2017, 6:24:58 PM
    Author     : caniksea
--%>

<%@page import="com.hudatrans.caniksea.controller.RPEngine"%>
<%@page import="com.hudatrans.caniksea.model.TransactionRequest"%>
<%@page import="com.hudatrans.caniksea.model.User"%>
<%
    User user = (User) session.getAttribute("user");

    if (user != null) {
        RPEngine engine = new RPEngine();

        String merchantCode = request.getParameter("merchant_code");
        String destinationCountry = request.getParameter("bg_countryCode");
        String payMethod = request.getParameter("pay_method");
        String sourceAmount = request.getParameter("source_amount");
        
        System.out.println(merchantCode);
        System.out.println(destinationCountry);
        System.out.println(payMethod);
        System.out.println(sourceAmount);
        
        try {
            double sourceAmountDbl = Double.parseDouble(sourceAmount);
            TransactionRequest tr = TransactionRequest.builder().merchant_code(merchantCode)
                    .source_amount(sourceAmountDbl).destination_country(destinationCountry)
                    .pay_method(payMethod).build();

            TransactionRequest responseTR = engine.initiateTransaction(tr);

            if (responseTR.getResponse_code().equals("00")) {
                session.setAttribute("TransactionRequest", responseTR); //set transaction session
                response.sendRedirect("pagbabayad");
            } else {
                session.setAttribute("error", responseTR.getResponse_description());
                response.sendRedirect("arbel");
            }
        } catch (Exception e) {
            session.setAttribute("error", e.getMessage());
            response.sendRedirect("arbel");
        }
    } else {
        response.sendRedirect("indizea");
    }
%>
