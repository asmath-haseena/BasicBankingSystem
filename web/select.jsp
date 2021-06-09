<%-- 
    Document   : select
    Created on : 4 Jun, 2021, 10:20:56 PM
    Author     : ELCOT
--%>
<%@page import="java.sql.*,java.sql.Connection,java.sql.DriverManager,java.sql.Statement,java.sql.ResultSet"contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css">
        <title>JSP Select Page</title>

    </head>
    <body>
        <center>
        <h1>The records are :</h1>
        <%
            Connection c = null;
            Statement stmt = null;
        try {
            Class.forName("org.postgresql.Driver");
            c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/travello","postgres", "1234");
            stmt = c.createStatement();
            ResultSet rs = stmt.executeQuery( "SELECT * FROM TRAVELLO_CITY;" );
            out.println("<table style='boder:1px solid black'><tr><th>ID</th><th>USER NAME</th><th>EMAIL</th><th>BALANCE</th></tr>");
            int id = 1;
            while ( rs.next() ) {
               //int id = rs.getInt("id");
               String  name = rs.getString("name");
              String  email = rs.getString("email");
              String  amount = rs.getString("amount");
               out.println( "<tr><td>" + name +"</td>");
               out.println( "<td>" + email+"</td>" );
               out.println( "<td>" + amount+"</td></tr>");
               id++;
            }
            out.println("</table>");
            rs.close();
           stmt.close();
           c.close();
           out.println("Database Operation successfully");
        } catch (Exception e) {
           e.printStackTrace();
           out.println(e.getClass().getName()+": "+e.getMessage());
        }
      %>
      <br><br>
 <a href="home.html">Home </a>
 <br>
 <br>
    
      </center>
    </body>
</html>
