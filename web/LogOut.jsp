<%-- 
    Document   : LogOut
    Created on : 10-Jan-2024, 3:58:47 pm
    Author     : ankit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    </body>
</html>
<%
session.setAttribute("email", null);
session.invalidate();
response.sendRedirect("DashBoard.jsp");
%>
