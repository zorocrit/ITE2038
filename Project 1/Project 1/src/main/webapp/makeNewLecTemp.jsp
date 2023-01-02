<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-11-08
  Time: 오전 12:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

</head>
<body>
<%
  String lec = request.getParameter("checkLec2")==null ? "" : request.getParameter("checkLec2");
%>

</body>
</html>
<div class="container">
  <div class="col-lg-4"></div>
  <div class="col-lg-4">
    <div class="jumbotron" style="padding-top: 20px;">
      <form method="post" action="makingNewLectureSecond.jsp">
        <div class="form-group">
          <input type = "checkbox" value="<%=lec%>" id = "checkLec" name = "checkLec2" checked = "checked" disabled = "disabled">
          <input type="text" class="form-control" placeholder="횟수(0, 1, 2)" name="howMuch" maxlength="20">
        </div>
        <input type="submit" value="시간 설정하기">
      </form>
    </div>
  </div>
  <div class="col-lg-4"></div>
</div>