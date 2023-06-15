<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<c:set var="dto" value="${dao.selectOne(param.idx) }" />

<h3>정보 조회</h3>

<ul>
		<li>이름 : ${dto.name }</li>
		<li>전화번호 : ${dto.pnumber }</li>
</ul>

<p>
<a href="${cpath }/modify.jsp?idx=${dto.idx }">수정</a>
<a href="${cpath }/delete.jsp?idx=${dto.idx }">삭제</a>
</p>
</body>
</html>