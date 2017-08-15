<%-- 
  Company    : MAGi iNDUSTRIES iNC.
  Project    : Bestow
  File       : help.jsp
  Author     : LiverEatnJohnson
  Date       : Apr 30 2013
  Copyright  : (C) Jeremiah Johnson 2013
  License    : GUN GPL v3
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="java.sql.Connection"%>
<%@page import="net.sf.jasperreports.engine.data.JRJpaDataSource"%>
<%@page import="net.sf.jasperreports.engine.JasperExportManager"%>
<%@page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@page import="net.sf.jasperreports.engine.JRDataSource"%>
<%@page import="net.sf.jasperreports.engine.JasperFillManager"%>
<%@page import="net.sf.jasperreports.engine.JasperCompileManager"%>
<%@page import="net.sf.jasperreports.engine.JasperReport"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.net.URL"%>
<%@page import="view.vo.DepartmentVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="application/pdf" errorPage="../error.jsp"%>
<%
    SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
    //TODO: fix these to accept nulls
    Date startDate = null;
    try {
        startDate = sdf.parse(request.getParameter("startDate"));
    } catch (Exception e) {
    }

    Date endDate = null;
    try {
        endDate = sdf.parse(request.getParameter("endDate"));
    } catch (Exception e) {
    }

    Long donorId = null;
    try {
        donorId = Long.parseLong(request.getParameter("donorId"));
    } catch (Exception e) {
    }

    String type = request.getParameter("type");
    if (type.equals("All")) {
        type = null;
    }

    Map<String, Object> hm = new HashMap<String, Object>();
    hm.put("P_startDate", startDate);
    hm.put("P_endDate", endDate);
    hm.put("P_donorId", donorId);
    hm.put("P_donationType", type);
    Connection con = DriverManager.getConnection("jdbc:postgresql://moodle.ibic.org:5432/Bestow", "bestow_admin", "%TGB5tgb");
    JasperReport allDonationsReport = JasperCompileManager.compileReport(application.getRealPath("/WEB-INF/reports/FromDonor.jrxml"));
    JasperPrint jasperPrint = JasperFillManager.fillReport(allDonationsReport, hm, con);
    JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
%>