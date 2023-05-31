<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex04.jsp</title>
</head>
<body>

<h1>EL Tag 연산자</h1>
<hr>

<h3>산술연산 : +, -, *, /, %</h3>
<h3>비교연산 : >, <, >=, <=, ==, !=, gt, lt, ge, le, eq, ne</h3>
<h3>논리연산 : and, or, not</h3>
<h3>null 체크 : empty, not empty</h3>
<!-- list는 있지만 내용이 비어있으니 empty로 취급, 결과는 true나 false로 출력 -->
<h3>삼항연산 : A? B : C</h3>
<!-- el태그만으로는 if문을 쓰지 못한다. 하지만 삼항연산자는 가능 -->

<%
	String s1 = "12";
	String s2 = "23";
	pageContext.setAttribute("s1", s1);
	pageContext.setAttribute("s2", s2);
	System.out.println("s1 + s2 : " + (s1 + s2));
	
	String s3 = "";
// 	el태그는 attribute 참조가 필수이기 때문에 attribute에 안넣어주면 항상 empty가 뜬다.
%>
<h3>s1 + s2 : ${s1 + s2 }</h3>
<!-- el태그는 +는 무조건 숫자로 취급, 문자열 붙여쓰는거처럼 쓰고싶으면 그냥 옆에 붙여쓰면된다. -->
<h3>\${s1 != s2 } : ${s1 != s2 }</h3>
<h3>\${s1 ne s2 } : ${s1 ne s2 }</h3>
<h3>${s1 mod 2 eq 0 ? '짝수' : '홀수' }</h3>
<h3>${s1 % 2 == 0 ? '짝수' : '홀수' }</h3>
<!-- 문자열로 묶어주고 싶으면 홑따옴표 -->
<hr>
<h3>\${empty s3 } : ${empty s3 }</h3>
<h3>\${empty s4 } : ${empty s4 }</h3>
<br>
<h3>s3 == null : <%=s3 == null %></h3>
<h3>s4 == null : s4변수가 없어서 참조 불가</h3>

</body>
</html>