<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex04-form.jsp</title>
</head>
<body>

<h1>ex04-form.jsp(입력)</h1>
<hr>
<!-- ex04-process.jsp 페이지로 전송 -->
<form action="ex04-process.jsp" method="POST">
	<p><input type="number" name="radius" placeholder="반지름" step = "0.1"></p>
<!-- 	radius라는 이름을 부여. 이는 ex04-process.jsp 페이지에서 입력값을 받을 때 사용 -->
	<p><button>입력</button></p>
	<!-- form 태그 내부의 button 태그는 input type="submit"을 대신할 수 있다. -->
	</form>
	<!-- 바깥에 있으면 역할 못함 꼭 안에 있을 때만 -->
	
<!-- 	// 순수하게 자바는 없는 html만 있는 form -->

</body>
</html>