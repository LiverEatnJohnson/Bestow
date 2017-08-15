<!--
  Company    : MAGi iNDUSTRIES iNC.
  Project    : Bestow
  File       : index.jsp
  Author     : LiverEatnJohnson
  Date       : Feb 6 2013
  Copyright  : (C) Jeremiah Johnson 2013
  License    : GUN GPL v3
-->
<!--TODO:/save second version of war as no create-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bestow</title>
        <%@include file="/WEB-INF/jspf/head.jspf"%>
    </head>
    <body>
        <div id="container">

            <div id="header" class="noPrint"><%@include file="WEB-INF/jspf/header.jspf"%></div>
            <table id="layout">
                <tr>
                    <td>
                        <div id="menu" class="noPrint"><%@include file="WEB-INF/jspf/menu.jspf"%></div>
                    </td>
                    <td>
                        <div id="main" class="noPrint">
                            <table id="common">
                                <tr>
                                    <td colspan="2"><a href="<%=request.getContextPath()%>/donations/donationAddEdit.jsp">Receive a Donation</a></td>
                                </tr>
                                <tr>
                                    <td><a href="<%=request.getContextPath()%>/donor/donorAddEdit.jsp">Add a New Donor</a></td>
                                </tr>
                            </table>

                        </div>
                    </td>
                </tr>
            </table>
            <div id="footer" class="noPrint"><%@include file="WEB-INF/jspf/footer.jspf"%></div>
        </div>
    </body>
</html>
