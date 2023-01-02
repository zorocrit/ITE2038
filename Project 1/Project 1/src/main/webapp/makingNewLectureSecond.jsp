<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-11-08
  Time: 오전 12:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter" %>
<%@ include file ="dbconn.jsp" %>
<html>
</html>

<head>
    <title>시간 설정 중간 과정</title>
</head>
<h3 style="test-align: center;"> 수업 번호 검색</h3>
<table width="300" border="1">
    <tr>
        <th>수업 정보 처리중...</th>
    </tr>
<body>
<%
    String lec = request.getParameter("checkLec2");
    String lac = request.getParameter("howMuch");
    int lic = Integer.parseInt(lac);
    if(!(lic == 1 || lic == 2 || lic == 0)) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
            script.println("alert('잘못된 값이 입력되었습니다.')");
            script.println("location.href = 'makeNewLectureSecond.jsp'");
            script.println("</script>");
    }
    if(lic == 1) {
%>
<tr>
    <form method="post" action="ILOne.jsp" >
        <td><input type = "checkbox" value ="<%=lec%>" id = "classOne" name = "classOne" checked = "checked" disabled = "disabled"></td>
        강의 일수가 1일 맞나요?
        <td><input type = "submit" value="확인"></td>
    </form>
</tr>
<%
    }
    else if(lic == 2) {
%>
<tr>
    <form method="post" action="ILTwo.jsp" >
        <td><input type = "checkbox" value ="<%=lec%>" id = "classTwo" name = "classTwo" checked = "checked" disabled = "disabled"></td>
        강의 일수가 2일 맞나요?
        <td><input type = "submit" value="확인"></td>
    </form>>
</tr>
<%
    }
    else {
        Statement stmt = null;
        try {
            String sql = "insert into time(class_id, period, begin, end) Values(" + lec + ", 1, 'NO', 'NO')";
            stmt = conn.createStatement();
            stmt.executeUpdate(sql);
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('E 러닝 강좌로 개설이 완료되었습니다.')");
            script.println("location.href = 'makeNewLecture.jsp'");
            script.println("</script>");
        } catch(SQLException ex) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('E 러닝 수업으로 지정하는 과정에서 문제가 발생하였습니다.')");
            script.println("location.href = 'makNewLecTemp.jsp'");
            script.println("</script>");
        } finally {
            if(stmt != null) stmt.close();
            if(conn != null) conn.close();
        }
    }
%>
</table>
</body>