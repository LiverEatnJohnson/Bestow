<%-- 
  Company    : MAGi iNDUSTRIES iNC.
  Project    : Bestow
  File       : help.jsp
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
        <title>Bestow Help</title>
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
                        <div id="main">
                            <p id="contact">
                                For support or help with this product contact Jeremiah Johnson. <br>
                                Phone:<br>
                                (701) 741-1318<br>
                                Email:<br>
                                <a href="mailto:jeremiahcjohnson1@gmail.com?subject=Help Wtih Bestow">jeremiahcjohnson1@gmail.com</a>
                            </p>
                            <div id="contents">
                                <p>
                                <table>
                                    <tr>
                                        <td>
                                            <a href="#manageDonors">How to Manage Donors</a> 
                                        </td>
                                        <td>
                                            <a href="#manageOrganizations">How to Manage Organizations</a>
                                        </td>
                                        <td>
                                            <a href="#manageDepartments">How to Manage Departments</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <a href="#manageEmployees">How to Manage Employees</a>
                                        </td>
                                        <td>
                                            <a href="#manageDonations">How to Manage Donations</a>
                                        </td>
                                        <td>
                                            <a href="#reports">Reports</a>
                                        </td>
                                    </tr>
                                </table>
                                </p>
                            </div>
                            <div id="help">
                                <p id="manageDonors">
                                <h7>Managing Donors</h7>
                                <p>
                                    &nbsp;&nbsp;<h5>The Donor List</h5>
                                &nbsp;&nbsp;&nbsp;&nbsp;The Donor List can be accessed by clicking on the word "Donor" in the 
                                main menu.  Once the list of Donors appears in alphabetical order by last name.  You can sort
                                the list in descending alphabetical order by last name with a click on the last name header,
                                the same with the first name and phone number by clicking on them.  On the top left of the list
                                is a box that lets you choose how many Donors are shown on the list, to go to the next or back
                                to the last screen by clicking on the next or previous buttons at the bottom right of the list.
                                You can also search the list by typing the search criteria in to the box labeled search.  Below
                                each column is also a filter to limit the data on the list.  Donor
                                management is explained in the next few sections. &nbsp; <a href="#contents">Top</a>
                                </p>
                                <p>
                                    &nbsp;&nbsp;<h5>Adding a Donor</h5>
                                &nbsp;&nbsp;&nbsp;&nbsp;To add a new donor you can click on the "Add a New Donor" link  on the 
                                Home page, or select "Donors" from the main menu then, click on the
                                <img src="<%=request.getContextPath()%>/images/icons/add.png" title="Add Button"/>
                                icon at the top right corner of the Donor List.  On the form fill in the new Donor's contact
                                information in the appropriate fields (NOTE: Only Last Name is Required).  Once you have
                                filled in all the data, click the "Add Donor" button to save the new donor and be returned to
                                the Donor List page.  If you wish to add another Donor without returning to the list you may do
                                so by clicking the "Add Another Donor" button, this will add the donor and clear the form so
                                you can add another one right away.  If you wish to go back without adding the current
                                information just click the "Back" button to be returned to the Donor List page.
                                &nbsp; <a href="#contents">Top</a>
                                </p>
                                <p>
                                    &nbsp;&nbsp;<h5>Editing a Donor</h5>
                                &nbsp;&nbsp;&nbsp;&nbsp;To edit a Donor select "Donors" from the main menu and then click on the
                                <img src="<%=request.getContextPath()%>/images/icons/edit.png" title="Edit Button"/> icon to the
                                right of the Donor you want to edit.  On the form change the information that is no longer
                                correct to the correct data then click the "Save" button (NOTE: Only Last Name is Required).
                                If you do not want to save what you have changed just click the "Back" button to be returned to
                                the Donor List page. &nbsp; <a href="#contents">Top</a>
                                </p>
                                <p>
                                    &nbsp;&nbsp;<h5>Viewing a Donor</h5>
                                &nbsp;&nbsp;&nbsp;&nbsp;To view a Donor's full information select "Donors" from the main menu, 
                                then simply click on the
                                <img src="<%=request.getContextPath()%>/images/icons/view.png" title="View Button"/> icon to
                                the right of the Donor you want to view.  The selected Donor's information will be displayed on
                                the page, when you are done viewing just click the "Back" button to be returned to the Donor
                                List page. &nbsp; <a href="#contents">Top</a>
                                </p>
                                <p>
                                    &nbsp;&nbsp;<h5>Deleting a Donor</h5>
                                &nbsp;&nbsp;&nbsp;&nbsp;To delete a Donor from the database select "Donors" from the main menu, 
                                then click on the
                                <img src="<%=request.getContextPath()%>/images/icons/delete.png" title="Delete Button"/>
                                icon to the right of the Donor you want to delete.  This will bring you to a conformation page
                                that will ask you if you really want to delete the selected Donor.  If you do not click the
                                "Cancel" button the be returned to the Donor List page.  If You really want to delete the
                                selected Donor then click on the "Yes" button to delete the Donor and be returned to the Donor
                                List page. &nbsp; <a href="#contents">Top</a><br>
                                </p>
                                </p>

                                <p id="manageOrganizations">
                                <h7>Managing Organizations</h7>
                                <p>
                                    &nbsp;&nbsp;<h5>The Organization List</h5>
                                &nbsp;&nbsp;&nbsp;&nbsp;The Organization List can be accessed by clicking on the word 
                                "Organization" in the main menu.  Once the list of Organizations appears in alphabetical order.  
                                You can sort the list in descending alphabetical order by last name with a click on the "Name" 
                                header.  On the top left of the list is a box that lets you choose how many Organizations are shown 
                                on the list, to go to the next or back to the last screen by clicking on the next or previous buttons
                                at the bottom right of the list. You can also search the list by typing the search criteria in to the 
                                box labeled "Search". Below each column is also a filter to limit the data on the list.  Organization management is explained in the next few sections. &nbsp; 
                                <a href="#contents">Top</a>
                                </p>
                                <p>
                                    &nbsp;&nbsp;<h5>Adding a Organization</h5>
                                &nbsp;&nbsp;&nbsp;&nbsp;To add a new Organization select "Organization" from the main menu then, click on the
                                <img src="<%=request.getContextPath()%>/images/icons/add.png" title="Add Button"/>
                                icon at the top right corner of the Organization List.  On the form fill in the new Organization's Name
                                "Add Organization" button to save the new Organization and be returned to
                                the Organization List page. (Note: All Fields are Required)  If you wish to add another Organization without returning to the list you may do
                                so by clicking the "Add Another Organization" button, this will add the Organization and clear the form so
                                you can add another one right away.  If you wish to go back without adding the current
                                information just click the "Back" button to be returned to the Organization List page.
                                &nbsp; <a href="#contents">Top</a>
                                </p>
                                <p>
                                    &nbsp;&nbsp;<h5>Editing a Organization</h5>
                                &nbsp;&nbsp;&nbsp;&nbsp;To edit an Organization select "Organization" from the main menu and then click on the
                                <img src="<%=request.getContextPath()%>/images/icons/edit.png" title="Edit Button"/> icon to the
                                right of the Organization you want to edit.  On the form change the information that is no longer
                                correct to the correct data then click the "Save" button. (Note: All Fields are Required)
                                If you do not want to save what you have changed just click the "Back" button to be returned to
                                the Donor List page. &nbsp; <a href="#contents">Top</a>
                                </p>
                                <p>
                                    &nbsp;&nbsp;<h5>Viewing a Organization</h5>
                                &nbsp;&nbsp;&nbsp;&nbsp;To view a Organization's full information select "Organization" from the main menu, 
                                then simply click on the
                                <img src="<%=request.getContextPath()%>/images/icons/view.png" title="View Button"/> icon to
                                the right of the Organization you want to view.  The selected Organization's information will be displayed on
                                the page, when you are done viewing just click the "Back" button to be returned to the Organization
                                List page. &nbsp; <a href="#contents">Top</a>
                                </p>
                                <p>
                                    &nbsp;&nbsp;<h5>Deleting a Organization</h5>
                                &nbsp;&nbsp;&nbsp;&nbsp;To delete a Organization from the database select "Organization" from the main menu, 
                                then click on the
                                <img src="<%=request.getContextPath()%>/images/icons/delete.png" title="Delete Button"/>
                                icon to the right of the Donor you want to delete.  This will bring you to a conformation page
                                that will ask you if you really want to delete the selected Organization.  If you do not click the
                                "Cancel" button the be returned to the Organization List page.  If You really want to delete the
                                selected Organization then click on the "Yes" button to delete the Organization and be returned to the Organization
                                List page. (Note: You can not delete an Organization that has departments in it.)&nbsp; <a href="#contents">Top</a><br>
                                </p>
                                </p>

                                <p id="manageDepartments">
                                <h7>Managing Departments</h7>
                                <p>
                                    &nbsp;&nbsp;<h5>The Department List</h5>
                                &nbsp;&nbsp;&nbsp;&nbsp;The Department List can be accessed by clicking on the word 
                                "Departments" in the main menu.  Once the list of Departments appears in alphabetical order.  
                                You can sort the list in descending alphabetical order by name with a click on the "Name" 
                                header.  You can also sort the list alphabetically ascending and descending order by Organization as 
                                well by clicking on the word Organization.  On the top left of the list is a box that lets you choose 
                                how many Departments are shown on the list, to go to the next or back to the last screen by clicking on the next or previous buttons
                                at the bottom right of the list. You can also search the list by typing the search criteria in to the 
                                box labeled "Search".  Below each column is also a filter to limit the data on the list.  Department management is explained in the next few sections. &nbsp; 
                                <a href="#contents">Top</a>
                                </p>
                                <p>
                                    &nbsp;&nbsp;<h5>Adding a Department</h5>
                                &nbsp;&nbsp;&nbsp;&nbsp;To add a new Department select "Department" from the main menu then, click on the
                                <img src="<%=request.getContextPath()%>/images/icons/add.png" title="Add Button"/>
                                icon at the top right corner of the Department List.  On the form fill in the new Department's name
                                and choose the Department's Organization. Then click the "Add Department" button to save the new Department and be returned to
                                the Department List page. (Note: All Fields are Required)  If you wish to add another Department without returning to the list you may do
                                so by clicking the "Add Another Department" button, this will add the Department and clear the form so
                                you can add another one right away.  If you wish to go back without adding the current
                                information just click the "Back" button to be returned to the Department List page.
                                &nbsp; <a href="#contents">Top</a>
                                </p>
                                <p>
                                    &nbsp;&nbsp;<h5>Editing a Department</h5>
                                &nbsp;&nbsp;&nbsp;&nbsp;To edit an Organization select "Organization" from the main menu and then click on the
                                <img src="<%=request.getContextPath()%>/images/icons/edit.png" title="Edit Button"/> icon to the
                                right of the Department you want to edit.  On the form change the information that is no longer
                                correct to the correct data then click the "Save" button. (Note: All Fields are Required)
                                If you do not want to save what you have changed just click the "Back" button to be returned to
                                the Department List page. &nbsp; <a href="#contents">Top</a>
                                </p>
                                <p>
                                    &nbsp;&nbsp;<h5>Viewing a Department</h5>
                                &nbsp;&nbsp;&nbsp;&nbsp;To view a Department's full information select "Department" from the main menu, 
                                then simply click on the
                                <img src="<%=request.getContextPath()%>/images/icons/view.png" title="View Button"/> icon to
                                the right of the Department you want to view.  The selected Department's information will be displayed on
                                the page, when you are done viewing just click the "Back" button to be returned to the Department
                                List page. &nbsp; <a href="#contents">Top</a>
                                </p>
                                <p>
                                    &nbsp;&nbsp;<h5>Deleting a Department</h5>
                                &nbsp;&nbsp;&nbsp;&nbsp;To delete a Organization from the database select "Organization" from the main menu, 
                                then click on the
                                <img src="<%=request.getContextPath()%>/images/icons/delete.png" title="Delete Button"/>
                                icon to the right of the Donor you want to delete.  This will bring you to a conformation page
                                that will ask you if you really want to delete the selected Organization.  If you do not click the
                                "Cancel" button the be returned to the Organization List page.  If You really want to delete the
                                selected Organization then click on the "Yes" button to delete the Organization and be returned to the Organization
                                List page. (Note: You can not delete an Department that has Employees in it.)&nbsp; <a href="#contents">Top</a><br>
                                </p>
                                </p>

                                <p id="manageEmployees">
                                <h7>Managing Employees</h7>
                                <p>
                                    &nbsp;&nbsp;<h5>The Employee List</h5>
                                &nbsp;&nbsp;&nbsp;&nbsp;The Employee List can be accessed by clicking on the word 
                                "Employees" in the main menu.  Once the list of Employees appears in alphabetical order by last name.  
                                You can sort the list in descending alphabetical order by first name Department or Organization by clicking on the corresponding word. 
                                header.  On the top left of the list is a box that lets you choose 
                                how many Employees are shown on the list, to go to the next or back to the last screen by clicking on the next or previous buttons
                                at the bottom right of the list. You can also search the list by typing the search criteria in to the 
                                box labeled "Search".  Below each column is also a filter to limit the data on the list.  Employee management is explained in the next few sections. &nbsp; 
                                <a href="#contents">Top</a>
                                </p>
                                <p>
                                    &nbsp;&nbsp;<h5>Adding a Employee</h5>
                                &nbsp;&nbsp;&nbsp;&nbsp;To add a new Employee select "Employees" from the main menu then, click on the
                                <img src="<%=request.getContextPath()%>/images/icons/add.png" title="Add Button"/>
                                icon at the top right corner of the Employee List.  On the form fill in the new Employee's  first name, last name 
                                and choose the Employee's Department. Then click the "Add Employee" button to save the new Employee and be returned to
                                the Employee List page. (Note: All Fields are Required)  If you wish to add another Employee without returning to the list you may do
                                so by clicking the "Add Another Employee" button, this will add the Employee and clear the form so
                                you can add another one right away.  If you wish to go back without adding the current
                                information just click the "Back" button to be returned to the Employee List page.
                                &nbsp; <a href="#contents">Top</a>
                                </p>
                                <p>
                                    &nbsp;&nbsp;<h5>Editing a Employee</h5>
                                &nbsp;&nbsp;&nbsp;&nbsp;To edit an Employee select "Employees" from the main menu and then click on the
                                <img src="<%=request.getContextPath()%>/images/icons/edit.png" title="Edit Button"/> icon to the
                                right of the Employee you want to edit.  On the form change the information that is no longer
                                correct to the correct data then click the "Save" button. (Note: All Fields are Required)
                                If you do not want to save what you have changed just click the "Back" button to be returned to
                                the Employee List page. &nbsp; <a href="#contents">Top</a>
                                </p>
                                <p>
                                    &nbsp;&nbsp;<h5>Viewing a Employee</h5>
                                &nbsp;&nbsp;&nbsp;&nbsp;To view a Employee's full information select "Employee" from the main menu, 
                                then simply click on the
                                <img src="<%=request.getContextPath()%>/images/icons/view.png" title="View Button"/> icon to
                                the right of the Employee you want to view.  The selected Employee's information will be displayed on
                                the page, when you are done viewing just click the "Back" button to be returned to the Employee
                                List page. &nbsp; <a href="#contents">Top</a>
                                </p>
                                <p>
                                    &nbsp;&nbsp;<h5>Deleting a Employee</h5>
                                &nbsp;&nbsp;&nbsp;&nbsp;To delete an Employee from the database select "Employees" from the main menu, 
                                then click on the
                                <img src="<%=request.getContextPath()%>/images/icons/delete.png" title="Delete Button"/>
                                icon to the right of the Employee you want to delete.  This will bring you to a conformation page
                                that will ask you if you really want to delete the selected Employee.  If you do not click the
                                "Cancel" button the be returned to the Employee List page.  If You really want to delete the
                                selected Employee then click on the "Yes" button to delete the Employee and be returned to the Employee
                                List page.&nbsp; <a href="#contents">Top</a><br>
                                </p>
                                </p>

                                <p id="manageDonations">
                                <h7>Managing Donations</h7>
                                <p>
                                    &nbsp;&nbsp;<h5>The Donation List</h5>
                                &nbsp;&nbsp;&nbsp;&nbsp;The Donation List can be accessed by clicking on the word 
                                "Donations" in the main menu.  Once the list of Donation appears.  
                                You can sort the list by clicking on the table headers.  On the top left of the list is a box that lets you choose 
                                how many Donations are shown on the list, to go to the next or back to the last screen by clicking on the next or previous buttons
                                at the bottom right of the list. You can also search the list by typing the search criteria in to the 
                                box labeled "Search".    Below each column is also a filter to limit the data on the list.  Donation management is explained in the next few sections. &nbsp; 
                                <a href="#contents">Top</a>
                                </p>
                                <p>
                                    &nbsp;&nbsp;<h5>Adding a Donations</h5>
                                &nbsp;&nbsp;&nbsp;&nbsp;To add a new Donations select "Donations" from the main menu then, click on the
                                <img src="<%=request.getContextPath()%>/images/icons/add.png" title="Add Button"/>
                                icon at the top right corner of the Donations List.  On the form fill in the new Donation's information (note: * marks a required field).
                                so by clicking the "Add Another Donations" button, this will add the Donations and clear the form so
                                you can add another one right away.  If you wish to go back without adding the current
                                information just click the "Back" button to be returned to the Donations List page.
                                &nbsp; <a href="#contents">Top</a>
                                </p>
                                <p>
                                    &nbsp;&nbsp;<h5>Editing a Donations</h5>
                                &nbsp;&nbsp;&nbsp;&nbsp;To edit an Donations select "Donations" from the main menu and then click on the
                                <img src="<%=request.getContextPath()%>/images/icons/edit.png" title="Edit Button"/> icon to the
                                right of the Donations you want to edit.  On the form change the information that is no longer
                                correct to the correct data then click the "Save" button.
                                If you do not want to save what you have changed just click the "Back" button to be returned to
                                the Department List page. &nbsp; <a href="#contents">Top</a>
                                </p>
                                <p>
                                    &nbsp;&nbsp;<h5>Viewing a Donations</h5>
                                &nbsp;&nbsp;&nbsp;&nbsp;To view a Donation's full information select "Donations" from the main menu, 
                                then simply click on the
                                <img src="<%=request.getContextPath()%>/images/icons/view.png" title="View Button"/> icon to
                                the right of the Donations you want to view.  The selected Donation's information will be displayed in a new tab as a PDF report.
                                When you are done viewing just close the page.
                                List page. &nbsp; <a href="#contents">Top</a>
                                </p>
                                <p>
                                    &nbsp;&nbsp;<h5>Viewing a Donations Thank You Letters</h5>
                                &nbsp;&nbsp;&nbsp;&nbsp;To view the Thank You Letter for a Donation "Donations" from the main menu, 
                                then simply click on the
                                <img src="<%=request.getContextPath()%>/images/icons/email.png" title="Thank You Letter Button"/> icon to
                                the right of the Donations you want to view.  The selected Donation's Thank You Letter will be displayed in a new tab as a PDF report.
                                When you are done viewing just close the page.
                                List page. &nbsp; <a href="#contents">Top</a>
                                </p>
                                <p>
                                    &nbsp;&nbsp;<h5>Deleting a Donations</h5>
                                &nbsp;&nbsp;&nbsp;&nbsp;To delete a Donations from the database select "Donations" from the main menu, 
                                then click on the
                                <img src="<%=request.getContextPath()%>/images/icons/delete.png" title="Delete Button"/>
                                icon to the right of the Donation you want to delete.  This will bring you to a conformation page
                                that will ask you if you really want to delete the selected Donation.  If you do not click the
                                "Cancel" button the be returned to the Donations List page.  If You really want to delete the
                                selected Donation then click on the "Yes" button to delete the Donation and be returned to the Donations
                                List page.&nbsp; <a href="#contents">Top</a><br>
                                </p>
                                </p>
                                
                                <p id="reports">
                                <h7>Reports</h7>
                                
                                <p>
                                    &nbsp;&nbsp;<h5>All Donations Report</h5>
                                &nbsp;&nbsp;&nbsp;&nbsp; To access the All Donations Report you select "Reports" from the main menu.  This brings you
                                to the Reports list page.  Here you can select the options for the All Donations Report.  The options are start date, end date,
                                organization, department, donor, and type.  Each one you select will limit the data on the report to match the options.  If the 
                                report comes up empty that means that no data matched the options you selected.&nbsp; <a href="#contents">Top</a><br>
                                </p>
                                
                                <p>
                                    &nbsp;&nbsp;<h5>From Donor Report</h5>
                                &nbsp;&nbsp;&nbsp;&nbsp; To access the From Donor Report you select "Reports" from the main menu.  This brings you
                                to the Reports list page.  Here you can select the options for the From Donor Report.  The options are start date, end date,
                                donor, and type.  Each one you select will limit the data on the report to match the options.  If the 
                                report comes up empty that means that no data matched the options you selected.&nbsp; <a href="#contents">Top</a><br>
                                </p>
                                </p>

                            </div>
                        </div>
                    </td>
                </tr>
            </table>
            <div id="footer" class="noPrint"><%@include file="/WEB-INF/jspf/footer.jspf"%></div>
        </div>
    </body>
</html>