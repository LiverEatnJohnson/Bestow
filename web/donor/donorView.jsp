<!--
  Company    : MAGi iNDUSTRIES iNC.
  Project    : Bestow
  File       : viewdonor.jsp
  Author     : LiverEatnJohnson
  Date       : Feb 6 2013
  Copyright  : (C) Jeremiah Johnson 2013
  License    : GUN GPL v3
-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" errorPage="../error.jsp"%>
<%@ page import="view.vo.DonorVO"%>
<%
  org.springframework.context.ApplicationContext appContext = org.springframework.web.context.support.WebApplicationContextUtils.getWebApplicationContext(pageContext.getServletContext());
  view.DonorView dc = (view.DonorView) appContext.getBean("donorView");
  DonorVO thisDonor = dc.getDonor(request.getParameter("id"));
%>
<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bestow</title>
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

                            <table id="donorDetails" >
                                <tr>
                                    <td>Name:</td> <td><%=thisDonor.getFirstName()%> <%=thisDonor.getLastName()%></td>
                                </tr>
                                <tr>
                                    <td></td><td colspan="3"><%=thisDonor.getAddress()%></td>
                                </tr>
                                <tr>
                                    <td></td> <td><%=thisDonor.getCity()%>, <%=thisDonor.getState()%> <%=thisDonor.getZip()%></td>
                                </tr>
                                <tr>
                                    <td>Type:</td><td><%=thisDonor.getType()%></td>
                                </tr>
                                <tr>
                                    <td>Phone Number:</td> <td><%=thisDonor.getPhone()%></td>
                                </tr>
                                <tr>
                                    <td>E-Mail:</td> <td><a href="mailto:<%=thisDonor.getEmail()%>"><%=thisDonor.getEmail()%></a></td>
                                </tr>
                            </table>
                            <form action="donorList.jsp">
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
