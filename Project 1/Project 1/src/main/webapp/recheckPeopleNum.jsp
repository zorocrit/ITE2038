<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Vector" %>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
    <title>인원수 확인 중</title>
</head>
<body>
<%@ include file ="dbconn.jsp" %>
<%
  Vector<Integer> id = new Vector<Integer>();
  Vector<Integer> count = new Vector<Integer>();
  PrintWriter script = response.getWriter();
  Statement stmt = null;
  ResultSet rs = null;
  try {
    String sql = "select class_id, count(class_id) as counting from application group by class_id";
    stmt = conn.createStatement();
    rs = stmt.executeQuery(sql);
    while (rs.next()) {
      int class_id = rs.getInt("class_id");
      int count_id = rs.getInt("counting");
      id.add(class_id);
      count.add(count_id);
    }
  } catch(SQLException ex) {
    script.println("<script>");
    script.println("alert('최신 정보를 불러오는 과정에서 문제가 발생하였습니다.')");
    script.println("location.href = 'main.jsp'");
    script.println("</script>");
  } finally {
    if(stmt != null) stmt.close();
    if(conn != null) conn.close();
  }
  for(int i = 0; i < count.size(); i++) {
    stmt = null;
    try {
      String sql = "insert into applicant(class_id, person_app) Values(" + id.get(i) + ", " + count.get(i) + ") on duplicate key update class_id = " + id.get(i) + ", people_app = " + count.get(i);
      stmt = conn.createStatement();
      stmt.executeUpdate(sql);
    } catch(SQLException ex) {
      script.println("<script>");
      script.println("alert('어쩌다보니 또 문제가 발생하였습니다.')");
      script.println("location.href = 'main.jsp'");
      script.println("</script>");
    } finally {
      if(stmt != null) stmt.close();
      if(conn != null) conn.close();
    }
  }
  script.println("<script>");
  script.println("alert('최신 정보로 갱신되었습니다.')");
  script.println("location.href = 'main.jsp'");
  script.println("</script>");


%>
</body>
</html>
