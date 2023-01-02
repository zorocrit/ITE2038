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
  <title>수강 신청되었던 강좌 삭제 중</title>
</head>
<body>
<%@ include file ="dbconn.jsp" %>

<%
  request.setCharacterEncoding("utf-8");
  String class_request = (String)request.getParameter("wanaDelLec2");
  if(class_request.equals(null)) {
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('비어있는데??')");
    script.println("location.href = 'lectureSearch.jsp'");
    script.println("</script>");
  }


  String student_id = (String)session.getAttribute("sessionUserID");
  PrintWriter script = response.getWriter();

  int cid = Integer.parseInt(class_request);
  String userID = null;
  if(session.getAttribute("userID") != null)
  {
    userID = (String) session.getAttribute("userID");
  }
  ResultSet rs = null;

  Statement stmt = null;
  try {
    String sql = "delete from application where idapplication = (select idapplication from (select idapplication from application where student_id = '" + userID + "' and class_id = '" + cid + "') as tempTable)";
    stmt = conn.createStatement();
    stmt.executeUpdate(sql);

    script.println("<script>");
    script.println("alert('수업 신청 취소가 완료되었습니다.')");
    script.println("location.href = 'showingLecture.jsp'");
    script.println("</script>");
  } catch(SQLException ex) {
    script.println("<script>");
    script.println("alert('문제가 발생하였습니다.')");
    script.println("location.href = 'showingLecture.jsp'");
    script.println("</script>");
  } finally {
    if(stmt != null) stmt.close();
    if(conn != null) conn.close();
  }

%>


</body>
</html>
