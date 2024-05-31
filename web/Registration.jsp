<%-- 
    Document   : Registration
    Created on : 09-Jan-2024, 2:01:33 pm
    Author     : ankit
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
        body {
            font-family: Arial, sans-serif;
            background-color:#3af2ec;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .registration-container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 300px;
            text-align: center;
        }

        label {
            display: block;
            margin-bottom: 8px;
            text-align: left;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 16px;
            box-sizing: border-box;
        }

        button {
            background-color: #4caf50;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
    </head>
    <body>
        <div class="registration-container">
    <h2>Registration Form</h2>
        <form action="Registration.jsp">
            <label for="name">Enter Name</label>
            <input type="text" id="name" name="name">
            <br>
            <label for="father Name">Enter Father Name</label>
            <input type="text" id="fname" name="fname">
            <br>
            <label for="phone Number">Enter Phone No.</label>
            <input type="text" id="mob" name="mob">
            <br>
            <label for="email">Enter Email</label>
            <input type="text" id="email" name="email">
            <br>
            <label for="password">Enter Password</label>
            <input type="text" id="pass" name="pass">
            <br>
            <label for="confirm password">Enter Confirm Password</label>
            <input type="text" id="cpass" name="cpass">
            <br>
            <input type="submit" value="REGISTER">
        </form>
        </div>
    </body>
</html>
<%
    String name = request.getParameter("name");
    String fname = request.getParameter("fname");
    String phone = request.getParameter("mob");
    String email = request.getParameter("email");
    String pass = request.getParameter("pass");
    
   if (name!=null && fname!=null && phone!=null && email!=null && pass!=null){
    try {
    
       Class.forName("com.mysql.cj.jdbc.Driver");
       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/servlet","root","root");
       String sql = "insert into student values (?,?,?,?,?)";
       
       PreparedStatement ps = con.prepareStatement(sql);
       ps.setString(1,name);
       ps.setString(2,fname);
       ps.setString(3,phone);
       ps.setString(4,email);
       ps.setString(5,pass);
       
       int res = ps.executeUpdate();
       if (res>0){
                response.sendRedirect("Login.jsp");
                } else {
                response.sendRedirect("Registration.jsp");
                }
       
    } catch(Exception e){}
    }
    
%>    