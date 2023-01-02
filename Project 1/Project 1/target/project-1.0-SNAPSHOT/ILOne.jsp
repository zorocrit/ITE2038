<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-11-08
  Time: 오전 1:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>세부 정보 입력</title>
    일요일에는 수업을 진행 할 수 없습니다. <br>
    토요일과 평일 18시 이후 수업은 E-러닝 강의로 분류됩니다.  <br>
    요일은 '월, 화, 수, 목, 금, 토' 중 하나 작성해주시고, <br>
    시간은 24시 기준으로, 분은 정시 시작이면 0을 적어주시면 됩니다. <br>
</head>
<body>
<%
    String lec = request.getParameter("classOne")==null ? "" : request.getParameter("classOne");
    if(lec.equals(null)) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('비어있는데??')");
        script.println("location.href = 'ILOne.jsp'");
        script.println("</script>");
    }
%>

<div class="container">
    <div class="col-lg-4"></div>
    <div class="col-lg-4">
        <div class="jumbotron" style="padding-top: 20px;">
            <form method="post" action="ILOne2.jsp">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="수업 번호를 재입력해주세요" name="classOneTwoThree" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="요일" name="oneDate" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="시작 시간" name="oneStart1" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="시작 분" name="oneStart2" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="끝 시간" name="oneEnd1" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="끝 분" name="oneEnd2" maxlength="20">
                </div>
                <input type="submit" value="등록하기">
            </form>
        </div>
    </div>
    <div class="col-lg-4"></div>
</div>
</body>
</html>
