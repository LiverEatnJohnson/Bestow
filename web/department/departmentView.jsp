<!--
  Company    : MAGi iNDUSTRIES iNC.
  Project    : Bestow
  File       : viewdepartment.jsp
  Author     : LiverEatnJohnson
  Date       : Feb 6 2013
  Copyright  : (C) Jeremiah Johnson 2013
  License    : GUN GPL v3
-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" errorPage="../error.jsp"%>
<%@ page import="view.vo.OrganizationVO"%>
<%@page import="view.vo.DepartmentVO"%>
<%
    org.springframework.context.ApplicationContext appContext = org.springframework.web.context.support.WebApplicationContextUtils.getWebApplicationContext(pageContext.getServletContext());
    view.DepartmentView dc = (view.DepartmentView) appContext.getBean("departmentView");
    DepartmentVO thisDepartment = dc.getDepartment(request.getParameter("id"));
%>
<c:set var="department" value="<%=thisDepartment%>" />
<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bestow View Department</title>
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
                        <!-- Main Page Area Start -->
                        <div id="main">
                            <h3>View Department</h3>
                            <table id="organizationInfo">
                                <tr>
                                    <td>
                                        <label>Organization:</label>
                                    </td>
                                    <td>
                                        ${department.organization.title}
                                    </td>
                                </tr>
                                <tr>
                                    <td><label>Name:</label></td>
                                    <td>${department.title}</td>
                                </tr>
                                <tr>
                                    <c:choose>
                                        <c:when test="${department.director != null}">
                                            <td>Director:</td><td>${department.director.title} ${department.director.firstName} ${department.director.lastName}</td>
                                        </c:when>
                                        <c:otherwise>
                                            <td>Director:</td><td>None Assigned</td>
                                        </c:otherwise>
                                    </c:choose>
                                </tr>
                            </table>
                            <h4>Employee List</h4>
                            <table>
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>First Name</th>
                                        <th>Last Name</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="employee" items="${department.employeeList}">
                                        <tr>
                                            <td>${employee.id}</td>
                                            <td>${employee.firstName}</td>
                                            <td>${employee.lastName}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <!-- Main Page Area End -->
                    </td>
                </tr>
            </table>
            <form action="departmentList.jsp">
                <input type="submit" value="Back" />
            </form>
            <div id="footer" class="noPrint"><%@include file="/WEB-INF/jspf/footer.jspf"%></div>
        </div>
    </body>
</html>
