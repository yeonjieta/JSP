<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex04-delete.jsp</title>
</head>
<body>

<%
		Cookie c = new Cookie("username", null);  // 겹치는 값있으면 삭제
		c.setMaxAge(0); // 유효시간 0으로 설정
		response.addCookie(c); // 클라이언트한테 보냄
		response.sendRedirect("ex04.jsp");
		
%>

</body>
</html>