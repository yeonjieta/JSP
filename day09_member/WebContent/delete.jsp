<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

<c:set var="row" value="${dao.delete(param.idx) }" />
<h3>삭제 ${row != 0 ? '성공' : '실패'}</h3>
<a href="${cpath }/list.jsp">목록으로</a>

<c:redirect url="list.jsp" />

</body>
</html>