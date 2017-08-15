<!--
  Company    : MAGi iNDUSTRIES iNC.
  Project    : Bestow
  File       : departmentaddprocess.jsp
  Author     : LiverEatnJohnson
  Date       : Feb 17 2013
  Copyright  : (C) Jeremiah Johnson 2013
  License    : GUN GPL v3
-->
<jsp:useBean id="dto" class="dto.DepartmentDTO" scope="page" />
<jsp:setProperty name="dto" property="*" />
<%
    if (request.getParameter("save") != null || request.getParameter("addmore") != null) {
        org.springframework.context.ApplicationContext appContext = org.springframework.web.context.support.WebApplicationContextUtils.getWebApplicationContext(pageContext.getServletContext());
        view.DepartmentView departmentView = (view.DepartmentView) appContext.getBean("departmentView");

        if (request.getParameter("id") != null) {
            departmentView.editDepartment(dto);
        } else {
            departmentView.saveDepartment(dto);
        }
    }
    if (request.getParameter("addmore") != null) {
        response.sendRedirect("departmentAddEdit.jsp");
    } else {
        response.sendRedirect("departmentList.jsp");
    }
%>
