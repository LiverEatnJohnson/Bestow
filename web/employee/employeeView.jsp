<!--
  Company    : MAGi iNDUSTRIES iNC.
  Project    : Bestow
  File       : viewemployee.jsp
  Author     : LiverEatnJohnson
  Date       : Feb 6 2013
  Copyright  : (C) Jeremiah Johnson 2013
  License    : GUN GPL v3
-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" errorPage="../error.jsp"%>
<%@ page import="view.vo.EmployeeVO"%>
<%
  org.springframework.context.ApplicationContext appContext = org.springframework.web.context.support.WebApplicationContextUtils.getWebApplicationContext(pageContext.getServletContext());
  view.EmployeeView ec = (view.EmployeeView) appContext.getBean("employeeView");
  EmployeeVO thisEmployee = ec.getEmployee(request.getParameter("id"));
%>
<c:set var="employee" value="<%=thisEmployee%>"/>
<!DOCTYPE HTML>
<html>
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Bestow View <%=thisEmployee.getFirstName()%> <%=thisEmployee.getLastName()%></title>
	<%@include file="/WEB-INF/jspf/head.jspf"%>
  </head>
  <body>
	<div id="container">
	  <div id="header" class="noPrint"><%@include file="/WEB-INF/jspf/header.jspf"%></div>
	  <table id="layout">
		<tr>
		  <td>
			<div id="menu" class="noPrint"><%@include file="/WEB-INF/jspf/menu.jspf"%></div>
		  </td>
		  <td>
			<div id="main">

			  <table id="employeeDetails" >
				<tr>
				  <td>Title:</td> <td>${employee.title}</td>
				</tr>
				<tr>
				  <td>Name:</td> <td>${employee.firstName} ${employee.lastName}</td>
				</tr>
				<tr>
				  <td>Office Phone Number:</td> <td>${employee.office}</td>
				</tr>
				<tr>
				  <td>Phone Number:</td> <td>${employee.phone}</td>
				</tr>
				<tr>
				  <td>Email:</td><td><a href="mailto:${employee.email}">${employee.email}</a></td>
				</tr>
				<tr>
				  <td>Department:</td> <td>${employee.department.title}</td>
				</tr>
				<tr>
				  <td>Organization:</td> <td>${employee.department.organization.title}</td>
				</tr>
			  </table>
			  <form action="employeeList.jsp">
				<input type="submit" value="Back" />
			  </form>
			</div>
		  </td>
		</tr>
	  </table>
	  <div id="footer" class="noPrint"><%@include file="/WEB-INF/jspf/footer.jspf"%></div>
	</div>
  </body>
</html>
