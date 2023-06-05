<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="sales.*, java.util.*" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%request.setCharacterEncoding("UTF-8"); %>
    <c:set var="cpath" value="${pageContext.request.contextPath }" />
    <c:set var="dao" value="<%=new SalesDAO() %>"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SALES</title>

<a href="${cpath }/add.jsp"><button>추가</button></a>
</head>
<body>

