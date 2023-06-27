<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

<c:if test="${pageContext.request.method == 'GET' }">
		<h3>추가</h3>
		<form method = 'POST' enctype="multipart/form-data">
			<p><input type="file" name="pic" required></p>		
			<p><textarea name="content" placeholder="내용입력" required></textarea></p>		
			<p><input type="submit"></p>		
		</form>
</c:if>

<c:if test="${pageContext.request.method == 'POST' }">
<!-- 그림에서 주황색 선의 DTO 와 row를 가르킨다.  -->
		<c:set var="dto" value="${util.getDiaryDTO(pageContext.request) }" />
		<c:set var="row" value="${dao.insert(dto) }" />
		
<!-- 		client에게 보여줄거 -->
		<h3>${row != 0  ? '추가성공' : '추가실패' }</h3>
		<a href="${cpath }/list.jsp"><button>목록으로</button></a>
</c:if>

</body>
</html>