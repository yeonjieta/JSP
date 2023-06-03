<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> ex05.jsp</title>
</head>
<body>

<h1>parameter에 따라 다르게 출력하기</h1>


<!-- age가 없으면 폼을 만들어주고  -->
<c:if test="${empty param.age }">
		<form>
				<input type="number" name="age">
				<input type="submit">
		</form>
</c:if>

<c:if test="${not empty param.age }">
		<c:if test="${param.age >= 20 }">
				<h3>${param.age } : 성인</h3>
		</c:if>
		<c:if test="${param.age < 20 }">
				<h3>${param.age } : 미성년자</h3>
		</c:if> 
		<a href="ex05.jsp"><button>다시입력</button></a>
		<!-- 파라미터가 있기만 하면 출력, 조건 상관없이 -->
		
</c:if>

</body>
</html>