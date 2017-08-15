<!--
  Company    : MAGi iNDUSTRIES iNC.
  Project    : Bestow
  File       : vieworganization.jsp
  Author     : LiverEatnJohnson
  Date       : Feb 6 2013
  Copyright  : (C) Jeremiah Johnson 2013
  License    : GUN GPL v3
-->
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="view.vo.DepartmentVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" errorPage="../error.jsp"%>
<%@ page import="view.vo.OrganizationVO"%>
<%
  org.springframework.context.ApplicationContext appContext = org.springframework.web.context.support.WebApplicationContextUtils.getWebApplicationContext(pageContext.getServletContext());
  view.OrganizationView oc = (view.OrganizationView) appContext.getBean("organizationView");
  OrganizationVO thisOrganization = oc.getOrganization(request.getParameter("id"));
  List<DepartmentVO> orgsDeps = new ArrayList<DepartmentVO>();

  for (DepartmentVO d : thisOrganization.getDepartmentList()) {
        orgsDeps.add(d);
  }
%>
<c:set var="deplist" value="<%=orgsDeps%>"/>
<c:set var="organization" value="<%=thisOrganization%>"/>
<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bestow</title>
        <%@include file="/WEB-INF/jspf/head.jspf"%>
    </head>
    <body>
        <div id="container">
            <div id="header"  class="noPrint"><%@include file="/WEB-INF/jspf/header.jspf"%></div>
            <table id="layout">
                <tr>
                    <td>
                        <div id="menu"  class="noPrint"><%@include file="/WEB-INF/jspf/menu.jspf"%></div>
                    </td>
                    <td>
                        <div id="main">

                            <table id="organizationDetails" >
                                <tr>
                                    <td>Name:</td><td>${organization.title}</td>
                                </tr>
                                <tr>
                                    <c:choose>
                                        <c:when test="${organization.director != null}">
                                            <td>Director:</td><td>${organization.director.title} ${organization.director.firstName} ${organization.director.lastName}</td>
                                        </c:when>
                                        <c:otherwise>
                                            <td>Director:</td><td>None Assigned</td>
                                        </c:otherwise>
                                    </c:choose>
                                </tr>
                                <tr>
                                    <td>Departments:</td>
                                </tr>
                                <c:forEach var="department" items="${deplist}">
                                    <tr>
                                        <td></td><td>${department.title}</td>
                                    </tr>
                                </c:forEach>
                            </table>
                            <form action="organizationList.jsp">
                                <input type="submit" value="Back" />
                            </form>
                        </div>
                    </td>
                </tr>
            </table>
            <div id="footer"  class="noPrint"><%@include file="/WEB-INF/jspf/footer.jspf"%></div>
        </div>
    </body>
</html>
