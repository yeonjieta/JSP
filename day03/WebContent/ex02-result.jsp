<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<h1>결과</h1>
<hr>
<h3>이름 : ${param.name }</h3>
<h3>나이 : ${param.age }</h3>


<fieldset>
		<legend>파라미터가 없을 경우</legend>
		<h3>표현식 : <%=request.getParameter("name") %></h3>
		<h3>El Tag : ${param.name }</h3>
		<!--  El Tag : 값이 null이면 출력을 안함 -->
</fieldset>
</body>
</html>