<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
    <title>수정 중</title>
</head>
<body>

<%@ include file ="dbconn.jsp" %>
<%
    request.setCharacterEncoding("utf-8");
    String class_request = (String)request.getParameter("can");
    String imsi = request.getParameter("can")==null ? "" : request.getParameter("can");
    if(imsi.equals(null)) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('비어있는데??')");
        script.println("location.href = 'lectureSearch.jsp'");
        script.println("</script>");
    }
    PrintWriter script = response.getWriter();

    String[] temp = imsi.split(" ");
    String inOne = temp[0];
    String class_id = temp[1];

    Statement stmt = null;
    try {
        String sql = "update class set person_max = " + inOne + " where class_id = " + class_id;
        stmt = conn.createStatement();
        stmt.executeUpdate(sql);
        script.println("<script>");
        script.println("alert('과목 증원이 완료되었습니다.')");
        script.println("location.href = 'adminLectureFirst.jsp'");
        script.println("</script>");
    } catch(SQLException ex) {
        script.println("<script>");
        script.println("alert('과목 증원 과정에서 문제가 발생하였습니다.')");
        script.println("location.href = 'adminLectureFirst.jsp'");
        script.println("</script>");
    } finally {
        if(stmt != null) stmt.close();
        if(conn != null) conn.close();
    }



%>


</body>
</html>
