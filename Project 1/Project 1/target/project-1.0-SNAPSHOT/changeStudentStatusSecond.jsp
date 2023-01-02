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
    <%
        ResultSet rs = null;
        Statement stmt = null;

        try {
            String lec2 = request.getParameter("chStuID");
            String lec = request.getParameter("chStuStatus");
            if(lec.equals("재학")  || lec.equals("휴학") || lec.equals("자퇴")) {
                String sql = "update student set status = '" + lec + "' where student_id = " + lec2;
                stmt = conn.createStatement();
                stmt.executeUpdate(sql);
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('학생 상태 변경이 완료되었습니다.')");
                script.println("location.href = 'changeStudentStatus.jsp'");
                script.println("</script>");

            }else {
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('재학/휴학/자퇴 가 아닙니다.')");
                script.println("location.href = 'changeStudentStatus.jsp'");
                script.println("</script>");

            }
        } catch (SQLException ex) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('상태 변경 과정에서 문제가 발생하였습니다.')");
            script.println("location.href = 'changeStudentStatus.jsp'");
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
