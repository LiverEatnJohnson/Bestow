<!--
  Company    : MAGi iNDUSTRIES iNC.
  Project    : Bestow
  File       : deleteprocess.jsp
  Author     : LiverEatnJohnson
  Date       : Feb 17 2013
  Copyright  : (C) Jeremiah Johnson 2013
  License    : GUN GPL v3
-->
<%@page import="dto.EmployeeDTO"%>
<%@page import="controller.EmployeeController"%>
<%@page import="jpa.EmployeeJpaController"%>

<%
  if (request.getParameter("save") != null) {
        org.springframework.context.ApplicationContext appContext = org.springframework.web.context.support.WebApplicationContextUtils.getWebApplicationContext(pageContext.getServletContext());
        view.EmployeeView employeeView = (view.EmployeeView) appContext.getBean("employeeView");

        employeeView.deleteEmployee(request.getParameter("id"));
	
        response.sendRedirect("employeeList.jsp");
  } else {
        response.sendRedirect("employeeList.jsp");
  }
%>
