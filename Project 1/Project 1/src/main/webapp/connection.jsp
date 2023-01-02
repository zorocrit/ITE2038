<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-11-05
  Time: 오후 6:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="java.sql.*"%>

<html>
<head>
  <title>Database SQL</title>
</head>
<body>
<%
  Connection conn = null;
  try{
    String dbURL = "jdbc:mysql://localhost:3307/DB2021045796?serverTimezone=Asia/Seoul";
    String dbID = "root";
    String dbPassword = "rla3hRua12##";
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
  } catch (Exception e){
    e.printStackTrace();
  }
%>
</body>
</html>
