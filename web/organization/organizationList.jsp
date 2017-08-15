<!--
  Company    : MAGi iNDUSTRIES iNC.
  Project    : Bestow
  File       : organizationList.jsp
  Author     : LiverEatnJohnson
  Date       : Feb 6 2013
  Copyright  : (C) Jeremiah Johnson 2013
  License    : GUN GPL v3
-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="view.vo.OrganizationVO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="../error.jsp"%>
<%
    org.springframework.context.ApplicationContext appContext = org.springframework.web.context.support.WebApplicationContextUtils.getWebApplicationContext(pageContext.getServletContext());
    view.OrganizationView organizationView = (view.OrganizationView) appContext.getBean("organizationView");
    List<OrganizationVO> organizationList = organizationView.getList();
%>
<c:set var="list" value="<%=organizationList%>" />
<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bestow Organization List</title>
        <%@include file="/WEB-INF/jspf/head.jspf"%>
        <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery.dataTables.css"/>
        <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/table.css"/>
        <!-- jQuery Start -->
        <script src="../js/jquery.dataTables.min.js"></script>
        <script src="../js/jquery.dataTables.columnFilter.js"></script>
        <script>
            $(document).ready(
                    function() {
                        $('#organizationList').dataTable().columnFilter();
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
                            <h3>Organization List</h3>

                            <table id="organizationList">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>
                                            <a href="<%=request.getContextPath()%>/organization/organizationAddEdit.jsp">
                                                <img id="new" src="<%=request.getContextPath()%>/images/icons/add.png" alt="Add" title="Add"/>
                                            </a>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="organization" items="${list}">
                                        <tr>
                                            <td>
                                                ${organization.title}
                                            </td>
                                            <td style="white-space: nowrap">
                                                <a href="<%=request.getContextPath()%>/organization/organizationView.jsp?id=${organization.id}"><img id="view" src="<%=request.getContextPath()%>/images/icons/view.png" alt="View" title="View"/></a>
                                                <a href="<%=request.getContextPath()%>/organization/organizationAddEdit.jsp?id=${organization.id}"><img id="edit" src="<%=request.getContextPath()%>/images/icons/edit.png" alt="Edit" title="Edit"/></a> 
												<c:if test="${!organization.hasDepartments}">
                                                    <a href="<%=request.getContextPath()%>/organization/organizationDelete.jsp?id=${organization.id}"><img id="delete" src="<%=request.getContextPath()%>/images/icons/delete.png" alt="Delete" title="Delete"/></a>
                                                    </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th>Name</th>
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
