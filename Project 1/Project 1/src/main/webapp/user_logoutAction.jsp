<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
    <title>로그인 액션</title>
</head>
<body>
    <%
    	session.invalidate();
    %>
	<script>
		location.href = 'main.jsp';
	</script>
</body>
</html>