<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<button type="button" class="navyBtn" onClick="location.href='main.jsp'">메인 화면으로</button>
<!DOCTYPE html>
<style>
    table, th, td {
        border: 1px solid #bcbcbc;
    }
    table {
        width: 910px;
    }
</style>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
    <title>학수 번호 검색</title>
</head>
<body>
    <h3 style="test-align: center;"> 학수 번호 검색</h3>
    <%@ include file ="dbconn.jsp" %>
    <table width="300" border="1">
        <tr>
            <th>신청</th>
            <th>신청확인</th>
            <th>희망신청</th>
            <th>희망신청확인</th>
            <th>수업번호</th>
            <th>학수번호</th>
            <th>교과목명</th>
            <th>교강사이름</th>
            <th>수업시간</th>
            <th>신청인원/수강인원</th>
            <th>강의실</th>
        </tr>
            <%
            ResultSet rs = null;
            Statement stmt = null;

            try {
                String lec2 = request.getParameter("lec2Search");
                String sql = "select class.class_id, class.person_max, count(time.period) as timePeriod, class_no, course_id, class.name, lecturer.name, count(distinct application.idapplication) as counting, group_concat(time.begin) as timeInfo, class.room_id, building.name from class left join lecturer on lecturer.lecturer_id = class.lecturer_id left join time on time.class_id = class.class_id left join room on room.room_id = class.room_id left join application on class.class_id = application.class_id left join building on building.building_id = room.building_id where begin is not null and course_id = '" + lec2 + "' group by class.class_id";
                stmt = conn.createStatement();
                rs = stmt.executeQuery(sql);

                while (rs.next()) {
                    int class_id = rs.getInt("class.class_id");
                    int class_no = rs.getInt("class_no");
                    String course_id = rs.getString("course_id");
                    String name = rs.getString("class.name");
                    String lecName = rs.getString("lecturer.name");
                    String timeBegin = rs.getString("timeInfo");
                    int room_id = rs.getInt("class.room_id");
                    String building = rs.getString("building.name");
                    String roomRom = Integer.toString(room_id);
                    String where = building + " " + roomRom;
                    String cid = Integer.toString(class_id);
                    int maxPerson = rs.getInt("class.person_max");
                    int count = rs.getInt("counting");
                    String show = count + "/" + maxPerson;

                    int time = rs.getInt("timePeriod");
                    String finalDate = "";
                    if(timeBegin.equals("NO")) {
                        finalDate = "시간 비지정 강좌";
                    }
                    else if(timeBegin.length() < 30) {
                        String[] timeFirst = timeBegin.split(":");
                        String[] timeSecond = timeFirst[0].split("T");
                        String[] timeThird = timeSecond[0].split("-");
                        String date;
                        if(timeThird[2].equals("01")) {
                            date = "월";
                        }
                        else if(timeThird[2].equals("02")) {
                            date = "화";
                        }
                        else if(timeThird[2].equals("03")) {
                            date = "수";
                        }
                        else if(timeThird[2].equals("04")) {
                            date = "목";
                        }
                        else if(timeThird[2].equals("05")) {
                            date = "금";
                        }
                        else if(timeThird[2].equals("06")) {
                            date = "토";
                        }
                        else {
                            date = "알 수 없음";
                        }

                        finalDate = date + "요일 " + timeSecond[1] + "시 " + timeFirst[1] + "분";
                    }
                    else if(timeBegin.length() > 30) {
                        String[] check = timeBegin.split(",");
                        String[] timeFirst = check[0].split(":");
                        String[] timeSecond = timeFirst[0].split("T");
                        String[] timeThird = timeSecond[0].split("-");

                        String[] timeFirst2 = check[1].split(":");
                        String[] timeSecond2 = timeFirst2[0].split("T");
                        String[] timeThird2 = timeSecond2[0].split("-");

                        String date;
                        if(timeThird[2].equals("01")) {
                            date = "월";
                        }
                        else if(timeThird[2].equals("02")) {
                            date = "화";
                        }
                        else if(timeThird[2].equals("03")) {
                            date = "수";
                        }
                        else if(timeThird[2].equals("04")) {
                            date = "목";
                        }
                        else if(timeThird[2].equals("05")) {
                            date = "금";
                        }
                        else if(timeThird[2].equals("06")) {
                            date = "토";
                        }
                        else {
                            date = "알 수 없음";
                        }

                        String date2;
                        if(timeThird2[2].equals("01")) {
                            date2 = "월";
                        }
                        else if(timeThird2[2].equals("02")) {
                            date2 = "화";
                        }
                        else if(timeThird2[2].equals("03")) {
                            date2 = "수";
                        }
                        else if(timeThird2[2].equals("04")) {
                            date2 = "목";
                        }
                        else if(timeThird2[2].equals("05")) {
                            date2 = "금";
                        }
                        else if(timeThird2[2].equals("06")) {
                            date2 = "토";
                        }
                        else {
                            date2 = "알 수 없음";
                        }

                        finalDate = date + "요일 " + timeSecond[1] + "시 " + timeFirst[1] + "분, " + date2 + "요일 " + timeSecond2[1] + "시 " + timeFirst2[1] + "분";
                    }
                    else {
                        finalDate = "알 수 없음";
                    }
            %>
            <tr>
                <form method="post" action="insertLecture.jsp" >
                    <td><input type = "checkbox" value="<%=cid%>" id = "checkLec" name = "checkLec"></td>
                    <td><input type = "submit" value="확인"></td>
                </form>
                <form method="post" action="hopeInsertLecture.jsp" >
                    <td><input type = "checkbox" value="<%=cid%>" id = "wanaLec" name = "wanaLec"></td>
                    <td><input type = "submit" value="확인"></td>
                </form>
                <td><%=class_no%></td>
                <td><%=course_id%></td>
                <td><%=name%></td>
                <td><%=lecName%></td>
                <td><%=finalDate%></td>
                <td><%=show%></td>
                <td><%=where%></td>
            </tr>
            <%
                    }
                } catch (SQLException ex) {
                        PrintWriter script = response.getWriter();
                        script.println("<script>");
                        script.println("alert('문제가 발생하였습니다.')");
                        script.println("location.href = 'lectureSearch.jsp'");
                        script.println("</script>");
                    rs.close();
                } finally{
                    if(conn != null) {
                        conn.close();
                    }
                }
            %>
        </table>



</body>
</html>
