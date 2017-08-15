<!--
  Company    : MAGi iNDUSTRIES iNC.
  Project    : Bestow
  File       : organizationaddprocess.jsp
  Author     : LiverEatnJohnson
  Date       : Feb 17 2013
  Copyright  : (C) Jeremiah Johnson 2013
  License    : GUN GPL v3
-->
<%@page import="dto.OrganizationDTO"%>
<%@page import="controller.OrganizationController"%>
<%@page import="jpa.OrganizationJpaController"%>
<jsp:useBean id="dto" class="dto.OrganizationDTO" scope="page"/>
<jsp:setProperty name="dto" property="*"/>
<%
  if (request.getParameter("save") != null || request.getParameter("addmore") != null) {
        org.springframework.context.ApplicationContext appContext = org.springframework.web.context.support.WebApplicationContextUtils.getWebApplicationContext(pageContext.getServletContext());
        view.OrganizationView organizationView = (view.OrganizationView) appContext.getBean("organizationView");

        if (request.getParameter("id") != null) {
            organizationView.editOrganization(dto);
        } else {
            organizationView.saveOrganization(dto);
        }
  }

  if (request.getParameter("save") != null) {
        response.sendRedirect("organizationList.jsp");
  } else if (request.getParameter("addmore") != null) {
        response.sendRedirect("organizationAddEdit.jsp");
  } else {
        response.sendRedirect("organizationList.jsp");
  }
%>
