<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="phonebook.*, java.util.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("UTF-8"); %>
<c:set var = "cpath" value="${pageContext.request.contextPath}"/>
<c:set var = "dao" value="${PhonebookDAO.getInstance() }" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>PhoneBoook</title>
</head>
<body>

<header>
		<h1><a href="${cpath }">phonebook</a></h1>
		<div>DB : ${dao.test() }</div>
		
		<nav>
				<ul>
						<li><a href="${cpath }/list.jsp"><button>목록</button></a></li>
						<li><a href="${cpath }/add.jsp"><button>추가</button></a></li>
				</ul>
		</nav>
</header>


