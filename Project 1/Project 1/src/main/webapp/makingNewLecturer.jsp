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
  String mnl_class_id = (String)request.getParameter("mnl_class_id");
  String mnl_class_no = (String)request.getParameter("mnl_class_no");
  String mnl_course_id = (String)request.getParameter("mnl_course_id");
  String mnl_name = (String)request.getParameter("mnl_name");
  String mnl_major_id = (String)request.getParameter("mnl_major_id");
  String mnl_year = (String)request.getParameter("mnl_year");
  String mnl_credit = (String)request.getParameter("mnl_credit");
  String mnl_lecturer_id = (String)request.getParameter("mnl_lecturer_id");
  String mnl_person_max = (String)request.getParameter("mnl_person_max");
  String mnl_opened = (String)request.getParameter("mnl_opened");
  String mnl_room_id = (String)request.getParameter("mnl_room_id");

  if(mnl_class_id.equals(null)) {
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
    String sql = "insert into class Values('" + mnl_class_id + "', '" + mnl_class_no + "', '" + mnl_course_id + "', '" + mnl_name + "', '" + mnl_major_id + "', '" + mnl_year + "', '" + mnl_credit + "', '" + mnl_lecturer_id + "', '" + mnl_person_max + "', '" + mnl_opened + "', '" + mnl_room_id + "')";
    stmt = conn.createStatement();
    stmt.executeUpdate(sql);
    script.println("<script>");
    script.println("</script>");
  } catch(SQLException ex) {
    script.println("<script>");
    script.println("alert('강좌 등록 과정에서 문제가 발생하였습니다.')");
    script.println("location.href = 'makeNewLecture.jsp'");
    script.println("</script>");
  } finally {
    if(stmt != null) stmt.close();
    if(conn != null) conn.close();
  }

  %>



<div class="container">
  <div class="col-lg-4"></div>
  <div class="col-lg-4">
    <div class="jumbotron" style="padding-top: 20px;">
      <form method="post" action="makeNewLecTemp.jsp">
        <div class="form-group">
          <input type = "checkbox" value="<%=mnl_class_id%>" id = "checkLec" name = "checkLec2" checked = "checked" disabled = "disabled">
        </div>
        <input type="submit" value="다음 장으로">
      </form>
    </div>
  </div>
  <div class="col-lg-4"></div>
</div>


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