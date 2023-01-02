<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
    <title>한양대학교 수강 신청</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null)
		{
			userID = (String) session.getAttribute("userID");
		}
	%>

	<h3 style="test-align: center;">한양대학교 수강 신청</h3>
	<%
		if(userID == null)
		{
	%>
		<button type="button" class="navyBtn" onClick="location.href='login.jsp'">관리자 로그인</button>
		<button type="button" class="navyBtn" onClick="location.href='user_login.jsp'">사용자 로그인</button>
		<%--<button type="button" class="navyBtn" onClick="location.href='join.jsp'">회원가입</button>--%>
	
	<%		
		}
		else if(userID.equals("admin"))
		{
	%>
		<button type="button" class="navyBtn" onClick="location.href='makeNewLecture.jsp'">강좌 개설</button>
		<button type="button" class="navyBtn" onClick="location.href='deleteExistLecture.jsp'">강좌 삭제</button>
		<button type="button" class="navyBtn" onClick="location.href='changeStudentFirst.jsp'">학생 정보 조회 및 변경</button>
		<button type="button" class="navyBtn" onClick="location.href='adminLectureFirst.jsp'">과목 정보 조회 및 변경</button>
		<%--<button type="button" class="navyBtn" onClick="location.href='lectureSearch.jsp'">수강 편람</button>--%>
		<%--<button type="button" class="navyBtn" onClick="location.href='showAll.jsp'">모든 사용자 정보</button>--%>
		<button type="button" class="navyBtn" onClick="location.href='olap.jsp'">학점 분포 OLAP</button>
		<button type="button" class="navyBtn" onClick="location.href='logoutAction.jsp'">로그아웃</button>
	<%
		}

		else
		{

	%>

	<tr>
		<th>학번</th>
		<%=userID%>
	</tr>
		<button type="button" class="navyBtn" onClick="location.href='lectureSearch.jsp'">수강 편람 및 신청</button>
		<button type="button" class="navyBtn" onClick="location.href='myShoping.jsp'">희망 수업</button>
		<button type="button" class="navyBtn" onClick="location.href='showingLecture.jsp'">신청 내역</button>
		<button type="button" class="navyBtn" onClick="location.href='studnetTimeTable.jsp'">수업 시간표</button>
		<%--<button type="button" class="navyBtn" onClick="location.href='recheckPeopleNum.jsp'">최신 정보 갱신</button>--%>
		<%--<button type="button" class="navyBtn" onClick="location.href='showAll.jsp'">사용자 정보 변경</button>--%>
		<button type="button" class="navyBtn" onClick="location.href='logoutAction.jsp'">로그아웃</button>

	<%
		}
	%>
</body>
</html>