<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import = "ex02.TestDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- <!-- 스크립틀릿, 표현식이 아예 안들어감 -->
<jsp:useBean id = "dto" class = "ex02.TestDAO"/>
<!-- useBean은 attribute에 저장이된다, el태그 바로 참조 가능 -->
<h3>version : ${dao.getVersion() }</h3>


</body>
</html>