<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.*, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%request.setCharacterEncoding("UTF-8"); %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<c:set var="dao" value="${MemberDAO.getInstance() }" />
<!DOCTYPE html >
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>day09_member</title>
</head>
<body>


<header>
		<h1><a href="${cpath }">day08_memeber</a></h1>
		<div>DB : ${dao.test() }</div>
		<nav>
				<ul>
						<li><a href="${cpath }/list.jsp">전체목록</a></li>
						<li><a href="${cpath }/add.jsp">추가(가입)</a></li>
				</ul>
		</nav>
</header>

<!-- db 연결 확인부터 하자 -->

