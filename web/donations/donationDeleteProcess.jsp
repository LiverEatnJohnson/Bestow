<!--
  Company    : MAGi iNDUSTRIES iNC.
  Project    : Bestow
  File       : donationdeleteprocess.jsp
  Author     : LiverEatnJohnson
  Date       : Feb 17 2013
  Copyright  : (C) Jeremiah Johnson 2013
  License    : GUN GPL v3
-->
<%
    if (request.getParameter("save") != null) {
        org.springframework.context.ApplicationContext appContext = org.springframework.web.context.support.WebApplicationContextUtils.getWebApplicationContext(pageContext.getServletContext());
        view.DonationView donationView = (view.DonationView) appContext.getBean("donationView");
        donationView.deleteDonation(request.getParameter("id"));
    }
    response.sendRedirect("donationList.jsp");
%>