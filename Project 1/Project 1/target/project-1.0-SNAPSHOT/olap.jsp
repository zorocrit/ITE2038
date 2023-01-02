<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<button type="button" class="navyBtn" onClick="location.href='main.jsp'">메인 화면으로</button>
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
  <title>OLAP</title>
</head>
<body>
<h3 style="test-align: center;"> OLAP</h3>
<%@ include file ="dbconn.jsp" %>
<table width="300" border="1">
  <tr>
    <th>학수번호</th>
    <th>수업 이름</th>
  </tr>
  <%
    ResultSet rs = null;
    Statement stmt = null;

    try {
      String sql = "select course.course_id, course.name, AVG(gi - grade_int) as re from credits left join course on course.course_id = credits.course_id left join (select student_id, AVG(grade_int) as gi from credits group by student_id) as info on info.student_id = credits.student_id group by course_id order by re DESC limit 10";
      stmt = conn.createStatement();
      rs = stmt.executeQuery(sql);

      while (rs.next()) {
        String cid = rs.getString("course.course_id");
        String cname = rs.getString("course.name");
  %>
  <tr>
    <td><%=cid%></td>
    <td><%=cname%></td>
  </tr>
  <%
      }
    } catch (SQLException ex) {
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('문제가 발생하였습니다.')");
      script.println("location.href = 'lectureSearch.jsp'");
      script.println("</script>");
      rs.close();
    } finally{
      if(rs != null) {
        rs.close();
      }
      if(conn != null) {
        conn.close();
      }
    }
  %>
</table>



</body>
</html>
