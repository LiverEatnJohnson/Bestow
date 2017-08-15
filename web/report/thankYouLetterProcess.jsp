<%-- 
  Company    : MAGi iNDUSTRIES iNC.
  Project    : Bestow
  File       : help.jsp
  Author     : LiverEatnJohnson
  Date       : Apr 30 2013
  Copyright  : (C) Jeremiah Johnson 2013
  License    : GUN GPL v3
--%>
<%@page import="net.sf.jasperreports.engine.JasperExportManager"%>
<%@page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@page import="net.sf.jasperreports.engine.JasperFillManager"%>
<%@page import="net.sf.jasperreports.engine.JasperReport"%>
<%@page import="net.sf.jasperreports.engine.JasperCompileManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="application/pdf" pageEncoding="UTF-8" errorPage="../error.jsp"%>
<%
    Long donationId = Long.parseLong(request.getParameter("id"));
    Map<String, Object> hm = new HashMap<String, Object>();
    hm.put("P_donationId", donationId);
    hm.put("letterHead", application.getRealPath("/WEB-INF/reports/hrdcLetterHead.png"));
    Connection con = DriverManager.getConnection("jdbc:postgresql://moodle.ibic.org:5432/Bestow", "bestow_admin", "%TGB5tgb");
    JasperReport allDonationsReport = JasperCompileManager.compileReport(application.getRealPath("/WEB-INF/reports/DonationThankYouLetter.jrxml"));
    JasperPrint jasperPrint = JasperFillManager.fillReport(allDonationsReport, hm, con);
    JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
%>
