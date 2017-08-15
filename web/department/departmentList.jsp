<!--
  Company    : MAGi iNDUSTRIES iNC.
  Project    : Bestow
  File       : departmentList.jsp
  Author     : LiverEatnJohnson
  Date       : Feb 6 2013
  Copyright  : (C) Jeremiah Johnson 2013
  License    : GUN GPL v3
-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="view.vo.DepartmentVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="../error.jsp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%
    org.springframework.context.ApplicationContext appContext = org.springframework.web.context.support.WebApplicationContextUtils.getWebApplicationContext(pageContext.getServletContext());
    view.DepartmentView departmentView = (view.DepartmentView) appContext.getBean("departmentView");
    List<DepartmentVO> departmentList = departmentView.getListAlpha();
%>
<c:set var="list" value="<%=departmentList%>" />
<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bestow Department List</title>
        <%@include file="/WEB-INF/jspf/head.jspf"%>
        <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery.dataTables.css"/>
        <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/table.css"/>
        <!-- jQuery Start -->
        <script src="../js/jquery.dataTables.min.js"></script>
        <script src="../js/jquery.dataTables.columnFilter.js"></script>
        <script>
            $(document).ready(
                    function() {
                        $('#departmentList').dataTable().columnFilter();
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
                            <h3>Department List</h3>

                            <table id="departmentList">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Organization</th>
                                        <th>
                                            <a href="departmentAddEdit.jsp">
                                                <img id="new" src="<%=request.getContextPath()%>/images/icons/add.png" alt="Add" title="Add"/>
                                            </a>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="department" items="${list}">
                                        <tr>
                                            <td>
                                                ${department.title}
                                            </td>
                                            <td>
                                                ${department.organization.title}
                                            </td>
                                            <td style="white-space: nowrap">
                                                <a href="departmentView.jsp?id=${department.id}"><img id="view" src="<%=request.getContextPath()%>/images/icons/view.png" alt="View" title="View"/></a>
                                                <a href="departmentAddEdit.jsp?id=${department.id}"><img id="edit" src="<%=request.getContextPath()%>/images/icons/edit.png" alt="Edit" title="Edit"/></a> 
                                                <c:if test="${!department.hasEmployees}">
                                                    <a href="<%=request.getContextPath()%>/department/departmentDelete.jsp?id=${department.id}"><img id="delete" src="<%=request.getContextPath()%>/images/icons/delete.png" alt="Delete" title="Delete"/></a>
                                                </c:if>                                           
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th>Name</th>
                                        <th>Organization</th>
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
