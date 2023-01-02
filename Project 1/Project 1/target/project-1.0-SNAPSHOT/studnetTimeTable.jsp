<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
    <title>수업 시간표</title>
</head>
<body>
<button type="button" class="navyBtn" onClick="location.href='main.jsp'">메인 화면으로</button>
<table cellspacing="5" align="center" border="1" bordercolor="#5CD1E5"
       width="550" height="600">
    <tr align="center">
        <td width="50"></td>
        <td width="100" bgcolor="#5CD1E5">월</td>
        <td width="100" bgcolor="#5CD1E5">화</td>
        <td width="100" bgcolor="#5CD1E5">수</td>
        <td width="100" bgcolor="#5CD1E5">목</td>
        <td width="100" bgcolor="#5CD1E5">금</td>
    </tr>
<%@ include file ="dbconn.jsp" %>
<%


    String student_id = (String)session.getAttribute("sessionUserID");
    PrintWriter script = response.getWriter();

    String[] nine = {"9", "", "", "", "", ""};
    String[] ten = {"10", "", "", "", "", ""};
    String[] ele = {"11", "", "", "", "", ""};
    String[] twel = {"12", "", "", "", "", ""};
    String[] one = {"1", "", "", "", "", ""};
    String[] two = {"2", "", "", "", "", ""};
    String[] three = {"3", "", "", "", "", ""};
    String[] four = {"4", "", "", "", "", ""};
    String[] five = {"5", "", "", "", "", ""};


    String userID = null;
    if(session.getAttribute("userID") != null)
    {
        userID = (String) session.getAttribute("userID");
    }

    ResultSet rs = null;
    Statement stmt = null;
    try {
        String sql = "SELECT class.name, time.begin, time.end FROM application left join class on class.class_id = application.class_id left join time on time.class_id = class.class_id where student_id = " + userID;
        stmt = conn.createStatement();
        rs = stmt.executeQuery(sql);
        String[] timeFirst;
        String[] timeSecond;
        String[] timeThird;
        String[] timeFirst2;
        String[] timeSecond2;
        String[] timeThird2;
        String date;
        while (rs.next()) {
            String class_name = rs.getString("class.name");
            String time_begin = rs.getString("time.begin");
            String time_end = rs.getString("time.end");

            String finalDate = "";
            if(time_begin.equals("NO")) {
                finalDate = "시간 비지정 강좌";
            }
            else {
                timeFirst = time_begin.split(":");
                timeSecond = timeFirst[0].split("T");
                timeThird = timeSecond[0].split("-");
                timeFirst2 = time_end.split(":");
                timeSecond2 = timeFirst2[0].split("T");
                timeThird2 = timeSecond2[0].split("-");
                int fit = Integer.parseInt(timeSecond[1]);
                if(fit < 9) {
                    fit = fit + 12;
                }
                int fie = Integer.parseInt(timeSecond2[1]);
                if(fie < 9) {
                    fie = fie + 12;
                }
                date = timeThird[2];
                int day = Integer.parseInt(date);
                for(int i = 9; i < 18; i++) {
                    if(i >= fit && i < fie) {
                        if(i == 9) {
                            if(day == 1) {
                                nine[1] = class_name;
                            }
                            else if(day == 2) {
                                nine[2] = class_name;
                            }
                            else if(day == 3) {
                                nine[3] = class_name;
                            }
                            else if(day == 4) {
                                nine[4] = class_name;
                            }
                            else if(day == 5) {
                                nine[5] = class_name;
                            }
                        }
                        else if(i == 10) {
                            if(day == 1) {
                                ten[1] = class_name;
                            }
                            else if(day == 2) {
                                ten[2] = class_name;
                            }
                            else if(day == 3) {
                                ten[3] = class_name;
                            }
                            else if(day == 4) {
                                ten[4] = class_name;
                            }
                            else if(day == 5) {
                                ten[5] = class_name;
                            }
                        }
                        else if(i == 11) {
                            if(day == 1) {
                                ele[1] = class_name;
                            }
                            else if(day == 2) {
                                ele[2] = class_name;
                            }
                            else if(day == 3) {
                                ele[3] = class_name;
                            }
                            else if(day == 4) {
                                ele[4] = class_name;
                            }
                            else if(day == 5) {
                                ele[5] = class_name;
                            }
                        }
                        else if(i == 12) {
                            if(day == 1) {
                                twel[1] = class_name;
                            }
                            else if(day == 2) {
                                twel[2] = class_name;
                            }
                            else if(day == 3) {
                                twel[3] = class_name;
                            }
                            else if(day == 4) {
                                twel[4] = class_name;
                            }
                            else if(day == 5) {
                                twel[5] = class_name;
                            }
                        }
                        else if(i == 13) {
                            if(day == 1) {
                                one[1] = class_name;
                            }
                            else if(day == 2) {
                                one[2] = class_name;
                            }
                            else if(day == 3) {
                                one[3] = class_name;
                            }
                            else if(day == 4) {
                                one[4] = class_name;
                            }
                            else if(day == 5) {
                                one[5] = class_name;
                            }
                        }
                        else if(i == 14) {
                            if(day == 1) {
                                two[1] = class_name;
                            }
                            else if(day == 2) {
                                two[2] = class_name;
                            }
                            else if(day == 3) {
                                two[3] = class_name;
                            }
                            else if(day == 4) {
                                two[4] = class_name;
                            }
                            else if(day == 5) {
                                two[5] = class_name;
                            }
                        }
                         else if(i == 15) {
                            if(day == 1) {
                                three[1] = class_name;
                            }
                            else if(day == 2) {
                                three[2] = class_name;
                            }
                            else if(day == 3) {
                                three[3] = class_name;
                            }
                            else if(day == 4) {
                                three[4] = class_name;
                            }
                            else if(day == 5) {
                                three[5] = class_name;
                            }
                        }
                         else if(i == 16) {
                            if(day == 1) {
                                four[1] = class_name;
                            }
                            else if(day == 2) {
                                four[2] = class_name;
                            }
                            else if(day == 3) {
                                four[3] = class_name;
                            }
                            else if(day == 4) {
                                four[4] = class_name;
                            }
                            else if(day == 5) {
                                four[5] = class_name;
                            }
                        }
                         else if(i == 17) {
                            if(day == 1) {
                                five[1] = class_name;
                            }
                            else if(day == 2) {
                                five[2] = class_name;
                            }
                            else if(day == 3) {
                                five[3] = class_name;
                            }
                            else if(day == 4) {
                                five[4] = class_name;
                            }
                            else if(day == 5) {
                                five[5] = class_name;
                            }
                        }
                    }
                }
            }
        }
    } catch(SQLException ex) {
        script.println("<script>");
        script.println("alert('문제가 발생하였습니다.')");
        script.println("location.href = 'main.jsp'");
        script.println("</script>");
    } finally {
        if(stmt != null) stmt.close();
        if(conn != null) conn.close();
    }
