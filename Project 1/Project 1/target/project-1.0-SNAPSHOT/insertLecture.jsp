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
  <title>수강 신청 중</title>
</head>
<body>

<%@ include file ="dbconn.jsp" %>
  <%
    request.setCharacterEncoding("utf-8");
    String class_request = (String)request.getParameter("checkLec");
    if(class_request.equals(null)) {
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('비어있는데??')");
      script.println("location.href = 'lectureSearch.jsp'");
      script.println("</script>");
    }

    String student_id = (String)session.getAttribute("sessionUserID");
    PrintWriter script = response.getWriter();

    int cid = Integer.parseInt(class_request);
    String userID = null;
    if(session.getAttribute("userID") != null)
    {
      userID = (String) session.getAttribute("userID");
    }

    String[] timeFirstC;
    String[] timeSecondC;
    String[] timeThirdC;
    String[] timeFirst2C;
    String[] timeSecond2C;
    String[] timeThird2C;

    String[] inputData;

    Statement stmt = null;
    ResultSet rs = null;
    int CT = 0;

    String[] nine = {"9", "", "", "", "", ""};
    String[] ten = {"10", "", "", "", "", ""};
    String[] ele = {"11", "", "", "", "", ""};
    String[] twel = {"12", "", "", "", "", ""};
    String[] one = {"1", "", "", "", "", ""};
    String[] two = {"2", "", "", "", "", ""};
    String[] three = {"3", "", "", "", "", ""};
    String[] four = {"4", "", "", "", "", ""};
    String[] five = {"5", "", "", "", "", ""};


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
        if (time_begin.equals("NO")) {
          finalDate = "시간 비지정 강좌";
        } else {
          timeFirst = time_begin.split(":");
          timeSecond = timeFirst[0].split("T");
          timeThird = timeSecond[0].split("-");
          timeFirst2 = time_end.split(":");
          timeSecond2 = timeFirst2[0].split("T");
          timeThird2 = timeSecond2[0].split("-");
          int fit = Integer.parseInt(timeSecond[1]);
          if (fit < 9) {
            fit = fit + 12;
          }
          int fie = Integer.parseInt(timeSecond2[1]);
          if (fie < 9) {
            fie = fie + 12;
          }
          date = timeThird[2];
          int day = Integer.parseInt(date);
          for (int i = 9; i < 18; i++) {
            if (i >= fit && i < fie) {
              if (i == 9) {
                if (day == 1) {
                  nine[1] = class_name;
                } else if (day == 2) {
                  nine[2] = class_name;
                } else if (day == 3) {
                  nine[3] = class_name;
                } else if (day == 4) {
                  nine[4] = class_name;
                } else if (day == 5) {
                  nine[5] = class_name;
                }
              } else if (i == 10) {
                if (day == 1) {
                  ten[1] = class_name;
                } else if (day == 2) {
                  ten[2] = class_name;
                } else if (day == 3) {
                  ten[3] = class_name;
                } else if (day == 4) {
                  ten[4] = class_name;
                } else if (day == 5) {
                  ten[5] = class_name;
                }
              } else if (i == 11) {
                if (day == 1) {
                  ele[1] = class_name;
                } else if (day == 2) {
                  ele[2] = class_name;
                } else if (day == 3) {
                  ele[3] = class_name;
                } else if (day == 4) {
                  ele[4] = class_name;
                } else if (day == 5) {
                  ele[5] = class_name;
                }
              } else if (i == 12) {
                if (day == 1) {
                  twel[1] = class_name;
                } else if (day == 2) {
                  twel[2] = class_name;
                } else if (day == 3) {
                  twel[3] = class_name;
                } else if (day == 4) {
                  twel[4] = class_name;
                } else if (day == 5) {
                  twel[5] = class_name;
                }
              } else if (i == 13) {
                if (day == 1) {
                  one[1] = class_name;
                } else if (day == 2) {
                  one[2] = class_name;
                } else if (day == 3) {
                  one[3] = class_name;
                } else if (day == 4) {
                  one[4] = class_name;
                } else if (day == 5) {
                  one[5] = class_name;
                }
              } else if (i == 14) {
                if (day == 1) {
                  two[1] = class_name;
                } else if (day == 2) {
                  two[2] = class_name;
                } else if (day == 3) {
                  two[3] = class_name;
                } else if (day == 4) {
                  two[4] = class_name;
                } else if (day == 5) {
                  two[5] = class_name;
                }
              } else if (i == 15) {
                if (day == 1) {
                  three[1] = class_name;
                } else if (day == 2) {
                  three[2] = class_name;
                } else if (day == 3) {
                  three[3] = class_name;
                } else if (day == 4) {
                  three[4] = class_name;
                } else if (day == 5) {
                  three[5] = class_name;
                }
              } else if (i == 16) {
                if (day == 1) {
                  four[1] = class_name;
                } else if (day == 2) {
                  four[2] = class_name;
                } else if (day == 3) {
                  four[3] = class_name;
                } else if (day == 4) {
                  four[4] = class_name;
                } else if (day == 5) {
                  four[5] = class_name;
                }
              } else if (i == 17) {
                if (day == 1) {
                  five[1] = class_name;
                } else if (day == 2) {
                  five[2] = class_name;
                } else if (day == 3) {
                  five[3] = class_name;
                } else if (day == 4) {
                  five[4] = class_name;
                } else if (day == 5) {
                  five[5] = class_name;
                }
              }
            }
          }
        }
      }
    }
      catch(SQLException ex) {
        script.println("<script>");
        script.println("alert('문제_1가 발생하였습니다.')");
        script.println("location.href = 'lectureSearch.jsp'");
        script.println("</script>");
        CT++;
      } finally {
        if(stmt != null) stmt.close();
      }
    rs = null;
    stmt = null;

    String date;
    String[] info1 = new String[5];
    String[] info2 = new String[5];
    String[] info3 = new String[5];
    String[] info4 = new String[5];
    try {
      String sql = "select count(time.period) as timePeriod, time.begin, time.end from class left join time on time.class_id = class.class_id where begin is not null and class.class_id = " + cid + " group by class.class_id";
      stmt = conn.createStatement();
      rs = stmt.executeQuery(sql);
      String[] timeFirst;
      String[] timeSecond;
      String[] timeThird;
      String[] timeFirst2;
      String[] timeSecond2;
      String[] timeThird2;
      String date7;
      while (rs.next()) {
        String peri = rs.getString("timePeriod");
        String time_begin = rs.getString("time.begin");
        String time_end = rs.getString("time.end");
        String finalDate = "";
        if (time_begin.equals("NO")) {
          finalDate = "시간 비지정 강좌";
        } else {
          timeFirst = time_begin.split(":");
          timeSecond = timeFirst[0].split("T");
          timeThird = timeSecond[0].split("-");
          timeFirst2 = time_end.split(":");
          timeSecond2 = timeFirst2[0].split("T");
          timeThird2 = timeSecond2[0].split("-");
          int fit = Integer.parseInt(timeSecond[1]);
          if (fit < 9) {
            fit = fit + 12;
          }
          int fie = Integer.parseInt(timeSecond2[1]);
          if (fie < 9) {
            fie = fie + 12;
          }
          date7 = timeThird[2];
          int day = Integer.parseInt(date7);
          for (int i = 9; i < 18; i++) {
            if (i >= fit && i < fie) {
              if (i == 9) {
                if (day == 1) {
                  if(!(nine[1].equals(""))) {
                    script.println("<script>");
                    script.println("alert('중복된 시간입니다.(Error-code: 1)')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    CT++;
                  }
                } else if (day == 2) {
                  if(!(nine[2].equals(""))) {
                    script.println("<script>");
                    script.println("alert('중복된 시간입니다.(Error-code: 2)')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    CT++;
                  }
                } else if (day == 3) {
                  if(!(nine[3].equals(""))) {
                    script.println("<script>");
                    script.println("alert('중복된 시간입니다.(Error-code: 2)')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    CT++;
                  }
                } else if (day == 4) {
                  if(!(nine[4].equals(""))) {
                    script.println("<script>");
                    script.println("alert('중복된 시간입니다.(Error-code: 2)')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    CT++;
                  }
                } else if (day == 5) {
                  if(!(nine[5].equals(""))) {
                    script.println("<script>");
                    script.println("alert('중복된 시간입니다.(Error-code: 2)')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    CT++;
                  }
                }
              } else if (i == 10) {
                if (day == 1) {
                  if(!(ten[1].equals(""))) {
                    script.println("<script>");
                    script.println("alert('중복된 시간입니다.(Error-code: 3)')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    CT++;
                  }
                } else if (day == 2) {
                  if(!(ten[2].equals(""))) {
                    script.println("<script>");
                    script.println("alert('중복된 시간입니다.(Error-code: 3)')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    CT++;
                  }
                } else if (day == 3) {
                  if(!(ten[3].equals(""))) {
                    script.println("<script>");
                    script.println("alert('중복된 시간입니다.(Error-code: 3)')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    CT++;
                  }
                } else if (day == 4) {
                  if(!(ten[4].equals(""))) {
                    script.println("<script>");
                    script.println("alert('중복된 시간입니다.(Error-code: 3)')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    CT++;
                  }
                } else if (day == 5) {
                  if(!(ten[5].equals(""))) {
                    script.println("<script>");
                    script.println("alert('중복된 시간입니다.(Error-code: 3)')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    CT++;
                  }
                }
              } else if (i == 11) {
                if (day == 1) {
                  if(!(ele[1].equals(""))) {
                    script.println("<script>");
                    script.println("alert('중복된 시간입니다.(Error-code: 4)')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    CT++;
                  }
                } else if (day == 2) {
                  if(!(ele[2].equals(""))) {
                    script.println("<script>");
                    script.println("alert('중복된 시간입니다.(Error-code: 4)')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    CT++;
                  }
                } else if (day == 3) {
                  if(!(ele[3].equals(""))) {
                    script.println("<script>");
                    script.println("alert('중복된 시간입니다.(Error-code: 4)')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    CT++;
                  }
                } else if (day == 4) {
                  if(!(ele[4].equals(""))) {
                    script.println("<script>");
                    script.println("alert('중복된 시간입니다.(Error-code: 4)')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    CT++;
                  }
                } else if (day == 5) {
                  if(!(ele[5].equals(""))) {
                    script.println("<script>");
                    script.println("alert('중복된 시간입니다.(Error-code: 4)')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    CT++;
                  }
                }
              } else if (i == 12) {
                if (day == 1) {
                  if(!(twel[1].equals(""))) {
                    script.println("<script>");
                    script.println("alert('중복된 시간입니다.(Error-code: 5)')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    CT++;
                  }
                } else if (day == 2) {
                  if(!(twel[2].equals(""))) {
                    script.println("<script>");
                    script.println("alert('중복된 시간입니다.(Error-code: 5)')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    CT++;
                  }
                } else if (day == 3) {
                  if(!(twel[3].equals(""))) {
                    script.println("<script>");
                    script.println("alert('중복된 시간입니다.(Error-code: 5)')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    CT++;
                  }
                } else if (day == 4) {
                  if(!(twel[4].equals(""))) {
                    script.println("<script>");
                    script.println("alert('중복된 시간입니다.(Error-code: 5)')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    CT++;
                  }
                } else if (day == 5) {
                  if(!(twel[5].equals(""))) {
                    script.println("<script>");
                    script.println("alert('중복된 시간입니다.(Error-code: 5)')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    CT++;
                  }
                }
              } else if (i == 13) {
                if (day == 1) {
                  if(!(one[1].equals(""))) {
                    script.println("<script>");
                    script.println("alert('중복된 시간입니다.(Error-code: 6)')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    CT++;
                  }
                } else if (day == 2) {
                  if(!(one[2].equals(""))) {
                    script.println("<script>");
                    script.println("alert('중복된 시간입니다.(Error-code: 6)')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    CT++;
                  }
                } else if (day == 3) {
                  if(!(one[3].equals(""))) {
                    script.println("<script>");
                    script.println("alert('중복된 시간입니다.(Error-code: 6)')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    CT++;
                  }
                } else if (day == 4) {
                  if(!(one[4].equals(""))) {
                    script.println("<script>");
                    script.println("alert('중복된 시간입니다.(Error-code: 6)')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    CT++;
                  }
                } else if (day == 5) {
                  if(!(one[5].equals(""))) {
                    script.println("<script>");
                    script.println("alert('중복된 시간입니다.(Error-code: 6)')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    CT++;
                  }
                }
              } else if (i == 14) {
                if (day == 1) {
                  if(!(two[1].equals(""))) {
                    script.println("<script>");
                    script.println("alert('중복된 시간입니다.(Error-code: 7)')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    CT++;
                  }
                } else if (day == 2) {
                  if(!(two[2].equals(""))) {
                    script.println("<script>");
                    script.println("alert('중복된 시간입니다.(Error-code: 7)')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    CT++;
                  }
                } else if (day == 3) {
                  if(!(two[3].equals(""))) {
                    script.println("<script>");
                    script.println("alert('중복된 시간입니다.(Error-code: 7)')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    CT++;
                  }
                } else if (day == 4) {
                  if(!(two[4].equals(""))) {
                    script.println("<script>");
                    script.println("alert('중복된 시간입니다.(Error-code: 7)')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    CT++;
                  }
                } else if (day == 5) {
                  if(!(two[5].equals(""))) {
                    script.println("<script>");
                    script.println("alert('중복된 시간입니다.(Error-code: 7)')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    CT++;
                  }
                }
              } else if (i == 15) {
                if (day == 1) {
                  if(!(three[1].equals(""))) {
                    script.println("<script>");
                    script.println("alert('중복된 시간입니다.(Error-code: 8)')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    CT++;
                  }
                } else if (day == 2) {
                  if(!(three[2].equals(""))) {
                    script.println("<script>");
                    script.println("alert('중복된 시간입니다.(Error-code: 8)')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    CT++;
                  }
                } else if (day == 3) {
                  if(!(three[3].equals(""))) {
                    script.println("<script>");
                    script.println("alert('중복된 시간입니다.(Error-code: 8)')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    CT++;
                  }
                } else if (day == 4) {
                  if(!(three[4].equals(""))) {
                    script.println("<script>");
                    script.println("alert('중복된 시간입니다.(Error-code: 8)')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    CT++;
                  }
                } else if (day == 5) {
                  if(!(three[5].equals(""))) {
                    script.println("<script>");
                    script.println("alert('중복된 시간입니다.(Error-code: 8)')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    CT++;
                  }
                }
              } else if (i == 16) {
                if (day == 1) {
                  if(!(four[1].equals(""))) {
                    script.println("<script>");
                    script.println("alert('중복된 시간입니다.(Error-code: 9)')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    CT++;
                  }
                } else if (day == 2) {
                  if(!(four[2].equals(""))) {
                    script.println("<script>");
                    script.println("alert('중복된 시간입니다.(Error-code: 9)')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    CT++;
                  }
                } else if (day == 3) {
                  if(!(four[3].equals(""))) {
                    script.println("<script>");
                    script.println("alert('중복된 시간입니다.(Error-code: 9)')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    CT++;
                  }
                } else if (day == 4) {
                  if(!(four[4].equals(""))) {
                    script.println("<script>");
                    script.println("alert('중복된 시간입니다.(Error-code: 9)')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    CT++;
                  }
                } else if (day == 5) {
                  if(!(four[5].equals(""))) {
                    script.println("<script>");
                    script.println("alert('중복된 시간입니다.(Error-code: 9)')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    CT++;
                  }
                }
              } else if (i == 17) {
                if (day == 1) {
                  if(!(five[1].equals(""))) {
                    script.println("<script>");
                    script.println("alert('중복된 시간입니다.(Error-code: 10)')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    CT++;
                  }
                } else if (day == 2) {
                  if(!(five[2].equals(""))) {
                    script.println("<script>");
                    script.println("alert('중복된 시간입니다.(Error-code: 10)')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    CT++;
                  }
                } else if (day == 3) {
                  if(!(five[3].equals(""))) {
                    script.println("<script>");
                    script.println("alert('중복된 시간입니다.(Error-code: 10)')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    CT++;
                  }
                } else if (day == 4) {
                  if(!(five[4].equals(""))) {
                    script.println("<script>");
                    script.println("alert('중복된 시간입니다.(Error-code: 10)')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    CT++;
                  }
                } else if (day == 5) {
                  if(!(five[5].equals(""))) {
                    script.println("<script>");
                    script.println("alert('중복된 시간입니다.(Error-code: 10)')");
                    script.println("location.href = 'lectureSearch.jsp'");
                    script.println("</script>");
                    CT++;
                  }
                }
              }
            }
          }
        }
      }
    } catch(SQLException ex) {
      script.println("<script>");
      script.println("alert('문제_2가 발생하였습니다.')");
      script.println("location.href = 'main.jsp'");
      script.println("</script>");
      CT++;
    } finally {
      if(stmt != null) stmt.close();
    }
    stmt = null;
    rs = null;
    try{
      String sql = "select class.class_id, count(student_id) as cd, person_max from application left join class on class.class_id = application.class_id where class.class_id = " + cid + " group by class_id";
      stmt = conn.createStatement();
      rs = stmt.executeQuery(sql);
      while (rs.next()) {
        String cd = rs.getString("cd");
        String person = rs.getString("person_max");
        String temCheck = rs.getString("class.class_id");
        int in1 = Integer.parseInt(cd);
        int in2 = Integer.parseInt(person);
        if(in1 >= in2) {
          script.println("<script>");
          script.println("alert('수강 인원이 초과하였습니다.')");
          script.println("location.href = 'lectureSearch.jsp'");
          script.println("</script>");
          CT++;
        }
      }
    }catch(SQLException ex) {
      script.println("<script>");
      script.println("alert('인원 확인 과정에서 문제가 발생하였습니다.')");
      script.println("location.href = 'lectureSearch.jsp'");
      script.println("</script>");
      CT++;
    } finally {
      if(stmt != null) stmt.close();
    }

    stmt = null;
    try {
      if(CT == 0) {
        String sql = "insert into application(student_id, class_id) Values(" + userID + ", " + cid + ")";
        stmt = conn.createStatement();
        stmt.executeUpdate(sql);
        script.println("<script>");
        script.println("alert('수강신청을 진행중입니다.')");
        script.println("location.href = 'checkReview.jsp'");
        script.println("</script>");
      }
      else {
        script.println("<script>");
        script.println("alert('다시 신청해주세요')");
        script.println("location.href = 'lectureSearch.jsp'");
        script.println("</script>");
      }
    } catch(SQLException ex) {
      script.println("<script>");
      script.println("alert('문제가 발생하였습니다.')");
      script.println("location.href = 'lectureSearch.jsp'");
      script.println("</script>");
    } finally {
      if(stmt != null) stmt.close();
      if(conn != null) conn.close();
    }



  %>


<%--

    String date;
    String[] info1 = new String[5];
    String[] info2 = new String[5];
    String[] info3 = new String[5];
    String[] info4 = new String[5];
    try {
      String sql = "select class.class_id, count(time.period) as timePeriod, group_concat(time.begin) as timeInfo, group_concat(time.end) as timeInfo2 from class left join time on time.class_id = class.class_id where begin is not null and class.class_id = " + cid + " group by class.class_id";
      stmt = conn.createStatement();
      rs = stmt.executeQuery(sql);

      while (rs.next()) {
        String peri = rs.getString("timePeriod");
        String inf1 = rs.getString("timeInfo");
        String inf2 = rs.getString("timeInfo2");
        if(peri.equals("1")) {
          char[] beginc = inf1.toCharArray();
          char[] endc = inf2.toCharArray();
          info1 = new String[]{"B" + beginc[9] + beginc[11] + beginc[12] + beginc[14] + beginc[15]};
          info2 = new String[]{"E" + endc[9] + endc[11] + endc[12] + endc[13] + endc[14]};
        }
        else if(peri.equals("2")) {
          char[] beginc = inf1.toCharArray();
          char[] endc = inf2.toCharArray();
          info1 = new String[]{"B" + beginc[9] + beginc[11] + beginc[12] + beginc[14] + beginc[15]};
          info2 = new String[]{"E" + endc[9] + endc[11] + endc[12] + endc[13] + endc[14]};
          info3 = new String[]{"B" + beginc[34] + beginc[36] + beginc[37] + beginc[39] + beginc[40]};
          info4 = new String[]{"E" + endc[34] + endc[36] + endc[37] + endc[39] + endc[40]};
        }
      }
    } catch(SQLException ex) {
      script.println("<script>");
      script.println("alert('문제_2가 발생하였습니다.')");
      script.println("location.href = 'main.jsp'");
      script.println("</script>");
    } finally {
      if(stmt != null) stmt.close();
    }
--%>

</body>
</html>
