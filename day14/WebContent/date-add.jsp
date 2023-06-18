<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "date-header.jsp" %>


<form method="POST" action=".jsp">
		<p><input type="text" name="title" placeholder="제목"></p>
		<p><input type="date" name="edate"></p>
		<p><input type="date" name="sdate"></p>
		<p><input type="submit"></p>
</form>



<c:if test="${pageContext.request.method == 'POST' }">
	<jsp:useBean id="dto" class="date.DateDTO" />
	<jsp:setProperty property="title" name="dto"/>
	<jsp:setProperty property="sdate" name="dto" value="${DateUtil.toSqlDate(param.sdate }"/>
	<jsp:setProperty property="edate" name="dto" value="${DateUtil.toSqlDate(param.edate }"/>
	<c:set var="row" value="${dao.insert(dto) }" />
	<h3>추가 ${row != 0 ? '성공' : '실패' }</h3>
	<a href="${cpath }/date-list.jsp"><button>목록으로</button></a>
</c:if>


</body>
</html>