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
        try {
            //String lec = request.getParameter("lecSearch");
            String sql = "SELECT application.student_id, sum(credit) as su FROM application left join class on class.class_id = application.class_id where application.student_id = " + userID + " group by application.student_id ";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                int cat = rs.getInt("application.student_id");
                int su = rs.getInt("su");
                if(su > 18) {
                    script.println("<script>");
                    script.println("location.href = 'overweight.jsp'");
                    script.println("</script>");
                }
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
        int check = 0;
        try {
            //String lec = request.getParameter("lecSearch");
            String sql = "update application set retake = 1 where (class_id, student_id) in (select distinct class_id, student_id from (select class.class_id, application.student_id from application left join class on application.class_id = class.class_id inner join credits on credits.student_id = application.student_id and credits.course_id = class.course_id) as tempTabble)";
            stmt = conn.createStatement();
            stmt.executeUpdate(sql);
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
        int sid = 0;
        int cid = 0;
        int mxe = 0;
        int iid = 0;
        try {
            //String lec = request.getParameter("lecSearch");
            String sql = "SELECT application.student_id, application.idapplication, application.class_id, max(grade_int) as mx FROM application left join class on class.class_id = application.class_id left join credits on credits.course_id = class.course_id where retake = 1 and application.student_id = " + userID;
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                sid = rs.getInt("application.student_id");
                cid = rs.getInt("application.class_id");
                mxe = rs.getInt("mx");
                iid = rs.getInt("application.idapplication");
                if(mxe >= 30) {
                    script.println("<script>");
                    script.println("alert('재수강이 불가능합니다.')");
                    script.println("</script>");
                }else {
                    script.println("<script>");
                    script.println("alert('수강신청이 완료되었습니다.')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    check++;
                }
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
            if(check == 0) {
                String sql = "delete from application where idapplication = " + iid;
                stmt = conn.createStatement();
                stmt.executeUpdate(sql);
                script.println("<script>");
                script.println("alert('수강이 취소되었습니다.')");
                script.println("location.href = 'lectureSearch.jsp'");
                script.println("</script>");
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
