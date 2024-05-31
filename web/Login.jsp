<%-- 
    Document   : Login
    Created on : 09-Jan-2024, 2:01:15 pm
    Author     : ankit
--%>

<%@page import="java.util.ArrayList" %>
<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Login Page</title>
        <style>
        
        body {
            font-family: Arial, sans-serif;
            background-color: #3af2ec;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .login-container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 300px;
        }

        label {
            display: block;
            margin-bottom: 8px;
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
        a{
            padding: 10px;
            width: 100%;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
    </head>
    <body>
        <div class="background-color">
        <div class="login-container">
        <h2>Login</h2>
        <form action="Login.jsp">
        <label for="Email">Email:</label>
        <input type="email" id="email" name="email" required>

        <label for="password">Password:</label>
        <input type="password" id="pass" name="pass" required>

        <button type="submit">Login</button>
        <br><br>

        <a href="Registration.jsp">Sign-up</a>
    </form>
</div>
</div>
    </body>
    
</html>
<%
    ArrayList al = new ArrayList();
    String email =  request.getParameter("email");      
    String pass =  request.getParameter("pass");
    if(email != null && pass != null){
    try {
    
       Class.forName("com.mysql.cj.jdbc.Driver");
       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/servlet","root","root");
       String sql = "select * from student where email=? and password=?";
       
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, email);
        ps.setString(2, pass);
                
        ResultSet rs = ps.executeQuery();
        while(rs.next()){ 
                    String name = rs.getString(1);
                    String fname = rs.getString(2);
                    String contact = rs.getString(3);
                    String mail = rs.getString(4);
                    al.add(name);
                    al.add(fname);
                    al.add(contact);
                    al.add(mail);
                    
                    session.setAttribute("userData",al);
                    response.sendRedirect("DashBoard.jsp");
                    
                    session.setAttribute("email",mail);
                    response.sendRedirect("UpdateData.jsp");
    }
                    response.sendRedirect("Login.jsp");

    } catch(Exception e){}
    }

%>