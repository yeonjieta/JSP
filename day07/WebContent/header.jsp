<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="schedule.*, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="cpath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="dao" value="<%=new ScheduleDAO() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day07</title>
<h3>스케줄</h3>

<a href="${cpath }/add.jsp"><button>추가</button></a>
</head>
<body>

