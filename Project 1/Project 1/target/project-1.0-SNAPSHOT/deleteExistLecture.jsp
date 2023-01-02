<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
  <title>강좌 삭제</title>
</head>
<body>
<button type="button" class="navyBtn" onClick="location.href='main.jsp'">메인 화면으로</button>
<div class="container">
  <div class="col-lg-4"></div>
  <div class="col-lg-4">
    <div class="jumbotron" style="padding-top: 20px;">
      <form method="post" action="deletingExistLecture.jsp">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="class_id" name="del_class_id" maxlength="20">
        </div>
        <input type="submit" value="강좌 지우기">
      </form>
    </div>
  </div>
  <div class="col-lg-4"></div>
</div>


</body>
</html>
