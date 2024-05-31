<%-- 
    Document   : DashBoard
    Created on : 09-Jan-2024, 2:01:59 pm
    Author     : ankit
--%>
<%@page import="java.util.ArrayList" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        ArrayList al = new ArrayList();
        al = (ArrayList)session.getAttribute("userData");
    
        response.setHeader("Cache-Control", "No-Cache");
        response.setHeader("Cache-Control","No-Store");
            
        Object email = session.getAttribute("email");
        if(email!=null){
            
        %>
        <h1 align="center">Welcome to HomePage <%= al.get(0) %></h1>
        <br>
        <a href="UserData.jsp">data</a><br>
        <a href="UpdatePassword.jsp">Change Password</a><br>
        <a href="LogOut.jsp">Log-Out</a><br>
        <a href="DashBoard.jsp">Home</a>
        <%
            }
            else {
            response.sendRedirect("index.html");
            }
        %>
    </body>
    
</html>
