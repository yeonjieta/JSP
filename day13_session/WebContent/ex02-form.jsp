<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01-form.jsp</title>
</head>
<body>
<%
		if(session.getAttribute("login") != null){
			response.sendRedirect("ex02-main.jsp");  // 이미 로그인 돼있으면 main으로 
		}
%>=

<h1>간단 로그인 구현</h1>

<form method="POST" action="ex02-action.jsp">
		<p><input type="text" name="userid" placeholder="ID"></p>
		<p><input type="password" name="userpw" placeholder="Password"></p>
		<p><input type="submit"></p>
</form>

</body>
</html>