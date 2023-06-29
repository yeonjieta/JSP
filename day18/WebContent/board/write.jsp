<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>
<main>
<h3>새 글 작성</h3>
<c:if test="${empty login }">
		<c:redirect url="/member/login.jsp" />
<!-- 		login 안돼있음 새글작성으로 진입 못하게 하기  -->
</c:if>


<form method="POST" enctype="multipart/form-data">
		<p>
			<input type="text" name="writerName" value="${login.userid }" readonly>
			<input type="hidden" name="writer" value="${login.idx }">
		</p>
		<p><input type="text" name="title" placeholder="제목"  autofocus></p>
		<p>
				<textarea name="content" placeholder="내용을 작성하세요"></textarea>
		</p>
		<p><input type="file" name="upload"></p>
		<p><input type="submit" value="작성완료"></p>
</form>

<c:if test="${pageContext.request.method == 'POST' }">
		<c:set var="fileUtil" value="${FileUtil.getInstance() }" /> 
<%-- 		<c:set var="userAgent" value="${header['user-agent'] }"/> --%>
		
<%-- 		<jsp:useBean id="dto" class="board.BoardDTO" /> --%>
<%-- 		<jsp:setProperty property="*" name="dto" /> --%>
<%-- 		<jsp:setProperty property="ipaddr" name="dto" value="${pageContext.request.remoteAddr }"/> --%>
<%-- 		<jsp:setProperty property="userAgent" name="dto" value="${userAgent }"/> --%>
		
		<c:set var="dto" value="${fileUtil.getDTO(pageContext.request) }" />
		
		<c:set var="row" value="${boardDAO.insert(dto) }" />
		<c:redirect url="/board/list.jsp" />
</c:if>
</main>
</body>
</html>