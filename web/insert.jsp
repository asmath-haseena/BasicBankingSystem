<%-- 
    Document   : insert
    Created on : 4 Jun, 2021, 10:19:17 PM
    Author     : ELCOT
--%>
<%@page import="java.sql.*,java.sql.Connection,java.sql.DriverManager,java.sql.Statement,java.sql.ResultSet"contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css">
        <title>Processing</title>
        <style>
            table{
                border: 0px solid blue;
            }
            h1{
                border: 1px solid black;
                background-color: blue;
                color: white;
                text-align: left;
            }
            a{
                text-decoration: none;
            }
            </style>
    </head>
    <body>
        <h1>Insertion Successful</h1>
        <%
            String name = request.getParameter("uname");
            String email = request.getParameter("uemail");
            String amount = request.getParameter("upass");
            
            Connection c = null;
            Statement stmt = null;
        try {
            Class.forName("org.postgresql.Driver");
            c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/travello","postgres", "1234");
            stmt = c.createStatement();
            PreparedStatement st = c.prepareStatement("insert into travello_city(name,email,amount) values( ?,?,? )");
            st.setString(1, name);
            st.setString(2, email);
            st.setString(3, amount);
            
            st.executeUpdate();
            c.close();
            out.println("Database Operation successfully");
        } catch (Exception e) {
            e.printStackTrace();
            out.println(e.getClass().getName()+": "+e.getMessage());
        }
      %>
      <br>
       <a href="index.html">Home </a>
       <br><br>
       <a href="logout.html">Logout </a>
    </body>
</html>
