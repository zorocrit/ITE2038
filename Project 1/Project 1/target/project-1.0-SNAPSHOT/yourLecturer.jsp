<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>

<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="lecSearch" />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
    <title>지도 교수 조회 검색</title>
</head>


<body>
<button type="button" class="navyBtn" onClick="location.href='main.jsp'">메인 화면으로</button>

<div class="container">
    <div class="col-lg-4"></div>
    <div class="col-lg-4">
        <div class="jumbotron" style="padding-top: 20px;">
            <form method="post" action="yourLecturerSecond.jsp">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="학생 학번" name="toFindLecturer" maxlength="20">
                </div>
                <input type="submit" value="검색하기">
            </form>
        </div>
    </div>
    <div class="col-lg-4"></div>
</div>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>