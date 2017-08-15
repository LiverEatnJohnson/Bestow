<!--
  Company    : MAGi iNDUSTRIES iNC.
  Project    : Bestow
  File       : adddepartment.jsp
  Author     : LiverEatnJohnson
  Date       : Feb 17 2013
  Copyright  : (C) Jeremiah Johnson 2013
  License    : GUN GPL v3
-->
<%@page import="view.vo.EmployeeVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="../error.jsp"%>
<%@page import="view.vo.OrganizationVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="view.vo.DepartmentVO"%>
<%
  org.springframework.context.ApplicationContext appContext = org.springframework.web.context.support.WebApplicationContextUtils.getWebApplicationContext(pageContext.getServletContext());
  view.OrganizationView oc = (view.OrganizationView) appContext.getBean("organizationView");
  view.DepartmentView dc = (view.DepartmentView) appContext.getBean("departmentView");

  DepartmentVO thisDepartment = null;
  if (request.getParameter("id") != null) {
	thisDepartment = dc.getDepartment(request.getParameter("id"));
  }

  List<EmployeeVO> employeeList = null;
  if (request.getParameter("id") != null) {
	employeeList = thisDepartment.getEmployeeList();
  }

  List<OrganizationVO> organizationList = oc.getList();
%>
<c:set var="list" value="<%=organizationList%>"/>
<c:set var="editMe" value="<%=thisDepartment%>"/>
<c:set var="editMode" value="${editMe!=null}"/>
<c:set var="employeeList" value="<%=employeeList%>"/>
<!DOCTYPE HTML>
<html>
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Bestow Add Department</title>
	<%@include file="/WEB-INF/jspf/head.jspf"%>
	<!-- Start jQuery -->
	<script src="../js/jquery.validate.min.js"></script>
	<script type="text/javascript" id="validation">
	  $(document).ready(function() {
		$("#departmentAdd").validate();
	  });
	</script>
	<!-- End jQuery -->
  </head>
  <body>
	<div id="container">
	  <div id="header"><%@include file="/WEB-INF/jspf/header.jspf"%></div>
	  <table id="layout">
		<tr>
		  <td>
			<div id="menu"><%@include file="/WEB-INF/jspf/menu.jspf"%></div>
		  </td>
		  <td>
			<!-- Main Page Area Start -->
			<div id="main">
			  <h3>Department</h3>
			  <span style="color: red;">* Marks a required field</span>
			  <form action="departmentAddEditProcess.jsp" method="post" name="departmentAdd" id="departmentAdd">
				<c:if test="${editMode}">
				  <input type="hidden" value="${editMe.id}" name="id" />
				</c:if>
				<table id="departmentInfo">
				  <tr>
					<td>
					  <label>Name*</label>
					</td>
					<td>
					  <input class="required" value="${editMe.title}" type="text" id="title" name="title" maxlength="100"/>
					</td>
				  </tr>
				  <tr>
					<td>
					  <label>Organization</label>
					</td>
					<td>
					  <select class="required" id="organization" name="organizationId">
						<c:forEach var="organization" items="${list}">
						  <option value="${organization.id}" 
								  <c:if test="${editMode}">
									<c:if test="${editMe.organization.id == organization.id}">
									  selected="selected"
									</c:if>
								  </c:if>
								  >${organization.title}
						  </option>
						</c:forEach>
					  </select>
					</td>
				  </tr>
				  <c:if test="${editMode}">
					<tr>
					  <td>
						<label>Director</label>
					  </td>
					  <td>
						<select id="director" name="directorId">
						  <option value=""> None </option>
						  <c:forEach var="employee" items="${employeeList}">
							<option value="${employee.id}" 
									<c:if test="${editMode}">
									  <c:if test="${editMe.director.id == employee.id}">
										selected="selected"
									  </c:if>
									</c:if>
									>${employee.title} ${employee.firstName} ${employee.lastName}
							</option>
						  </c:forEach>
						</select>
					  </td>
					</tr>
				  </c:if>
				</table>
				<input type="submit" id="submit" name="save" value="Save Department"/>
				<c:if test="${!editMode}">
				  <input type="submit" id="again" name="addmore" value="Add Another"/>
				</c:if>
				<input class="cancel" type="submit" id="back" value="Cancle" name="back"/>
			  </form>
			  <!-- Main Page Area End -->
			</div>
		  </td>
		</tr>
	  </table>
	  <div id="footer"><%@include file="/WEB-INF/jspf/footer.jspf"%></div>
	</div>
  </body>
</html>
