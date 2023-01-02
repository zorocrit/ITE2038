<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<% request.setCharacterEncoding("UTF-8"); %>
<button type="button" class="navyBtn" onClick="location.href='main.jsp'">메인 화면으로</button>
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
    <title>신청 내역</title>
</head>
<script>
    $.fn.rowspan = function(colIdx, isStats) {
        return this.each(function(){
            var that;
            $('tr', this).each(function(row) {
                $('td:eq('+colIdx+')', this).filter(':visible').each(function(col) {

                    if ($(this).html() == $(that).html()
                        && (!isStats
                            || isStats && $(this).prev().html() == $(that).prev().html()
                        )
                    ) {
                        rowspan = $(that).attr("rowspan") || 1;
                        rowspan = Number(rowspan)+1;

                        $(that).attr("rowspan",rowspan);

// do your action for the colspan cell here
                        $(this).hide();

//$(this).remove();
// do your action for the old cell here

                    } else {
                        that = this;
                    }

// set the that if not already set
                    that = (that == null) ? this : that;
                });
            });
        });
    };
</script>
<body>
<%@ include file ="dbconn.jsp" %>

<%


    String student_id = (String)session.getAttribute("sessionUserID");
    PrintWriter script = response.getWriter();
    String userID = null;
    if(session.getAttribute("userID") != null)
    {
        userID = (String) session.getAttribute("userID");
    }
%>
<h3 style="test-align: center;"> 나의 수강 신청 내역 </h3>
<table id = "listTable" width="300" border="1">
    <tr>
        <th>신청취소</th>
        <th>신청취소확인</th>
        <th>수업번호</th>
        <th>학수번호</th>
        <th>교과목명</th>
        <th>교강사이름</th>
        <th>수업시간</th>
        <th>강의실</th>
        <th>수강 여부</th>
    </tr>
    <%ResultSet rs = null;
        Statement stmt = null;

        try {
            String sql = "select class.class_id, class_no, course_id, class.name, lecturer.name, count(time.period) as timePeriod, group_concat(time.begin) as timeInfo, class.room_id, building.name, retake from class left join lecturer on lecturer.lecturer_id = class.lecturer_id left join time on time.class_id = class.class_id left join room on room.room_id = class.room_id left join building on building.building_id = room.building_id left join application on application.class_id = class.class_id where begin is not null and student_id = '" + userID + "' group by class.class_id";
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
                int retake = rs.getInt("retake");
                String retakeString;
                if(retake == 0) {
                    retakeString = "X";
                }
                else {
                    retakeString = "O";
                }

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
        <form method="post" action="deleteMyRealLecture.jsp" >
            <td><input type = "checkbox" value="<%=cid%>" id = "wanaDelLec2" name = "wanaDelLec2"></td>
            <td><input type = "submit" value="확인"></td>
        </form>
        <td><%=class_no%></td>
        <td><%=course_id%></td>
        <td><%=name%></td>
        <td><%=lecName%></td>
        <td><%=finalDate%></td>
        <td><%=where%></td>
        <td><%=retakeString%></td>
    </tr>
    <%
            }
        } catch (SQLException ex) {
            rs.close();
        } finally{
            if(conn != null) {
                conn.close();
            }
        }
    %>
</table>
<script>
    $(document).ready(function() {
        $('#listTable').rowspan (4);
        $('#listTable').rowspan (5);
    });
</script>

</body>
</html>
