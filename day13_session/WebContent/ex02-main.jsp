<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02-main.jsp</title>
</head>
<body>


<%
		if(session.getAttribute("login") == null) {
			response.sendRedirect("ex02-form.jsp");   // 객체가 없으면 띄울 수 없다. login부터 하고 와라
		}
%>

<h1>로그인 이후 메인화면</h1>
<hr>

<h3>ID : ${login.userid }</h3>
<h3>Password : *******</h3>
<h3>Name : ${login.username }</h3>

<a href="ex02-logout.jsp"><button>로그아웃</button></a>
</body>
</html>