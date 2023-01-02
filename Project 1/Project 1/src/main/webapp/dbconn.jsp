<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-11-05
  Time: 오후 7:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%
    Connection conn = null;

    String url = "jdbc:mysql://localhost:3307/DB2021045796?serverTimezone=Asia/Seoul";
    String userUID = "root";
    String passwordUPW = "rla3hRua12##";

    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(url, userUID, passwordUPW);
%>