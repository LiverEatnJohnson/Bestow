<!--
  Company    : MAGi iNDUSTRIES iNC.
  Project    : Bestow
  File       : organizationdeleteprocess.jsp
  Author     : LiverEatnJohnson
  Date       : Feb 17 2013
  Copyright  : (C) Jeremiah Johnson 2013
  License    : GUN GPL v3
-->
<%@page import="dto.OrganizationDTO"%>
<%@page import="controller.OrganizationController"%>
<%@page import="jpa.OrganizationJpaController"%>
<%
  if (request.getParameter("save") != null) {
        org.springframework.context.ApplicationContext appContext = org.springframework.web.context.support.WebApplicationContextUtils.getWebApplicationContext(pageContext.getServletContext());
        view.OrganizationView organizationView = (view.OrganizationView) appContext.getBean("organizationView");

        organizationView.deleteOrganization(request.getParameter("id"));
        response.sendRedirect("organizationList.jsp");
  } else {
        response.sendRedirect("organizationList.jsp");
  }
%>
