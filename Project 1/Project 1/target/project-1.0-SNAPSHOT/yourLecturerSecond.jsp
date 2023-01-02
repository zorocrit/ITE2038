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
    <title>지도 교수 조회</title>
</head>
<body>
<h3 style="test-align: center;"> 지도 교수 조회</h3>
<%@ include file ="dbconn.jsp" %>
<table width="300" border="1">
    <tr>
        <th>학번</th>
        <th>학생 이름</th>
        <th>지도 교수</th>
    </tr>
    <%
        ResultSet rs = null;
        Statement stmt = null;

        try {
            String lec = request.getParameter("toFindLecturer");
            String sql = "SELECT student.student_id, student.name, lecturer.name FROM student left join lecturer on lecturer.lecturer_id = student.lecturer_id where student_id = " + lec;
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                int student_id = rs.getInt("student.student_id");
                String studentName = rs.getString("student.name");
                String LecturerName = rs.getString("lecturer.name");
    %>
    <tr>
        <td><%=student_id%></td>
        <td><%=studentName%></td>
        <td><%=LecturerName%></td>
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
