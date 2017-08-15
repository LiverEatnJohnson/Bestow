<!--
  Company    : MAGi iNDUSTRIES iNC.
  Project    : Bestow
  File       : employeeaddprocess.jsp
  Author     : LiverEatnJohnson
  Date       : Feb 17 2013
  Copyright  : (C) Jeremiah Johnson 2013
  License    : GUN GPL v3
-->
<%@page import="dto.EmployeeDTO"%>
<%@page import="controller.EmployeeController"%>
<%@page import="jpa.EmployeeJpaController"%>
<jsp:useBean id="dto" class="dto.EmployeeDTO" scope="page"/>
<jsp:setProperty name="dto" property="*"/>
<%
  if (request.getParameter("save") != null || request.getParameter("addmore") != null) {
        org.springframework.context.ApplicationContext appContext = org.springframework.web.context.support.WebApplicationContextUtils.getWebApplicationContext(pageContext.getServletContext());
        view.EmployeeView employeeView = (view.EmployeeView) appContext.getBean("employeeView");

        if (request.getParameter("id") != null) {
            employeeView.editEmployee(dto);
        } else {
            employeeView.saveEmployee(dto);
        }
  }

  if (request.getParameter("save") != null) {
        response.sendRedirect("employeeList.jsp");
  } else if (request.getParameter("addmore") != null) {
        response.sendRedirect("employeeAddEdit.jsp");
  } else {
        response.sendRedirect("employeeList.jsp");
  }
%>
