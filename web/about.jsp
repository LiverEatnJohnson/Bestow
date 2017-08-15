<%-- 
  Company    : MAGi iNDUSTRIES iNC.
  Project    : Bestow
  File       : about.jsp
  Author     : LiverEatnJohnson
  Date       : Feb 12 2013
  Copyright  : (C) Jeremiah Johnson 2013
  License    : GUN GPL v3
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About Bestow Version 0.2</title>
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
                        <div id="main" style="float: right;">
                            <br>
                            <p id="gnu">
                                Bestow's source code is copyrighted by Jeremiah Johnson and licensed under the GNU GPL v3 
                                <a rel="license" href="http://www.gnu.org/licenses/quick-guide-gplv3.html">
                                    <img alt="GNU GPL v3 License" style="border-width: 0" src="<%=request.getContextPath()%>/images/license/gplv3.png" />
                                </a>
                            </p>
                            <br>
                            <p id="cc">
                                <a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/deed.en_US">
                                    <img alt="Creative Commons License" style="border-width:0" src="<%=request.getContextPath()%>/images/license/cc.png" />
                                </a>
                                <br />
                                <span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">
                                    Bestow and it's content except for information held in it's databases or otherwise claimed is Copyrighted 
                                </span>
                                by 
                                <span xmlns:cc="http://creativecommons.org/ns#" property="cc:attributionName">
                                    Jeremiah Johnson
                                </span> 
                                and is licensed under a 
                                <a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/deed.en_US">
                                    Creative Commons Attribution-ShareAlike 3.0 Unported License
                                </a>.
                            </p>
                            <br>
                            <p id="thanks">
                                Special Thanks to Jay Howland Professor College of Technical Sciences MSU-Northern for supervising this project.
                            </p>
                            <br>
                            <br>
                        </div>
                    </td>
                </tr>
            </table>
            <div id="footer" class="noPrint"><%@include file="/WEB-INF/jspf/footer.jspf"%></div>
        </div>
    </body>
</html>

