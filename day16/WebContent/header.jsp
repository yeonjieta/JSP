<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="diary.* " %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<c:set var="dao" value="${DiaryDAO.getInstance() }" />
<c:set var="util" value="${FileUtil.getInstance(pageContext.request) }" /> 
<!-- FileUtil의 정의하는 모양이랑 호출하는 모양이랑 같아야함, el태그라서 request가 바로 참조가 안되기 때문에 pageContext로 받아준다. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		body {
				background-color:#9DC6D8;
		}
		#root{
				display: block;
				text-align : center;
				flex-flow : wrap;
				
		}
		.item {
				padding-top:20px;
				width : 350px;
				height: 400px;
				margin : auto;
				border: 5px solid pink;
				color : #383735;
				background-color : white;
				font-size : 12px;
				
		}
		.item > .date {
				padding-bottom : 2px;
				font-weight : bold;
				font-size : 13px;
		}
		.item > .image {
				padding-bottom : 5px;
				}
		.item > .content {
				padding-bottom : 5px;
				font-weight : bold;
				font-size : 13px;
				}
		.item > .ip {
				padding-bottom : 10px;
				}		
		.item > .delete {
				padding-bottom : 5px;
				}		

		.image > img {
				height : 250px;
		}
		nav {
			border: 1px solid #9DC6D8;
			color : white;
			background-color: pink;
			margin-bottom:20px;
		}
		nav > h3 {
			
			text-align : center;
		}
		nav > ul {
			display : flex;
			list-style : none;
		}
	
		button {
		background-color: pink;
		color : white;
		border : 1px solid pink;
		font-weight: bold;
		font-size : large;
		margin:auto;
		}
		
		textarea {
			resize: none;   
/* 			resize : none - 사이즈 왔다갔다하는거 없앰 */
			padding: 10px;
			width: 360px;
			height: 200px;
		}
		
</style>
</head>
<body>


<nav>
<h3>🍒모두가 함께 쓰는 DIARY🍒</h3>
		<ul>
				<li><a href="${cpath }/list.jsp"><button>목록</button></a></li>
				<li><a href="${cpath }/add.jsp"><button>추가</button></a></li>
		</ul>
</nav>
