<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-11-07
  Time: 오전 8:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.*"%>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<style>
  table, th, td {
    border: 1px solid #bcbcbc;
  }
  table {
    width: 910px;
  }
</style>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
  <title>check</title>
</head>
<body>
<h3 style="test-align: center;"> check</h3>
<%@ include file ="dbconn.jsp" %>
<table width="300" border="1">
  <%
    ResultSet rs = null;
    Statement stmt = null;
    PrintWriter script = response.getWriter();
    String userID = null;
    if(session.getAttribute("userID") != null)
    {
      userID = (String) session.getAttribute("userID");
    }
    int aid = 0;
    int cat = 0;
    int su = 0;
    try {
      //String lec = request.getParameter("lecSearch");
      String sql = "SELECT max(application.idapplication) as mid, application.student_id, sum(credit) as su FROM application left join class on class.class_id = application.class_id where application.student_id = " + userID + " group by application.student_id ";
      stmt = conn.createStatement();
      rs = stmt.executeQuery(sql);

      while (rs.next()) {
        aid = rs.getInt("mid");
        cat = rs.getInt("application.student_id");
        su = rs.getInt("su");
      }
    } catch (SQLException ex) {
      script.println("<script>");
      script.println("alert('문제가 발생하였습니다.')");
      script.println("location.href = 'lectureSearch.jsp'");
      script.println("</script>");
      rs.close();
    } finally{
      if(rs != null) {
        rs.close();
      }
    }
    try {
      //String lec = request.getParameter("lecSearch");
      String sql = "delete from application where idapplication = " + aid;
      stmt = conn.createStatement();
      stmt.executeUpdate(sql);
      script.println("<script>");
      script.println("alert('수강 가능한 학점(18학점)을 넘었습니다.')");
      script.println("location.href = 'lectureSearch.jsp'");
      script.println("</script>");
      rs.close();
    } catch (SQLException ex) {
      script.println("<script>");
      script.println("alert('문제가 발생하였습니다.')");
      script.println("location.href = 'lectureSearch.jsp'");
      script.println("</script>");
      rs.close();
    } finally{
      if(rs != null) {
        rs.close();
      }
      if(stmt != null) {
        conn.close();
      }
    }
  %>
</table>



</body>
</html>

</body>
</html>
