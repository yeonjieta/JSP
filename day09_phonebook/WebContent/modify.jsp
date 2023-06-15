<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

<c:set var="dto" value="${dao.selectOne(param.idx) }" />

<form action="${cpath }/modify-action.jsp" method = "POST">
		<p><input type="number" name="idx" value = "${dto.idx }" readonly></p>
		<p><input type="text" name="name" value = "${dto.name }" placeholder="이름을 입력하세요" required></p>
		<p><input type="tel" name="pnumber" value = "${dto.pnumber }" required ></p>		
		<p><button>제출</button><p>
</form>

</body>
</html>