<!--
  Company    : MAGi iNDUSTRIES iNC.
  Project    : Bestow
  File       : donationList.jsp
  Author     : LiverEatnJohnson
  Date       : Feb 6 2013
  Copyright  : (C) Jeremiah Johnson 2013
  License    : GUN GPL v3
-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="view.vo.DonationVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="../error.jsp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    org.springframework.context.ApplicationContext appContext = org.springframework.web.context.support.WebApplicationContextUtils.getWebApplicationContext(pageContext.getServletContext());
    view.DonationView donationView = (view.DonationView) appContext.getBean("donationView");
    List<DonationVO> donationList = donationView.getListAlpha();
%>
<c:set var="list" value="<%=donationList%>" />
<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bestow Donation List</title>
        <%@include file="/WEB-INF/jspf/head.jspf"%>
        <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery.dataTables.css"/>
        <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/table.css"/>
        <!-- jQuery Start -->
        <script src="../js/jquery.dataTables.min.js"></script>
        <script src="../js/jquery.dataTables.columnFilter.js"></script>
        <script>
            $(document).ready(
                    function() {
                        $('#donationList').dataTable().columnFilter();
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
                            <h3>Donation List</h3>

                            <table id="donationList">
                                <thead>
                                    <tr>
                                        <th>Donor</th>
                                        <th>Donor Type</th>
                                        <th>Date</th>
                                        <th>Receiving Department</th>
                                        <th>Receiving Employee</th>
                                        <th>Type</th>
                                        <th>Code</th>
                                        <th>Value</th>
                                        <th>
                                            <a href="donationAddEdit.jsp">
                                                <img id="new" src="<%=request.getContextPath()%>/images/icons/add.png" alt="Add" title="Add"/>
                                            </a>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="donation" items="${list}">
                                        <tr>
                                            <td>
                                                ${donation.donor.lastName}, &nbsp; ${donation.donor.firstName}
                                            </td>
                                            <td>
                                                ${donation.donor.type}
                                            </td>
                                            <td>
                                                <fmt:formatDate value="${donation.donationDate}" pattern="MM/dd/yyyy"/>
                                            </td>
                                            <td>
                                                ${donation.department.title} Department of ${donation.department.organization.title}
                                            </td>
                                            <td>
                                                ${donation.employee.lastName}, &nbsp; ${donation.employee.firstName}
                                            </td>
                                            <td>
                                                ${donation.type}
                                            </td>
                                            <td>
                                                ${donation.code}
                                            </td>
                                            <td style="text-align: right">
                                                <fmt:formatNumber type="currency" value="${donation.total}"/>
                                            </td>
                                            <td style="white-space: nowrap">
                                                <a href="../report/donationReportProcess.jsp?id=${donation.id}" target="_blank"><img id="view" src="<%=request.getContextPath()%>/images/icons/view.png" alt="View" title="View"/></a>
                                                <a href="../report/thankYouLetterProcess.jsp?id=${donation.id}" target="_blank"><img id="view" src="<%=request.getContextPath()%>/images/icons/email.png" alt="Thank You Letter" title="Thank You Letter"/></a>
                                                <a href="donationAddEdit.jsp?id=${donation.id}"><img id="edit" src="<%=request.getContextPath()%>/images/icons/edit.png" alt="Edit" title="Edit"/></a> 
                                                <a href="donationDelete.jsp?id=${donation.id}"><img id="delete" src="<%=request.getContextPath()%>/images/icons/delete.png" alt="Delete" title="Delete"/></a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th>Donor</th>
                                        <th>Donor Type</th>
                                        <th>Date</th>
                                        <th>Receiving Department</th>
                                        <th>Receiving Employee</th>
                                        <th>Type</th>
                                        <th>Code</th>
                                        <th>Value</th>
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
