<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "ex01.Test"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex05.jsp</title>
</head>
<body>
	
	<%
	Test test = new Test();
	pageContext.setAttribute("test", test);
	%>
	<h3>${test.value1 }</h3>
<!-- 	getter > field  첫글자가 소문자로 시작하면 객체로 찾는다. -->
	<h3>${Test.getValue2() }</h3>
<%-- 	<h3>${Test.value2 }</h3> --%>
<!-- 	static > filed ( 첫글자가 대문자이면 class로 식별을 한다(static이 붙는다.- 자료형에 고정된형식(사람은 눈이 두개다))) 
		첫글자가 대문자이면 클래스(static)로 찾는다-->

		
</body>
</html>