<!--
  Company    : MAGi iNDUSTRIES iNC.
  Project    : Bestow
  File       : deletedonor.jsp
  Author     : LiverEatnJohnson
  Date       : Feb 17 2013
  Copyright  : (C) Jeremiah Johnson 2013
  License    : GUN GPL v3
-->
<%@page import="view.vo.DonorVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" errorPage="../error.jsp"%>
<%@ page import="dto.DonorDTO"%>
<%
  org.springframework.context.ApplicationContext appContext = org.springframework.web.context.support.WebApplicationContextUtils.getWebApplicationContext(pageContext.getServletContext());
  view.DonorView dc = (view.DonorView) appContext.getBean("donorView");
  DonorVO thisDonor = dc.getDonor(request.getParameter("id"));
%>
<c:set var="donor" value="<%=thisDonor%>"/>
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
			  <h3 style="color: red;">Deleting Donor, <%=thisDonor.getLastName()%> <%=thisDonor.getFirstName()%> Are You Sure?</h3>

			  <form name="deleting" id="deleting" method="post" action="donorDeleteProcess.jsp">
                                <input type="hidden" value="${donor.id}" name="id"/>
                                <h3 style="color: red;">Are You Sure?</h3>
                                <input type="submit" value="Yes, Delete Donor" id="submit" name="save"/>
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
