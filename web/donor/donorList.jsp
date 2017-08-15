<!--
  Company    : MAGi iNDUSTRIES iNC.
  Project    : Bestow
  File       : donorList.jsp
  Author     : LiverEatnJohnson
  Date       : Feb 6 2013
  Copyright  : (C) Jeremiah Johnson 2013
  License    : GUN GPL v3
-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="view.vo.DonorVO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="../error.jsp"%>
<%
  org.springframework.context.ApplicationContext appContext = org.springframework.web.context.support.WebApplicationContextUtils.getWebApplicationContext(pageContext.getServletContext());
  view.DonorView donorView = (view.DonorView) appContext.getBean("donorView");
  List<DonorVO> donorList = donorView.getListByLastFirst();
%>
<c:set var="list" value="<%=donorList%>" />
<!DOCTYPE HTML>
<html>
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Bestow Donor List</title>
	<%@include file="/WEB-INF/jspf/head.jspf"%>
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery.dataTables.css"/>
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/table.css"/>
	<!-- jQuery Start -->
	<script src="../js/jquery.dataTables.min.js"></script>
        <script src="../js/jquery.dataTables.columnFilter.js"></script>
	<script>
	  $(document).ready(
			  function() {
				$('#donorList').dataTable().columnFilter();
			  }
	  );

	</script> 
	<!-- jQuery End -->
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
			<!-- Main Page Area Start-->
			<div id="main">
			  <h3>Donor List</h3>
			  <table id="donorList">
				<thead>
				  <tr>
					<th>Last Name</th>
					<th>First Name</th>
                                        <th>Type</th>
					<th>Phone Number</th>
					<th>
					  <a href="<%=request.getContextPath()%>/donor/donorAddEdit.jsp">
						<img id="new" src="<%=request.getContextPath()%>/images/icons/add.png" alt="Add" title="Add"/>
					  </a>
					</th>
				  </tr>
				</thead>
				<tbody>
				  <c:forEach var="donor" items="${list}">
					<tr>
					  <td>
						${donor.lastName}
					  </td>
					  <td>
						${donor.firstName}
					  </td>
                                          <td>
						${donor.type}
					  </td>
					  <td>
						${donor.phone}
					  </td>
					  <td style="white-space: nowrap">
						<a href="<%=request.getContextPath()%>/donor/donorView.jsp?id=${donor.id}"><img id="view" src="<%=request.getContextPath()%>/images/icons/view.png" alt="View" title="View"/></a>
						<a href="<%=request.getContextPath()%>/donor/donorAddEdit.jsp?id=${donor.id}"><img id="edit" src="<%=request.getContextPath()%>/images/icons/edit.png" alt="Edit" title="Edit"/></a> 
						  <c:if test="${!donor.hasDonations}">
						  <a href="<%=request.getContextPath()%>/donor/donorDelete.jsp?id=${donor.id}"><img id="delete" src="<%=request.getContextPath()%>/images/icons/delete.png" alt="Delete" title="Delete"/></a>
						  </c:if>                                            
					  </td>
					</tr>
				  </c:forEach>
				</tbody>
				<tfoot>
				  <tr>
					<th>Last Name</th>
					<th>First Name</th>
                                        <th>Type</th>
					<th>Phone Number</th>
					<th></th>
				  </tr>
				</tfoot>
			  </table>
			</div>
			<!-- Main Page Area End-->
		  </td>
		</tr>
	  </table>
	  <div id="footer" class="noPrint"><%@include file="/WEB-INF/jspf/footer.jspf"%></div>
	</div>
  </body>
</html>
