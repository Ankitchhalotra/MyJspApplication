<%-- 
    Document   : UpdateData
    Created on : 10-Jan-2024, 12:05:51 am
    Author     : ankit
--%>
<%@page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%            ArrayList al=new ArrayList();
             al = (ArrayList) session.getAttribute("userData");
            //String email = (String)session.getAttribute("email");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP UpdateData Page</title>
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
    
    <jsp:include page="DashBoard.jsp" />
    <form action="UpdateData.jsp">

    <h2>Update Profile</h2>
    <label>Name</label>
    <input type="text" name="name1" value="<%= al.get(0)%>">
    <label>Father Name</label>
    <input type="text" name="fname1" value="<%= al.get(1)%>">
    <label>Contact</label>
    <input type="text" name="contact1" value="<%= al.get(2)%>">
    <input type="text" name="email" value="<%= al.get(3)%>">
    <input type="submit" value="UPDATE" name="updateBtn">
    </form>
    
</html>


<%
            String setName = request.getParameter("name1");
            String setFname = request.getParameter("fname1");
            String setContact = request.getParameter("contact1");
            String email = request.getParameter("email");
            
            try {
            
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/servlet","root","root");
                String sql = "update student set name=?,fname=?,contact=? where email=?";
                
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, setName);
                ps.setString(2, setFname);
                ps.setString(3, setContact);
                ps.setString(4, email);
                
                int i = ps.executeUpdate();

                if(i > 0) {
                    al.set(0, setName);
                    al.set(1, setFname);
                    al.set(2, setContact);
                    //out.print("Data Update Sucessfull");
                    //response.sendRedirect("UserData.jsp");
                } 
                
                con.close();
            } catch (Exception e) {}
           
%>
