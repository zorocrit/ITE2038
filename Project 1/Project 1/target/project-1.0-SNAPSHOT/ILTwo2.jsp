<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
    <title>강의 시간 설정 중</title>
</head>
<body>

<%@ include file ="dbconn.jsp" %>
<%
    request.setCharacterEncoding("utf-8");
    String on1 = request.getParameter("classOneTwoThree")==null ? "" : request.getParameter("classOneTwoThree");
    String on2 = request.getParameter("oneDate")==null ? "" : request.getParameter("oneDate");
    String on3 = request.getParameter("oneStart1")==null ? "" : request.getParameter("oneStart1");
    String on4 = request.getParameter("oneStart2")==null ? "" : request.getParameter("oneStart2");
    String on5 = request.getParameter("oneEnd1")==null ? "" : request.getParameter("oneEnd1");
    String on6 = request.getParameter("oneEnd2")==null ? "" : request.getParameter("oneEnd2");
    String on2t = request.getParameter("ToneDate")==null ? "" : request.getParameter("ToneDate");
    String on3t = request.getParameter("ToneStart1")==null ? "" : request.getParameter("ToneStart1");
    String on4t = request.getParameter("ToneStart2")==null ? "" : request.getParameter("ToneStart2");
    String on5t = request.getParameter("ToneEnd1")==null ? "" : request.getParameter("ToneEnd1");
    String on6t = request.getParameter("ToneEnd2")==null ? "" : request.getParameter("ToneEnd2");

    int ti1 = Integer.parseInt(on3);
    int ti2 = Integer.parseInt(on4);
    int ti3 = Integer.parseInt(on5);
    int ti4 = Integer.parseInt(on6);

    if(on1.equals(null)) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('비어있는데??')");
        script.println("location.href = 'ILOne.jsp'");
        script.println("</script>");
    }
    if(on6.equals(null)) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('비어있는데????')");
        script.println("location.href = 'ILOne.jsp'");
        script.println("</script>");
    }



    PrintWriter script = response.getWriter();
    int date = 0;

    if(on2.equals("월")){
        date = 1;
    }
    else if(on2.equals("화")){
        date = 2;
    }
    else if(on2.equals("수")){
        date = 3;
    }
    else if(on2.equals("목")){
        date = 4;
    }
    else if(on2.equals("금")){
        date = 5;
    }
    else if(on2.equals("토")){
        date = 6;
    }
    else {
        script.println("<script>");
        script.println("alert('잘못된 값입니다.')");
        script.println("location.href = 'ILOne.jsp'");
        script.println("</script>");
    }
    String k1 = "";
    String k2 = "";
    String k3 = "";
    String k4 = "";
    if(ti1 < 10) {
        k1 = "0" + ti1;
    }
    else {
        k1 = Integer.toString(ti1);
    }
    if(ti1 < 10) {
        k2 = "0" + ti2;
    }
    else {
        k2 = Integer.toString(ti2);
    }
    if(ti3 < 10) {
        k3 = "0" + ti3;
    }
    else {
        k3 = Integer.toString(ti3);
    }
    if(ti4 < 10) {
        k4 = "0" + ti4;
    }
    else {
        k4 = Integer.toString(ti4);
    }
    String date2 = Integer.toString(date);

    String data1 = "1900-01-0" + date2 + "T" + k1 + ":" + k2 + ":00.000Z";
    String data2 = "1900-01-0" + date2 + "T" + k3 + ":" + k4 + ":00.000Z";
    Statement stmt = null;
    try {
        String sql = "insert into time(class_id, period, begin, end) Values(" + on1 + ", 1, '" + data1 + "', '" + data2 + "')";
        //String sql = "insert into time(class_id, period, begin, end) Values(" + lec + ", 1, 'NO', 'NO')";
        stmt = conn.createStatement();
        stmt.executeUpdate(sql);
    } catch(SQLException ex) {
        script.println("<script>");
        script.println("alert('문제(1)가 발생하였습니다.')");
        script.println("location.href = 'ILTwo.jsp'");
        script.println("</script>");
    } finally {
        if(stmt != null) stmt.close();
    }

    int datet = 0;

    if(on2t.equals("월")){
        datet = 1;
    }
    else if(on2t.equals("화")){
        datet = 2;
    }
    else if(on2t.equals("수")){
        datet = 3;
    }
    else if(on2t.equals("목")){
        datet = 4;
    }
    else if(on2t.equals("금")){
        datet = 5;
    }
    else if(on2t.equals("토")){
        datet = 6;
    }
    else {
        script.println("<script>");
        script.println("alert('잘못된 값입니다.')");
        script.println("location.href = 'ILOne.jsp'");
        script.println("</script>");
    }
    int ti1t = Integer.parseInt(on3t);
    int ti2t = Integer.parseInt(on4t);
    int ti3t = Integer.parseInt(on5t);
    int ti4t = Integer.parseInt(on6t);

    String k1t = "";
    String k2t = "";
    String k3t = "";
    String k4t = "";
    if(ti1t < 10) {
        k1t = "0" + ti1t;
    }
    else {
        k1t = Integer.toString(ti1t);
    }
    if(ti1t < 10) {
        k2t = "0" + ti2t;
    }
    else {
        k2t = Integer.toString(ti2t);
    }
    if(ti3t < 10) {
        k3t = "0" + ti3t;
    }
    else {
        k3t = Integer.toString(ti3t);
    }
    if(ti4t < 10) {
        k4t = "0" + ti4t;
    }
    else {
        k4t = Integer.toString(ti4t);
    }
    String date2t = Integer.toString(datet);

    String data1t = "1900-01-0" + date2t + "T" + k1t + ":" + k2t + ":00.000Z";
    String data2t = "1900-01-0" + date2t + "T" + k3t + ":" + k4t + ":00.000Z";
    stmt = null;
    try {
        String sql = "insert into time(class_id, period, begin, end) Values(" + on1 + ", 2, '" + data1t + "', '" + data2t + "')";
        //String sql = "insert into time(class_id, period, begin, end) Values(" + lec + ", 1, 'NO', 'NO')";
        stmt = conn.createStatement();
        stmt.executeUpdate(sql);
        script.println("<script>");
        script.println("alert('시간 설정이 완료되었습니다.')");
        script.println("location.href = 'makeNewLecture.jsp'");
        script.println("</script>");
    } catch(SQLException ex) {
        script.println("<script>");
        script.println("alert('문제(1)가 발생하였습니다.')");
        script.println("location.href = 'ILTwo.jsp'");
        script.println("</script>");
    } finally {
        if(stmt != null) stmt.close();
        if(conn != null) conn.close();
    }


%>


</body>
</html>
