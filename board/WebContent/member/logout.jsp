<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGOUT</title>
</head>
<body>

<%
	session.invalidate();
	response.sendRedirect(request.getContextPath());
%>

</body>
</html>