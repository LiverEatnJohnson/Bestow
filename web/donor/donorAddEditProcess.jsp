<!--
  Company    : MAGi iNDUSTRIES iNC.
  Project    : Bestow
  File       : donoraddprocess.jsp
  Author     : LiverEatnJohnson
  Date       : Feb 17 2013
  Copyright  : (C) Jeremiah Johnson 2013
  License    : GUN GPL v3
-->
<%@page import="dto.DonorDTO"%>
<%@page import="controller.DonorController"%>
<%@page import="jpa.DonorJpaController"%>
<jsp:useBean id="dto" class="dto.DonorDTO" scope="page"/>
<jsp:setProperty name="dto" property="*"/>
<%@page import="entity.Donor"%>
<%
    if (request.getParameter("save") != null || request.getParameter("addmore") != null) {
        org.springframework.context.ApplicationContext appContext = org.springframework.web.context.support.WebApplicationContextUtils.getWebApplicationContext(pageContext.getServletContext());
        view.DonorView donorView = (view.DonorView) appContext.getBean("donorView");
        
        Long xdonorId = null;
        if (request.getParameter("id") != null) {
            donorView.editDonor(dto);
        } else {
            xdonorId = donorView.saveDonor(dto).getId();
            
        }

        if (request.getParameter("from") != null) {
            response.sendRedirect("../donations/donationAddEdit.jsp?donorId=" + xdonorId);
        } else if (request.getParameter("save") != null) {
            response.sendRedirect("donorList.jsp");
        } else if (request.getParameter("addmore") != null) {
            response.sendRedirect("donorAddEdit.jsp");
        }
    } else if (request.getParameter("from") != null) {
        response.sendRedirect("../donations/donationAddEdit.jsp?donorId=" + dto.getId());
    } else {
        response.sendRedirect("donorList.jsp");
    }
%>
