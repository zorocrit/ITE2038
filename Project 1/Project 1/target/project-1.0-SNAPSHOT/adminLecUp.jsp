<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-11-07
  Time: 오전 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>과목 증원</title>
</head>
<body>
<button type="button" class="navyBtn" onClick="location.href='main.jsp'">메인 화면으로</button>
<div class="container">
  <div class="col-lg-4"></div>
  <div class="col-lg-4">
    <div class="jumbotron" style="padding-top: 20px;">
      <form method="post" action="adminLectureSecond.jsp">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="증원 수업 번호" name="increaseLecNum" maxlength="20">
          <input type="text" class="form-control" placeholder="인원 설정" name="increasePeoNum" maxlength="20">
        </div>
        <input type="submit" value="확인하기">
      </form>
    </div>
  </div>
  <div class="col-lg-4"></div>
</div>
</body>
</html>
