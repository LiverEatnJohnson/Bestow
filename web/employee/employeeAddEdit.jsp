<!--
  Company    : MAGi iNDUSTRIES iNC.
  Project    : Bestow
  File       : adddonor.jsp
  Author     : LiverEatnJohnson
  Date       : Feb 17 2013
  Copyright  : (C) Jeremiah Johnson 2013
  License    : GUN GPL v3
-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="../error.jsp"%>
<%@page import="view.vo.DepartmentVO"%>
<%@page import="java.util.List"%>
<%@page import="view.vo.EmployeeVO"%>
<%
    org.springframework.context.ApplicationContext appContext = org.springframework.web.context.support.WebApplicationContextUtils.getWebApplicationContext(pageContext.getServletContext());
    view.DepartmentView dc = (view.DepartmentView) appContext.getBean("departmentView");
    view.EmployeeView ec = (view.EmployeeView) appContext.getBean("employeeView");

    EmployeeVO thisEmployee = null;
    if (request.getParameter("id") != null) {
        thisEmployee = ec.getEmployee(request.getParameter("id"));
    }

    List<DepartmentVO> departmentList = dc.getListAlpha();
%>
<c:set var="editMe" value="<%=thisEmployee%>"/>
<c:set var="editMode" value="${editMe!=null}"/>
<c:set var="list" value="<%=departmentList%>" />
<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bestow Add Employee</title>
        <%@include file="/WEB-INF/jspf/head.jspf"%>
        <!-- Start jQuery -->
        <script src="../js/jquery.validate.min.js"></script>
        <script type="text/javascript" id="validation">
            $(document).ready(function() {
                $("#employeeAdd").validate();
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
                            <h3>New Employee</h3>
                            <span style="color: red;">* Marks a required field</span>
                            <form action="employeeAddEditProcess.jsp" method="post" name="employeeAdd" id="employeeAdd">
                                <c:if test="${editMode}">
                                    <input type="hidden" value="${editMe.id}" name="id" />
                                </c:if>
                                <table id="employeeInfo">
                                    <tr>
                                        <td>
                                            <label>First Name*</label>
                                        </td>
                                        <td>
                                            <input class="required" type="text" value="${editMe.firstName}" id="firstName" name="firstName" maxlength="20"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>Last Name*</label>
                                        </td>
                                        <td>
                                            <input class="required" type="text" value="${editMe.lastName}" id="lastName" name="lastName" maxlength="20"/>
                                        </td>
                                    </tr>
									<tr>
                                        <td>
                                            <label>Title*</label>
                                        </td>
                                        <td>
                                            <input class="required" type="text" value="${editMe.title}" id="title" name="title" maxlength="20"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>Email Address*</label>
                                        </td>
                                        <td>
                                            <input class="required" type="text" value="${editMe.email}" id="email" name="email"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>Phone Number*</label>
                                        </td>
                                        <td>
                                            <input class="required" type="text" value="${editMe.phone}" id="phone" name="phone" maxlength="14"/>(555) 123-4567
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>Office Phone Number*</label>
                                        </td>
                                        <td>
                                            <input class="required" type="text" value="${editMe.office}" id="office" name="office" maxlength="25"/>(555) 123-4567
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>Department*</label>
                                        </td>
                                        <td colspan="3">
                                            <select class="required" id="department" name="departmentId">
                                                <c:forEach var="department" items="${list}">
                                                    <option value="${department.id}" 
                                                            <c:if test="${editMode}">
                                                                <c:if test="${editMe.department.id == department.id}">
                                                                    selected="selected"
                                                                </c:if>
                                                            </c:if>
                                                            >${department.title} &nbsp; ${department.organization.title}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                    </tr>
                                </table>
                                <input type="submit" id="submit" name="save" value="Save Employee"/>
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
