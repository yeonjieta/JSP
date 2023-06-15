<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

<jsp:useBean id="dto" class="phonebook.PhonebookDTO" />
<jsp:setProperty property="*" name="dto" />

<c:set var="row" value="${dao.modify(dto) }" />

<c:if test="${row!= 0 }">
		<h3>수정 성공</h3>
		<a href="${cpath }/list.jsp"><button>목록으로</button></a>
</c:if>
<c:if test="${row == 0}">
		<h3>수정 실패</h3>
		<a href="${cpath }/modify.jsp"><button>다시 수정</button></a>
</c:if>

</body>
</html>