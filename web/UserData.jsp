<%-- 
    Document   : UserData
    Created on : 09-Jan-2024, 7:03:59 pm
    Author     : ankit
--%>
<%@page import="java.util.ArrayList" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP UserData Page</title>
        <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #3af2ec;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            border-radius: 8px;
            width: 300px;
        }

        .include{
            
            text-align: center;
            margin: 0px;
        }
        
        h2 {
            text-align: center;
        }

        .data-field {
            margin-bottom: 16px;
        }

        label {
            display: block;
            margin-bottom: 8px;
        }

        span {
            font-weight: bold;
        }
    </style>
    </head>
    <body>
    <%
        ArrayList al = (ArrayList)session.getAttribute("userData");   
    %>
        <div class="include">
        <jsp:include page="DashBoard.jsp" />
        </div>
        
        
        <div class="container">
    <h2>User Data</h2>
    <div class="data-field">
        <label for="name">Name:</label>
        <span><%= al.get(0)%></span>
    </div>

    <div class="data-field">
        <label for="fatherName">Father's Name:</label>
        <span><%= al.get(1)%></span>
    </div>

    <div class="data-field">
        <label for="mobile">Mobile:</label>
        <span><%= al.get(2)%></span>
    </div>

    <div class="data-field">
        <label for="contact">Contact:</label>
        <span><%= al.get(3)%></span>
    </div>
    
    <div>
        <a href="UpdateData.jsp">Update-Data</a>
    </div>
</div>
    </body>
    
</html>
