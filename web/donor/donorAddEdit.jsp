<!--
  Company    : MAGi iNDUSTRIES iNC.
  Project    : Bestow
  File       : adddonor.jsp
  Author     : LiverEatnJohnson
  Date       : Feb 17 2013
  Copyright  : (C) Jeremiah Johnson 2013
  License    : GUN GPL v3
-->
<%@page import="view.vo.DonorVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="../error.jsp"%>
<%
    org.springframework.context.ApplicationContext appContext = org.springframework.web.context.support.WebApplicationContextUtils.getWebApplicationContext(pageContext.getServletContext());
    view.DonorView dc = (view.DonorView) appContext.getBean("donorView");

    DonorVO thisDonor = null;
    if (request.getParameter("id") != null) {
        thisDonor = dc.getDonor(request.getParameter("id"));
    }

    String from = request.getParameter("from");
%>
<c:set var="editMe" value="<%=thisDonor%>"/>
<c:set var="editMode" value="${editMe!=null}"/>
<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bestow Add Donor</title>
        <%@include file="/WEB-INF/jspf/head.jspf"%>
        <!-- Start jQuery -->
        <script src="../js/jquery.validate.min.js"></script>
        <script type="text/javascript" id="validation">
            $(document).ready(function() {
                $("#donorAdd").validate();
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
                            <h3>New Donor</h3>
                            <span style="color: red;">* Marks a required field</span>
                            <form action="donorAddEditProcess.jsp" method="post" name="donorAdd" id="donorAdd">
                                <c:if test="${editMode}">
                                    <input type="hidden" value="${editMe.id}" name="id" />
                                </c:if>
                                <%
                                    if (from != null) {
                                %>
                                <input type="hidden" name="from" value="<%=from%>"/>
                                <%
                                    }
                                %>
                                <table id="donorInfo">
                                    <tr>
                                        <td>
                                            <label>First Name</label>
                                        </td>
                                        <td>
                                            <input type="text" value="${editMe.firstName}" id="firstName" name="firstName" maxlength="20"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>Last Name*</label>
                                        </td>
                                        <td>
                                            <input class="required" value="${editMe.lastName}" type="text" id="lastName" name="lastName" maxlength="20"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>Type</label>
                                        </td>
                                        <td>
                                            <input value="${editMe.type}" type="text" id="type" name="type"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>E-mail</label>
                                        </td>
                                        <td>
                                            <input type="text" id="email" value="${editMe.email}" name="email" maxlength="100"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>Address</label>
                                        </td>
                                        <td>
                                            <textarea id="address" maxlength="255" rows="4" cols="20" wrap="hard" name="address">${editMe.address}</textarea>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>City</label>
                                        </td>
                                        <td>
                                            <input id="city" type="text" value="${editMe.city}" name="city" maxlength="255"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>State</label>
                                        </td>
                                        <td>
                                            <input id="state" type="text" value="${editMe.state}" name="state" maxlength="2"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>Zip Code</label>
                                        </td>
                                        <td>
                                            <input id="zip" type="text" name="zip" value="${editMe.zip}" maxlength="12"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><label>Phone Number</label></td>
                                        <td>
                                            <input id="phone" type="text" name="phone" value="${editMe.phone}" maxlength="14"/> 
                                        </td>
                                        <td>(555) 555-5555</td>
                                    </tr>
                                    <tr>
                                </table>
                                <input type="submit" id="submit" name="save" value="Save Donor"/>
                                <%
                                    if (from == null) {
                                %>
                                <c:if test="${!editMode}">
                                    <input type="submit" id="again" name="addmore" value="Add Another"/>
                                </c:if>
                                <%                                    }
                                %>
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
