<!--
  Company    : MAGi iNDUSTRIES iNC.
  Project    : Bestow
  File       : deleteprocess.jsp
  Author     : LiverEatnJohnson
  Date       : Feb 17 2013
  Copyright  : (C) Jeremiah Johnson 2013
  License    : GUN GPL v3
-->
<%@page import="dto.DonorDTO"%>
<%@page import="controller.DonorController"%>
<%@page import="jpa.DonorJpaController"%>

<%
  if (request.getParameter("save") != null) {
        org.springframework.context.ApplicationContext appContext = org.springframework.web.context.support.WebApplicationContextUtils.getWebApplicationContext(pageContext.getServletContext());
        view.DonorView donorView = (view.DonorView) appContext.getBean("donorView");
		
        donorView.deleteDonor(request.getParameter("id"));
        response.sendRedirect("donorList.jsp");
  } else {
        response.sendRedirect("donorList.jsp");
  }
%>
