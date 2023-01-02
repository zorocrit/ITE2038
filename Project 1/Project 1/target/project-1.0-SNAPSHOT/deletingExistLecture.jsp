<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
  <title>강좌 제작 중</title>
</head>
<body>

</body>
</html>
<%@ include file ="dbconn.jsp" %>
<%
  request.setCharacterEncoding("utf-8");
  String del_class_id = (String)request.getParameter("del_class_id");

  if(del_class_id.equals(null)) {
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('비어있는데??')");
    script.println("location.href = 'makeNewLecture.jsp'");
    script.println("</script>");
  }

  PrintWriter script = response.getWriter();

  //ResultSet rs = null;
  Statement stmt = null;


  //stmt = null;
  try {
    String sql = "delete from class where class_id = (select class_id from (select class_id from class where class_id = '" + del_class_id + "') as tempTable)";
    stmt = conn.createStatement();
    stmt.executeUpdate(sql);
  } catch(SQLException ex) {
    script.println("<script>");
    script.println("alert('강좌 삭제 과정(1)에서 문제가 발생하였습니다.')");
    script.println("location.href = 'deleteExistLecture.jsp'");
    script.println("</script>");
  } finally {
    if(stmt != null) stmt.close();
  }

  try {
    String sql = "delete from application where class_id = (select class_id from (select class_id from class where class_id = '" + del_class_id + "') as tempTable)";
    stmt = conn.createStatement();
    stmt.executeUpdate(sql);
  } catch(SQLException ex) {
    script.println("<script>");
    script.println("alert('강좌 삭제 과정(2)에서 문제가 발생하였습니다.')");
    script.println("location.href = 'deleteExistLecture.jsp'");
    script.println("</script>");
  } finally {
    if(stmt != null) stmt.close();
  }

  try {
    String sql = "delete from time where class_id = (select class_id from (select class_id from class where class_id = '" + del_class_id + "') as tempTable)";
    stmt = conn.createStatement();
    stmt.executeUpdate(sql);
    script.println("<script>");
    script.println("alert('강좌가 삭제되었습니다.')");
    script.println("location.href = 'deleteExistLecture.jsp'");
    script.println("</script>");
  } catch(SQLException ex) {
    script.println("<script>");
    script.println("alert('강좌 삭제 과정(3)에서 문제가 발생하였습니다.')");
    script.println("location.href = 'deleteExistLecture.jsp'");
    script.println("</script>");
  } finally {
    if(stmt != null) stmt.close();
    if(conn != null) conn.close();
  }

%>


<%--try {
    String sql = "select class_id from class where class_id = " + mnl_class_id;
    stmt = conn.createStatement();
    rs = stmt.executeQuery(sql);
    String class_id = rs.getString("class_id");
    if(class_id != null) {
      script.println("<script>");
      script.println("alert('중복되는 강좌입니다')");
      script.println("location.href = 'makeNewLecture.jsp'");
      script.println("</script>");
    }
  } catch(SQLException ex) {
    script.println("<script>");
    script.println("alert('중복 확인 절차에서 문제가 발생하였습니다.')");
    script.println("location.href = 'makeNewLecture.jsp'");
    script.println("</script>");
  } finally {
    if(stmt != null) stmt.close();
    if(conn != null) conn.close();
  }--%>