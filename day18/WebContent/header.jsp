<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.*, board.*, reply.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="memberDAO" value="${MemberDAO.getInstance() }" />
<c:set var="boardDAO" value="${BoardDAO.getInstance() }" />
<c:set var="replyDAO" value="${ReplyDAO.getInstance() }" />
<c:set var="cpath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day18 - board</title>
<link type="text/css" rel="stylesheet" href="${cpath }/css/style.css">
<script src="${cpath }/js/function.js"></script>
</head>
<body>
<header>
		<h1><a href="${cpath }">day18 - board</a></h1>
		<div id="loginInfo">
				<c:if test="${not empty login }">
						<p align="right">${login.userid }(${login.username })</p>
				</c:if>
		</div>
</header>

<nav>
		<ul>
				<c:if test="${empty login }">
						<li><a href="${cpath }/member/login.jsp">😝로그인😊</a></li>
				</c:if>
				<c:if test="${not empty login }">
						<li><a href="${cpath }/member/logout.jsp">로그아웃 bye~🤚</a></li>
				</c:if>
				<li><a href="${cpath }/board/list.jsp">🦀게시판🦀</a></li>
		</ul>
</nav>

