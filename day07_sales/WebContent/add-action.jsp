<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<jsp:useBean id="dto" class="sales.SalesDTO" />
<jsp:setProperty property="*" name="dto" />

<c:set var="row" value="${dao.insert(dto) }" />
<c:if test="${row !=0 }">
	<a href="${cpath }/list.jsp">리스트가기</a>
</c:if>
<c:if test="${row == 0 }">
	<a href="${cpath }/add.jsp"><button>다시추가</button></a>
</c:if>



</body>
</html>