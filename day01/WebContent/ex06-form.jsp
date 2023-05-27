<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex06-form, 로그인화면</title>
</head>
<body>

<form method="POST" action="ex06-result.jsp">
	<p><input type="text" name="userid" placeholder="ID" requiered autofocus></p>
	<p><input type="password" name="userpw" placeholder="PW" requiered></p>
	<p><input type="submit" value="로그인"></p>
</form>

</body>
</html>