<!--
  Company    : MAGi iNDUSTRIES iNC.
  Project    : Bestow
  File       : reportList.jsp
  Author     : LiverEatnJohnson
  Date       : Apr 12 2013
  Copyright  : (C) Jeremiah Johnson 2013
  License    : GUN GPL v3
-->
<%@page import="view.vo.DonorVO"%>
<%@page import="java.util.List"%>
<%@page import="view.vo.DepartmentVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="view.vo.OrganizationVO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="../error.jsp"%>
<%
    org.springframework.context.ApplicationContext appContext = org.springframework.web.context.support.WebApplicationContextUtils.getWebApplicationContext(pageContext.getServletContext());
    view.DepartmentView departmentView = (view.DepartmentView) appContext.getBean("departmentView");
    view.DonorView donorView = (view.DonorView) appContext.getBean("donorView");
    view.OrganizationView organizationView = (view.OrganizationView) appContext.getBean("organizationView");
    List<DonorVO> donorList = donorView.getListByLastFirst();
    List<OrganizationVO> orgList = organizationView.getList();
%>    
<c:set var="orgList" value="<%=orgList%>"/>
<c:set var="donorList" value="<%=donorList%>"/>
<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bestow</title>
        <%@include file="/WEB-INF/jspf/head.jspf"%>
        <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery-ui-1.10.2.custom.min.css"/>
        <!-- Start jQuery -->
        <script src="../js/jquery.validate.min.js"></script>
        <script src ="../js/jquery-ui-1.10.2.custom.min.js"></script>
        <script type="text/javascript" id="validationAndItems">
            $(document).ready(function() {
                $("#organizationList").change(function() {
                    loadDepartments();
                });
                $("#AllDonationsParameters").validate();
                $("#FromDonorParameters").validate();
                $(function() {
                    $("#AstartDate").datepicker({altFormat: "yy-mm-dd"});
                });
                $(function() {
                    $("#AendDate").datepicker({altFormat: "yy-mm-dd"});
                });
                $(function() {
                    $("#FstartDate").datepicker({altFormat: "yy-mm-dd"});
                });
                $(function() {
                    $("#FendDate").datepicker({altFormat: "yy-mm-dd"});
                });
            });

            function loadDepartments() {
                var $oInput = $("#organizationList");
                var oid = $($oInput, ":selected").val();
                $.getJSON('getDepartmentList.jsp',
                        {'oid': oid},
                function(data) {
                    var $el = $("#departmentList");
                    $el.empty();
                    $el.append($("<option></option").text("All"));
                    $.each(data, function(key, val) {
                        $el.append($("<option></option>").attr("value", val.id).text(val.title));
                    });
                });
            }
            ;
        </script>
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
                            <div id="allDonationsReport">
                                <form action="allDonationsReportProcess.jsp" method="post" id="AllDonationsParameters" name="AllDonationsParameters" target="_blank">
                                    <table>
                                        <tr>
                                            <td colspan="5"><label>All Donations Report</label></td>
                                        </tr>
                                        <tr>
                                            <td><label>Start Date:</label></td><td><input type="text" name="startDate" id="AstartDate" value=""/></td>
                                            <td><label>End Date:</label></td><td><input type="text" value="<fmt:formatDate value="<%= new java.util.Date()%>" pattern="MM/dd/yyyy"/>" name="endDate" id="AendDate"/> Leave blank to report on all donations.</td>
                                        </tr>
                                        <tr>
                                            <td><label>Organization:</label></td>
                                            <td colspan="5">
                                                <select id="organizationList" name="organizationId">
                                                    <option>All</option>
                                                    <c:forEach var="organization" items="${orgList}">
                                                        <option value="${organization.id}">${organization.title}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><label>Department:</label></td>
                                            <td colspan="5">
                                                <select id="departmentList" name="departmentId">
                                                    <option>All</option>
                                                    <!--TODO: rest filled in with jquery -->
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><label>Donor:</label></td>
                                            <td colspan="5">
                                                <select id="donor" name="donorId">
                                                    <option>All</option>
                                                    <c:forEach var="donor" items="${donorList}">
                                                        <option value="${donor.id}">${donor.lastName} ${donor.firstName}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><label>Type</label></td>
                                            <td colspan="5">
                                                <select id="type" name="type">
                                                    <option value="All">All</option>
                                                    <option value="In-Kind">In-Kind</option>
                                                    <option value="Cash">Cash</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><input type="submit" name="submit" value="Submit"/></td>
                                        </tr>
                                    </table>
                                </form>
                            </div>
                            <br><br>
                            <div id="fromDonorReport">
                                <form action="fromDonorReportProcess.jsp" method="post" id="FromDonorParameters" name="FromDonorParameters" target="_blank">
                                    <table>
                                        <tr>
                                            <td colspan="5"><label>From Donor Report</label></td>
                                        </tr>
                                        <tr>
                                            <td><label>Start Date:</label></td><td><input type="text" name="startDate" id="FstartDate"/></td>
                                            <td><label>End Date:</label></td><td><input type="text" value="<fmt:formatDate value="<%= new java.util.Date()%>" pattern="MM/dd/yyyy"/>" name="endDate" id="FendDate"/> Leave blank to report on all donations.</td>
                                        </tr>
                                        <tr>
                                            <td><label>Donor:</label></td>
                                            <td colspan="5">
                                                <select id="donor" name="donorId">
                                                    <option value="">All</option>
                                                    <c:forEach var="donor" items="${donorList}">
                                                        <option value="${donor.id}">${donor.lastName} ${donor.firstName}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><label>Type</label></td>
                                            <td colspan="5">
                                                <select id="type" name="type">
                                                    <option value="All">All</option>
                                                    <option value="In-Kind">In-Kind</option>
                                                    <option value="Cash">Cash</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><input type="submit" name="submit" value="Submit"/></td>
                                        </tr>
                                    </table>
                                </form>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
            <div id="footer"><%@include file="/WEB-INF/jspf/footer.jspf"%></div>
        </div>
    </body>
</html>
