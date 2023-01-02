<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-11-07
  Time: 오전 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<button type="button" class="navyBtn" onClick="location.href='main.jsp'">메인 화면으로</button>
<%@ include file ="dbconn.jsp" %>
<html>

<head>
  <title>과목 증원</title>

</head>
  <body>
  <%
    ResultSet rs = null;
    Statement stmt = null;

    try {
      String lec = request.getParameter("youCanLec");
      String lec2 = request.getParameter("YouWho");
      String sql = "SELECT class.class_id, occupancy, count(distinct application.idapplication) as counting FROM class left join room on room.room_id = class.room_id left join application on class.class_id = application.class_id where class.class_id = " + lec;
        stmt = conn.createStatement();
        rs = stmt.executeQuery(sql);
        while (rs.next()) {
            int class_id = rs.getInt("class.class_id");
            int class_no = rs.getInt("occupancy");
            int counting = rs.getInt("counting");
            int siNum = Integer.parseInt(lec2);
            if (class_no == counting) {
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('강의실 제한 인원보다 큽니다!')");
                script.println("location.href = 'youCanListen.jsp'");
                script.println("</script>");
            } else {
                String temp_data = lec + " " + lec2;
                %>
  수강 허용이 가능합니다.. 증원 하시겠습니까?
  <form method="post" action="adminAllow.jsp" >
    <td><input type = "checkbox" value="<%=temp_data%>" id = "cancan" name = "cancan"></td>
    <td><input type = "submit" value="확인"></td>
  </form>
<%
        }
      }
    } catch (SQLException ex) {
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('강의실 크기 확인 과정에서 문제가 발생하였습니다.')");
      script.println("location.href = 'YouCanListen.jsp'");
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
  </body>
</html>
