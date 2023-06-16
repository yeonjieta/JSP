<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="youtube.*, java.util.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%request.setCharacterEncoding("UTF-8"); %>
<c:set var = "cpath" value = "${pageContext.request.contextPath}" />
<c:set var = "dao" value = "${YoutubeDAO.getInstance() }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>youtube</title>

<header>
		<h1><a href="${cpath }">youtube</a></h1>
		<div>DB : ${dao.test() }</div>
		
		<nav>
				<ul>
						<li><a href="${cpath }/list.jsp"><button>목록</button></a></li>
						<li><a href="${cpath }/add.jsp"><button>추가</button></a></li>
				</ul>
		</nav>
</header>		
		
		
</head>
<body>

