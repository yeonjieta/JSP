<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id = "dto" class = "schedule.ScheduleDTO" />
<jsp:setProperty property = "*" name = "dto" />


<c:set var="row" value="${dao.insert(dto) }" />

<c:if test="${row != 0 }">
	<a href="${cpath }/list.jsp">리스트 가기</a>
</c:if>

<c:if test="${row == 0 }">
	<h3>추가되지않았습니다.</h3>
	<a href="${cpath }/add.jsp"><button>다시 추가하기</button></a>
</c:if>

</body>
</html>