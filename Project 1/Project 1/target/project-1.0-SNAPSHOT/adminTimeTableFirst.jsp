<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-11-08
  Time: 오후 4:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>관리자 전용 시간표 확인</title>
</head>
<body>
<button type="button" class="navyBtn" onClick="location.href='main.jsp'">메인 화면으로</button>

<div class="container">
  <div class="col-lg-4"></div>
  <div class="col-lg-4">
    <div class="jumbotron" style="padding-top: 20px;">
      <form method="post" action="adminTimeTableSecond.jsp">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="학생 학번" name="stuID" maxlength="20">
        </div>
        <input type="submit" value="검색하기">
      </form>
    </div>
  </div>
  <div class="col-lg-4"></div>
</div>
</body>
</html>
