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
<style>
    table, th, td {
        border: 1px solid #bcbcbc;
    }
    table {
        width: 410px;
    }
</style>
<head>
    <title>과목 증원</title>

</head>
<table width="300" border="1">
<body>
<%
    ResultSet rs = null;
    Statement stmt = null;

    try {
        String lec = request.getParameter("increaseLecNum");
        String lec2 = request.getParameter("increasePeoNum");
        String sql = "SELECT class.class_id, occupancy FROM class left join room on room.room_id = class.room_id where class.class_id = " + lec;
        stmt = conn.createStatement();
        rs = stmt.executeQuery(sql);
        while (rs.next()) {
            int class_id = rs.getInt("class.class_id");
            int class_no = rs.getInt("occupancy");
            int siNum = Integer.parseInt(lec2);
            if (class_no < siNum) {
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('강의실 제한 인원보다 큽니다!')");
                script.println("location.href = 'adminLectureFirst.jsp'");
                script.println("</script>");
            } else {
                String temp_data = siNum + " " + class_id;
                %>
과목 증원이 가능합니다.. 증원 하시겠습니까?
<form method="post" action="adminLectureThird.jsp" >
    <td><input type = "checkbox" value="<%=temp_data%>" id = "can" name = "can"></td>
    <td><input type = "submit" value="확인"></td>
</form>
<%
            }
        }
    } catch (SQLException ex) {
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('문제가 발생하였습니다.')");
    script.println("location.href = 'adminLectureFirst.jsp'");
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
