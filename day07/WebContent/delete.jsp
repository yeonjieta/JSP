<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- parameter 전달해야하니 param. 써주기  -->

<c:set var="row" value="${dao.delete(param.idx) }" />
<h3>${row != 0 ? '삭제 성공' : '삭제 실패' }</h3>
<a href="${cpath }/list.jsp">목록으로</a>

</body>
</html>