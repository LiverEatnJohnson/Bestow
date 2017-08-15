<!--
  Company    : MAGi iNDUSTRIES iNC.
  Project    : Bestow
  File       : adddonation.jsp
  Author     : LiverEatnJohnson
  Date       : Feb 17 2013
  Copyright  : (C) Jeremiah Johnson 2013
  License    : GUN GPL v3
-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="../error.jsp"%>
<%@page import="view.vo.OrganizationVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="view.vo.DepartmentVO"%>
<%@page import="view.vo.DonorVO"%>
<%@page import="view.vo.EmployeeVO"%>
<%@page import="view.vo.DonationVO"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    org.springframework.context.ApplicationContext appContext = org.springframework.web.context.support.WebApplicationContextUtils.getWebApplicationContext(pageContext.getServletContext());

    view.DepartmentView depc = (view.DepartmentView) appContext.getBean("departmentView");
    view.EmployeeView empc = (view.EmployeeView) appContext.getBean("employeeView");
    view.DonorView dc = (view.DonorView) appContext.getBean("donorView");
    view.DonationView dv = (view.DonationView) appContext.getBean("donationView");

    List<DepartmentVO> departmentList = depc.getListAlpha();
    List<EmployeeVO> employeeList = empc.getListByLastFirst();
    List<DonorVO> donorList = dc.getListByLastFirst();

    DonationVO thisDonation = null;
    if (request.getParameter("id") != null) {
        thisDonation = dv.getDonation(request.getParameter("id"));
    }

    Long donorId = null;
    if (request.getParameter("donorId") != null) {
        donorId = Long.parseLong(request.getParameter("donorId"));
    }
