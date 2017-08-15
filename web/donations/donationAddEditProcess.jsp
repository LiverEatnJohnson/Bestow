<%@page import="dto.DonationDTO"%>
<!--
  Company    : MAGi iNDUSTRIES iNC.
  Project    : Bestow
  File       : donationaddprocess.jsp
  Author     : LiverEatnJohnson
  Date       : Feb 17 2013
  Copyright  : (C) Jeremiah Johnson 2013
  License    : GUN GPL v3
-->
<%@page import="java.util.Enumeration"%>
<%@page import="dto.ItemDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@page import="java.text.SimpleDateFormat"%>
<jsp:useBean id="dto" class="dto.DonationDTO" scope="page" />
<jsp:setProperty name="dto" property="*" />
<%
    if (request.getParameter("save") != null || request.getParameter("addmore") != null) {
        org.springframework.context.ApplicationContext appContext = org.springframework.web.context.support.WebApplicationContextUtils.getWebApplicationContext(pageContext.getServletContext());
        view.DonationView donationView = (view.DonationView) appContext.getBean("donationView");

        List<ItemDTO> itemList = new ArrayList<ItemDTO>();
        Enumeration<String> en = request.getParameterNames();
        while (en.hasMoreElements()) {
            String name = en.nextElement();
            if (name.startsWith("item_")) {
                String num = name.substring(5);
                String item = request.getParameter(name);
                String val = request.getParameter("val_" + num);
                String qu = request.getParameter("quantity_" + num);
                try {
                    ItemDTO idto = new ItemDTO();
                    idto.setItem(item);
                    idto.setQuantity(Double.parseDouble(qu));
                    idto.setValue(Double.parseDouble(val));
                    itemList.add(idto);
                } catch (Exception e) {
                }
            }
        }
        dto.setItemList(itemList);

        if (request.getParameter("id") != null) {
            donationView.editDonation(dto); 
        } else {
            donationView.saveDonation(dto);
        }

    }

    if (request.getParameter("addmore") != null) {
        response.sendRedirect("donationAddEdit.jsp");
    } else {
        response.sendRedirect("donationList.jsp");
    }
%>
