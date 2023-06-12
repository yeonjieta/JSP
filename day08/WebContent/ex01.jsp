<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ex01.*"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01.jsp</title>
</head>
<body>

<h1>singleton</h1>
<hr>

<h3>서로 다른 페이지에서 동일한 객체를 참조해도 상관없는 경우, 단일 객체 생성으로 제한시키기</h3>

<fieldset>
		<%
			Test1 ob1 = new Test1();
		%>
		<c:set var="ob2" value="<%=new Test1()%>" />
		<jsp:useBean id="ob3" class="ex01.Test1" />
		
		<ul>
				<li>ob1 : <%=ob1 %></li>
				<li>ob2 : ${ob2 }</li>
				<li>ob3 : ${ob3 }</li>
		</ul>
		
<!-- 		용량도 많이 차지하고, 과정도 늘어나고, 처리시간도 길어지고 굳이 이렇게 쓰지 않고
			셋 다 새로고침할 때 마다 바뀜  -->
</fieldset>
<br>

<fieldset>
		<%  
				// Test2 ob4 = new Test(2); // 외부생성자 호출 불가능
				Test2 ob4 = Test2.getInstance();
				// 대문자.'(Test2.) 은 class로 인식(class 제외하고 어떤것도 첫글자 대문자 안됨)
		%>
		<c:set var="ob5" value="${Test2.getInstance() }" />
		
		<ul>
				<li>ob4 : <%=ob4 %></li>
				<li>ob5 : ${ob5 }</li>
		</ul>
</fieldset>

<%@include file="ex01-directive.jsp" %>

<jsp:include page="ex01-actionTag.jsp" />

<%-- 컴파일 전후 상관없이 같은 객체를 참조, 만들어놓고 계속 참조 
           기능을 수행하는 객체는 하나만 있어도 된다.(예를들어 인형뽑기 팔) --%>

