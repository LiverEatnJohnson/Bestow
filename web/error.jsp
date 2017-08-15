<%-- 
  Company    : MAGi iNDUSTRIES iNC.
  Project    : Bestow
  File       : error.jsp
  Author     : LiverEatnJohnson
  Date       : Feb 12 2013
  Copyright  : (C) Jeremiah Johnson 2013
  License    : GUN GPL v3
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="true"%>

<%
    String message = request.getParameter("message");
%>
<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bestow !!ERROR!!</title>
        <%@include file="/WEB-INF/jspf/head.jspf"%>
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

                            <p style="text-align: center;">
                                OOOOPS!? Something went wrong.<br/>
                                <%=exception.getMessage()%><br/>
                                <%=message%>
                                Push the back button and try your action again.<br/>
                                If this problem continues, consult the help page.
                            </p>

                        </div>
                    </td>
                </tr>
            </table>
            <div id="footer"><%@include file="/WEB-INF/jspf/footer.jspf"%></div>
        </div>
    </body>
</html>
