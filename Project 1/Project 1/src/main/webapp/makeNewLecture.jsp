<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
  <title>강좌 개설</title>
</head>
<body>
<button type="button" class="navyBtn" onClick="location.href='main.jsp'">메인 화면으로</button>
<div class="container">
  <div class="col-lg-4"></div>
  <div class="col-lg-4">
    <div class="jumbotron" style="padding-top: 20px;">
      <form method="post" action="makingNewLecturer.jsp">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="class_id" name="mnl_class_id" maxlength="20">
          <input type="text" class="form-control" placeholder="class_no" name="mnl_class_no" maxlength="20">
          <input type="text" class="form-control" placeholder="course_id" name="mnl_course_id" maxlength="20">
          <input type="text" class="form-control" placeholder="name" name="mnl_name" maxlength="20">
          <input type="text" class="form-control" placeholder="major_id" name="mnl_major_id" maxlength="20">
          <input type="text" class="form-control" placeholder="year" name="mnl_year" maxlength="20">
          <input type="text" class="form-control" placeholder="credit" name="mnl_credit" maxlength="20">
          <input type="text" class="form-control" placeholder="lecturer_id" name="mnl_lecturer_id" maxlength="20">
          <input type="text" class="form-control" placeholder="person_max" name="mnl_person_max" maxlength="20">
          <input type="text" class="form-control" placeholder="opened" name="mnl_opened" maxlength="20">
          <input type="text" class="form-control" placeholder="room_id" name="mnl_room_id" maxlength="20">
        </div>
        <input type="submit" value="강좌 개설하기">
      </form>
    </div>
  </div>
  <div class="col-lg-4"></div>
</div>


</body>
</html>
