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
    <title>강의 검색</title>
</head>


<body>
<button type="button" class="navyBtn" onClick="location.href='main.jsp'">메인 화면으로</button>
<button type="button" class="navyBtn" onClick="location.href='all12.jsp'">수강편람</button>

<div class="container">
    <div class="col-lg-4"></div>
    <div class="col-lg-4">
        <div class="jumbotron" style="padding-top: 20px;">
            <form method="post" action="cla12.jsp">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="수업 번호" name="lecSearch" maxlength="20">
                </div>
                <input type="submit" value="검색하기">
            </form>
        </div>
    </div>
    <div class="col-lg-4"></div>
</div>

<div class="container">
    <div class="col-lg-4"></div>
    <div class="col-lg-4">
        <div class="jumbotron" style="padding-top: 20px;">
            <form method="post" action="les12.jsp">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="학수 번호" name="lec2Search" maxlength="20">
                </div>
                <input type="submit" value="검색하기">
            </form>
        </div>
    </div>
    <div class="col-lg-4"></div>
</div>

<div class="container">
    <div class="col-lg-4"></div>
    <div class="col-lg-4">
        <div class="jumbotron" style="padding-top: 20px;">
            <form method="post" action="cln12.jsp">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="교과목명" name="lectureName" maxlength="45">
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