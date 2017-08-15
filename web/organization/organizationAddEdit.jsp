<!--
  Company    : MAGi iNDUSTRIES iNC.
  Project    : Bestow
  File       : addorganization.jsp
  Author     : LiverEatnJohnson
  Date       : Feb 17 2013
  Copyright  : (C) Jeremiah Johnson 2013
  License    : GUN GPL v3
-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="../error.jsp"%>
<%@page import="view.vo.DepartmentVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="view.vo.OrganizationVO"%>
<%@page import="view.vo.EmployeeVO"%>
<%@page import="java.util.List"%>
<%
  org.springframework.context.ApplicationContext appContext = org.springframework.web.context.support.WebApplicationContextUtils.getWebApplicationContext(pageContext.getServletContext());
  view.OrganizationView oc = (view.OrganizationView) appContext.getBean("organizationView");
  view.EmployeeView ec = (view.EmployeeView) appContext.getBean("employeeView");

  OrganizationVO thisOrganization = null;
  if (request.getParameter("id") != null) {
	thisOrganization = oc.getOrganization(request.getParameter("id"));
  }

  List<EmployeeVO> employeeList = null;
  if (request.getParameter("id") != null) {
	employeeList = new ArrayList<EmployeeVO>();
	for (DepartmentVO d : thisOrganization.getDepartmentList()) {
	  for (EmployeeVO e : d.getEmployeeList()) {
		employeeList.add(e);
	  }
	}
  }
%>
<c:set var="editMe" value="<%=thisOrganization%>"/>
<c:set var="editMode" value="${editMe!=null}"/>
<c:set var="employeeList" value="<%=employeeList%>"/>
<!DOCTYPE HTML>
<html>
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Bestow Add Organization</title>
	<%@include file="/WEB-INF/jspf/head.jspf"%>
	<!-- Start jQuery -->
	<script src="../js/jquery.validate.min.js"></script>
	<script type="text/javascript" id="validation">
	  $(document).ready(function() {
		$("#organizationAdd").validate();
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
			  <h3>New Organization</h3>
			  <span style="color: red;">* Marks a required field</span>
			  <form action="organizationAddEditProcess.jsp" method="post" name="organizationAdd" id="organizationAdd">
				<c:if test="${editMode}">
				  <input type="hidden" value="${editMe.id}" name="id" />
				</c:if>
				<table id="organizationInfo">
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
					  <label>Address*</label>
					</td>
					<td>
					  <textarea class="required" name="address" id="address" rows="4" cols="20" maxlength="255" wrap="hard">${editMe.address}</textarea>
					</td>
				  </tr>
				  <tr>
					<td>
					  <label>City*</label>
					</td>
					<td>
					  <input class="required" value="${editMe.city}" type="text" id="city" name="city"/>
					</td>
				  </tr>
				  <tr>
					<td>
					  <label>State*</label>
					</td>
					<td>
					  <input class="required" value="${editMe.state}" type="text" id="state" name="state" maxlength="2"/>
					</td>
				  </tr>
				  <tr>
					<td>
					  <label>zip*</label>
					</td>
					<td>
					  <input class="required" value="${editMe.zip}" type="text" id="zip" name="zip" maxlength="11"/>
					</td>
				  </tr>
				  <tr>
					<td>
					  <label>Phone Number*</label>
					</td>
					<td>
					  <input class="required" value="${editMe.phone}" type="text" id="phone" name="phone" maxlength="14"/>
					</td><td>(555) 123-4567</td>
				  </tr>
				  <tr>
					<td>
					  <label>Toll Free Number</label>
					</td>
					<td>
					  <input value="${editMe.tollFree}" type="text" id="tollfree" name="tollFree" maxlength="20"/>
					</td><td>1 (800) 123-4567</td>
				  </tr>
				  <tr>
					<td>
					  <label>Fax Number</label>
					</td>
					<td>
					  <input value="${editMe.fax}" type="text" id="fax" name="fax" maxlength="15"/>
					</td><td>(555) 123-4567</td>
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
									>${employee.title} ${employee.firstName} ${employee.lastName} from ${employee.department.title}
							</option>
						  </c:forEach>
						</select>
					  </td>
					</tr>
				  </c:if>
				  <tr>
					<td>
					  <label>Email Address</label>
					</td>
					<td>
					  <input value="${editMe.emailAddress}" type="text" id="emailaddress" name="emailAddress"/>
					</td>
				  </tr>
				</table>
				<input type="submit" id="submit" name="save" value="Save Organization"/>
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