%>
    <tr>
        <td><%=nine[0]%></td>
        <td><%=nine[1]%></td>
        <td><%=nine[2]%></td>
        <td><%=nine[3]%></td>
        <td><%=nine[4]%></td>
        <td><%=nine[5]%></td>
    </tr>
    <tr>
        <td><%=ten[0]%></td>
        <td><%=ten[1]%></td>
        <td><%=ten[2]%></td>
        <td><%=ten[3]%></td>
        <td><%=ten[4]%></td>
        <td><%=ten[5]%></td>
    </tr>
    <tr>
        <td><%=ele[0]%></td>
        <td><%=ele[1]%></td>
        <td><%=ele[2]%></td>
        <td><%=ele[3]%></td>
        <td><%=ele[4]%></td>
        <td><%=ele[5]%></td>
    </tr>
    <tr>
        <td><%=twel[0]%></td>
        <td><%=twel[1]%></td>
        <td><%=twel[2]%></td>
        <td><%=twel[3]%></td>
        <td><%=twel[4]%></td>
        <td><%=twel[5]%></td>
    </tr>
    <tr>
        <td><%=one[0]%></td>
        <td><%=one[1]%></td>
        <td><%=one[2]%></td>
        <td><%=one[3]%></td>
        <td><%=one[4]%></td>
        <td><%=one[5]%></td>
    </tr>
    <tr>
        <td><%=two[0]%></td>
        <td><%=two[1]%></td>
        <td><%=two[2]%></td>
        <td><%=two[3]%></td>
        <td><%=two[4]%></td>
        <td><%=two[5]%></td>
    </tr>
    <tr>
        <td><%=three[0]%></td>
        <td><%=three[1]%></td>
        <td><%=three[2]%></td>
        <td><%=three[3]%></td>
        <td><%=three[4]%></td>
        <td><%=three[5]%></td>
    </tr>
    <tr>
        <td><%=four[0]%></td>
        <td><%=four[1]%></td>
        <td><%=four[2]%></td>
        <td><%=four[3]%></td>
        <td><%=four[4]%></td>
        <td><%=four[5]%></td>
    </tr>
    <tr>
        <td><%=five[0]%></td>
        <td><%=five[1]%></td>
        <td><%=five[2]%></td>
        <td><%=five[3]%></td>
        <td><%=five[4]%></td>
        <td><%=five[5]%></td>
    </tr>

</body>
</html>
