<!--
  Company    : MAGi iNDUSTRIES iNC.
  Project    : Bestow
  File       : donationDelete.jsp
  Author     : LiverEatnJohnson
  Date       : Feb 17 2013
  Copyright  : (C) Jeremiah Johnson 2013
  License    : GUN GPL v3
-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" errorPage="../error.jsp"%>
<%@ page import="view.vo.DonationVO"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
  org.springframework.context.ApplicationContext appContext = org.springframework.web.context.support.WebApplicationContextUtils.getWebApplicationContext(pageContext.getServletContext());
  view.DonationView dc = (view.DonationView) appContext.getBean("donationView");
  DonationVO thisDonation = dc.getDonation(request.getParameter("id"));
%>
<c:set var="donation" value="<%=thisDonation%>" />
<c:set var="itemList" value="<%=thisDonation.getItemList()%>" />
<!DOCTYPE HTML>
<html>
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Bestow</title>
	<%@include file="/WEB-INF/jspf/head.jspf"%>
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
			<div id="main">
			  <h3 style="color: red;">Delete Donation</h3>
			  <h3>Donation From <br />
				${donation.donor.firstName} &nbsp; ${donation.donor.lastName}</h3>
			  <table id="donationInfo">
				<tr>
				  <td>To:</td> <td>${donation.department.organization.title}</td> &nbsp; <td>${donation.department.title}</td>
				</tr>
				<tr>
				  <td>On:</td> <td><fmt:formatDate value="${donation.donationDate}" pattern="MM/dd/yyyy"/></td>
				</tr>
				<tr>
				  <td>Received By:</td> <td>${donation.employee.firstName} &nbsp; ${donation.employee.lastName}</td>
				</tr>
				<tr>
				  <td>Type:</td> <td>${donation.type}</td> <td>Code:</td> <td>${donation.code}</td>
				</tr>
			  </table>
			  <table id="itemInfo">
				<tr>
				  <th>Item</th>
				  <th>Quantity</th>
				  <th>Value</th>
				</tr>
				<c:forEach var="item" items="${itemList}">
				  <tr>
					<td>${item.item}</td>
					<td>${item.quantity}</td>
					<td>$ ${item.value}</td>
				  </tr>
				</c:forEach>
			  </table>
			  <hr />
			  <br>Total: $ ${donation.total}</br> 
			  <hr />
			  <form name="deleting" id="deleting" method="post" action="donationDeleteProcess.jsp">
				<input type="hidden" value="${donation.id}" name="id"/>
				<input type="submit" value="Yes" id="submit" name="save"/>
				<input type="submit" value="Cancel" name="cancel" id="cancel"/>                           
			  </form>
			</div>
		  </td>
		</tr>
	  </table>
	  <div id="footer"><%@include file="/WEB-INF/jspf/footer.jspf"%></div>
	</div>
  </body>
</html>
