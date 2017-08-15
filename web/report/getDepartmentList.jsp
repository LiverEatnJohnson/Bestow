<%-- 
  Company    : MAGi iNDUSTRIES iNC.
  Project    : Bestow
  File       : help.jsp
  Author     : LiverEatnJohnson
  Date       : Apr 30 2013
  Copyright  : (C) Jeremiah Johnson 2013
  License    : GUN GPL v3
--%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="view.vo.DepartmentVO"%>
<%@page import="java.util.List"%>
<%@page import="view.vo.OrganizationVO"%>
<%
    String oid = request.getParameter("oid");
    org.springframework.context.ApplicationContext appContext = org.springframework.web.context.support.WebApplicationContextUtils.getWebApplicationContext(pageContext.getServletContext());
    view.OrganizationView organizationView = (view.OrganizationView) appContext.getBean("organizationView");
    OrganizationVO o = organizationView.getOrganization(oid);
    List<DepartmentVO> departmentList = o.getDepartmentList();

    JSONArray arrayObj = new JSONArray();
    
    for (DepartmentVO d : departmentList) {
        JSONObject obj = new JSONObject();
        obj.put("id", d.getId());
        obj.put("title", d.getTitle());
        arrayObj.add(obj);
    }
    out.print(arrayObj);
    out.flush();
    
%>