%>
<c:set var="donorId" value="<%=donorId%>"/>
<c:set var="deplist" value="<%=departmentList%>" />
<c:set var="emplist" value="<%=employeeList%>" />
<c:set var="dlist" value="<%=donorList%>" />
<c:set var="editMe" value="<%=thisDonation%>" />
<c:set var="editMode" value="${editMe!=null}"/>
<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bestow Add Donation</title>
        <%@include file="/WEB-INF/jspf/head.jspf"%>
        <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery-ui-1.10.2.custom.min.css"/>
        <!-- Start jQuery -->
        <script src="../js/jquery.validate.min.js"></script>
        <script src ="../js/jquery-ui-1.10.2.custom.min.js"></script>
        <script type="text/javascript" id="validationAndItems">
            var rowCount = 1;

            $(document).ready(function() {
                $("#donationAdd").validate();
                $(function() {
                    $("#donationDateString").datepicker({altFormat: "yy-mm-dd"});
                });

                $('#addNew').click(function() {
                    addRow();
                });
            <c:if test="${!editMode}">
                addRow();
            </c:if>
                });

                function addRow() {
                    var strToAdd = "<tr id='" + rowCount + "'>" +
                            "<td><input id='item_" + rowCount + "' name='item_" + rowCount + "' type='text' class='required' /></td>" +
                            "<td><input id='quantity_" + rowCount + "' name='quantity_" + rowCount + "' type='text' class='required' /></td>" +
                            "<td> $<input id='val_" + rowCount + "'name='val_" + rowCount + "' type='text'  class='required'/></td>" +
                            "<td><input id='remove' type='button' value='REMOVE' onclick='removeRow(" + rowCount + ");'/></td>" +
                            "</tr>";
                    var x = $("#itemTable");
                    $(x).append(strToAdd);
                    rowCount++;
                }

                function removeRow(rownum) {
                    var rowId = "#" + rownum;
                    var row = $(rowId);
                    $(row).remove();
                }
        </script>
        <!-- End jQuery -->
    </head>
    <body>
        <div id="container">
            <div id="header">
                <%@include file="/WEB-INF/jspf/header.jspf"%>
            </div>
            <table id="layout">
                <tr>
                    <td>
                        <div id="menu"><%@include file="/WEB-INF/jspf/menu.jspf"%></div>
                    </td>
                    <td>
                        <!-- Main Page Area Start -->
                        <div id="main">
                            <h3>New Donation</h3>
                            <!-- Donation part -->
                            <span style="color: red;">* Marks a required field</span>
                            <form method="post" action="../donor/donorAddEdit.jsp">
                                <input type='submit' value="Add New Donor"/>
                                <input type="hidden" name="from" value="donationAddPage"/>
                            </form>
                            <form  method="post" name="donationAddEdit" id="donationAdd" action="donationAddEditProcess.jsp">
                                <c:if test="${editMode}">
                                    <input type="hidden" value="${editMe.id}" name="id" />
                                </c:if>
                                <table id="donationInfo">
                                    <tr>
                                        <td>
                                            <label>Donor*</label>
                                        </td>
                                        <td>
                                            <select class="required" name="donorId" id="donorId">
                                                <c:forEach var="donor" items="${dlist}">
                                                    <c:if test="${donorId == donor.id}"> 
                                                        <option value="${donor.id}" selected ="selected">${donor.firstName} &nbsp; ${donor.lastName}</option>
                                                    </c:if>
                                                    <c:if test="${editMode}">
                                                        <c:if test="${editMe.donor.id == donor.id}">
                                                            <option value="${donor.id}" selected="selected">${donor.firstName} &nbsp; ${donor.lastName}</option>
                                                        </c:if>
                                                    </c:if>
                                                    <option value="${donor.id}">${donor.firstName} &nbsp; ${donor.lastName}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>Date*</label>
                                        </td>
                                        <td>
                                            <c:choose >
                                                <c:when test="${editMode}">
                                                    <input type="text" value="<fmt:formatDate value="${editMe.donationDate}" pattern="MM/dd/yyyy"/>" name="donationDateString" id="donationDateString" class="required" />
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="text" value="<fmt:formatDate value="<%= new java.util.Date()%>" pattern="MM/dd/yyyy"/>" name="donationDateString" id="donationDateString" class="required" />
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>Department*</label>
                                        </td>
                                        <td>
                                            <select class="required" id="department" name="departmentId">
                                                <c:forEach var="department" items="${deplist}">
                                                    <option value="${department.id}" 
                                                            <c:if test="${editMode}">
                                                                <c:if test="${editMe.department.id == department.id}">
                                                                    selected="selected"
                                                                </c:if>
                                                            </c:if>
                                                            >${department.organization.title} &nbsp; ${department.title}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>Employee*</label>
                                        </td>
                                        <td>
                                            <select class="required" id="employee" name="employeeId">
                                                <c:forEach var="employee" items="${emplist}">
                                                    <option value="${employee.id}" 
                                                            <c:if test="${editMode}">
                                                                <c:if test="${editMe.employee.id == employee.id}">
                                                                    selected="selected"
                                                                </c:if>
                                                            </c:if>
                                                            >${employee.firstName} &nbsp; ${employee.lastName}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>Type*</label>
                                        </td>
                                        <td>
                                            <select name="type" id="type" class="required">
                                                <option value="Cash"   
                                                        <c:if test="${'Cash' == editMe.type}" >
                                                            selected="selected"
                                                        </c:if> 
                                                        >Cash
                                                </option>
                                                <option value="In-Kind" 
                                                        <c:if test="${'In-Kind'==editMe.type}" >
                                                            selected="selected"
                                                        </c:if>
                                                        >In-Kind
                                                </option>
                                            </select>
                                        </td>
                                        <td>
                                            <label>Code*</label>
                                        </td>
                                        <td>
                                            <input type="text" name="code" id="code" class="required" value="${editMe.code}"/>
                                        </td>
                                    </tr>
                                </table>
                                <!-- Items part -->
                                <table id="itemTable" >
                                    <thead>
                                        <tr>
                                            <td>Item*</td>
                                            <td>Quantity*</td>
                                            <td>Value*</td>
                                            <td><input id="addNew" type="button" value="Add Row"/></td>
                                        </tr>
                                    </thead>
                                    <tbody id="itemTableRows">
                                        <c:set var="rc" value="0"/>
                                        <c:if test="${editMode}">
                                            <c:forEach var="item" items="${editMe.itemList}">
                                                <c:set var="rc" value="${rc+1}"/>
                                                <tr id='e${rc}'>
                                                    <td>
                                                        <input name='item_e${rc}' type='text' class='required' value="${item.item}"/>
                                                    </td>
                                                    <td>
                                                        <input name='quantity_e${rc}' type='text' class='required' value="${item.quantity}"/>
                                                    </td>
                                                    <td>
                                                        $<input name='val_e${rc}' type='text'  class='required' value="${item.value}"/>
                                                    </td>
                                                    <td>
                                                        <input type="button" value="REMOVE" onclick="removeRow('e${rc}');"/>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:if>
                                    </tbody>
                                </table>
                                If the donation is over $500 but under $5,000 click <a href="http://www.irs.gov/pub/irs-pdf/f8283.pdf" target="_blank">here</a> for a form 8283, that the donor needs to complete.<br>
                                Donations over $5,000 dollars need to be officially appraised.<br>
                                For a pricing guide click <a href="https://docs.google.com/viewer?url=http%3A%2F%2Fwww.goodwill.org%2Fwp-content%2Fuploads%2F2010%2F12%2FDonation_Valuation_Guide.pdf" target="_blank">here</a> for the Valuation guide for Goodwill donors.
                                <hr/>
                                <input type="submit" id="submit" name="save" value="Save Donation"/>
                                <c:if test="${editMe == null}">
                                    <input type="submit" id="again" name="addmore" value="Add Another"/>
                                </c:if>
                                <input class="cancel" type="submit" id="back" value="Cancel" name="back"/>
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