<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>
<main>
<h3>게시글 수정</h3>

<c:if test="${empty login }">
		<c:redirect url="/member/login.jsp" />
<!-- 		login 안돼있음 새글작성으로 진입 못하게 하기  -->
</c:if>

<%-- write랑 
<c:set var="dto" value="${boardDAO.selectOne(param.idx) }" /> 추가, 
<p><input type="text" name="title" placeholder="제목" value="${dto.title }" autofocus></p> value 변경, 	
<p><input type="submit" value="수정완료"></p>, 
<c:set var="row" value="${boardDAO.update(dto) }" /> --%>

<c:set var="dto" value="${boardDAO.selectOne(param.idx) }" />
<form method="POST" enctype="multipart/form-data">
		<p>
			<input type="text" name="writerName" value="${login.userid }" readonly>
			<input type="hidden" name="writer" value="${login.idx }">  
<!-- 			사용자에대한 idx는 들어가있지만 작성자에 대한 dto.idx가 안들어가 있어서 추가 해줘야함 -->
		</p>
		<p><input type="text" name="title" placeholder="제목" value="${dto.title }" autofocus></p>
		<p><input type="hidden" name="idx" value="${dto.idx }" />
		<p>
				<textarea name="content" placeholder="내용을 작성하세요">${dto.content }</textarea>
		</p>
		<p><input type="file" name="upload"><br>
				<sub>현재 첨부 파일 : ${not empty dto.fileName ? dto.fileName: '없음' }
				<input type="hidden" name="delete" value="%{dto.fileName }" >
				<label><input type="checkbox" name="deleteFile">첨부파일 삭제</label>
				</sub>
		</p>
		<p><input type="submit" value="수정완료"></p>
</form>


<c:if test="${pageContext.request.method == 'POST' }">
		<c:set var="fileUtil" value="${FileUtil.getInstance() }" /> 
		<c:set var="dto" value="${fileUtil.getDTO(pageContext.request) }" />
		<c:set var="row" value="${boardDAO.update(dto) }" />
		<c:redirect url="/board/view.jsp?idx=${dto.idx }" />
		</c:if>
</main>
</body>
</html>