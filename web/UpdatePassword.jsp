<%-- 
    Document   : UpdatePassword
    Created on : 10-Jan-2024, 3:25:29 pm
    Author     : ankit
--%>

<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Update-Password Page</title>
    </head>
    <body>
            <jsp:include page="DashBoard.jsp" />

        <form action="UpdatePassword.jsp" method="post">
            <input type="password" placeholder="old Password" name="opass">
            <input type="password" placeholder="new Password" name="npass">
            <input type="password" placeholder="retype Password" name="cpass">
            <input type="submit" value="CHANGE">
        </form>
    </body>
</html>
<%
Object email =session.getAttribute("email");

String opass = request.getParameter("opass");
String npass = request.getParameter("npass");
String cpass = request.getParameter("cpass");

    if (opass != null && npass != null && cpass != null && email != null) {      
    try{
     Class.forName("com.mysql.cj.jdbc.Driver");
     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/servlet","root","root");
     String sql = "update student set password=? where password=? and email=?";
     
     PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1,npass);
        ps.setString(2, opass);
        ps.setObject(3, email);
                
    int i = ps.executeUpdate();
        if (i>0){
            response.sendRedirect("DashBoard.jsp");
            }           
    }catch(Exception e){}
    } 
    %>
