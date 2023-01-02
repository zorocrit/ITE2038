<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userGender" />
<jsp:setProperty name="user" property="userEmail" />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <title>로그인 액션</title>
</head>
<body>
    <%
    	String userID = null;
		if(session.getAttribute("userID") != null)
		{
			userID = (String) session.getAttribute("userID");
		}
		if(userID != null)
		{
			PrintWriter script = response.getWriter();
    	    script.println("<script>");
    	    script.println("alert('이미 로그인이 되어있습니다.')");
    	    script.println("location.href = 'main.jsp'");
    	    script.println("</script>");
		}
    
    	if(user.getUserID() == null ||
    	   user.getUserPassword() == null ||
    	   user.getUserName() == null ||
    	   user.getUserGender() == null ||
    	   user.getUserEmail() == null)
    	{
    		PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('모든 칸을 채워주세요.')");
            script.println("history.back()");
            script.println("</script>");
    	}
    	else
    	{
            UserDAO userDAO = new UserDAO();

            int result = userDAO.join(user);

            if(result == -1)
            {
            	PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('이미 존재하는 아이디입니다.')");
                script.println("history.back()");
                script.println("</script>");
            }
            else
            {
            	PrintWriter script = response.getWriter();
            	script.println("<script>");
                script.println("alert('로그인페이지로 이동합니다.')");
            	script.println("location.href = 'login.jsp'");
            	script.println("</script>");
            }
    	}
    %>

</body>
</html>