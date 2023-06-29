<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>

<fieldset class="frame">

		<h3>글 읽기</h3>

		<c:set var="dto" value="${boardDAO.selectOne(param.idx) }" />

		<h4>${dto.title }</h4>
		<h5>
				<span class="writer">${dto.userid }</span> 
				| <fmt:formatDate value="${dto.writeDate}" pattern="yyyy-MM-dd a hh:mm"/>
				| ${dto.ipaddr }
		</h5>
		<c:if test="${not empty dto.fileName}">
				<img src="${cpath }/upload/${dto.fileName}" width="500">
				<video src="${cpath }/upload/${dto.fileName}" controls></video>
		</c:if>
		<pre>${dto.content }</pre>

</fieldset>

<div class="flex">
		<div>
				<a href="${cpath }/board/list.jsp"><button>목록</button></a>
		</div>
		<div>
				<a class="modify confirm" href="${cpath }/board/modify.jsp?idx=${dto.idx}">
						<button>수정</button></a>
				
				<a class="delete confirm" href="${cpath }/board/delete.jsp?idx=${dto.idx}" >
						<button>삭제</button></a>
<!-- 						마무리태그는 뒤에 빠짝 붙이기 -->
		</div>
</div>

<fieldset class="frame">
		<form method = "POST">
				<textarea name="content" placeholder="비속어 사용시 규제 됩니다."></textarea>
				<button>댓글 작성</button>
		</form>
		<c:set var="replyList" value="${replyDAO.select(param.idx) }" />
		
		<c:forEach var="reply" items="${replyList }">
		<div class="reply">
		<div>	${reply.userid }  | ${reply.writeDate } | ${reply.ipaddr } </div>
		<div>${reply.content } </div> 
			
		</div>
		</c:forEach>
		
</fieldset>

<%-- veiw.jsp에서 POST요청시 댓글 작성을 처리하게 만들었음 --%>

<c:if test="${pageContext.request.method == 'POST' }">
		<jsp:useBean id="replyDTO" class="reply.ReplyDTO" />
		<jsp:setProperty property="*" name="replyDTO" />
		<jsp:setProperty property="board" name="replyDTO" value="${param.idx }" />
<%-- 		${replyDTO.idx }   idx 들어있는지 확인해보기 --%>
		<jsp:setProperty property="writer" name="replyDTO" value="${login.idx }" />
		<jsp:setProperty property="ipaddr" name="replyDTO" 
									value="${pageContext.request.remoteAddr }" />
		<jsp:setProperty property="userAgent" name="replyDTO" 
									value="${header['user-agent'] }" />
		<c:set var="row" value="${replyDAO.insert(replyDTO) }" />
		<c:redirect url="/board/view.jsp?idx=${param.idx }"/>  
								
</c:if>

<script>
		const textarea = document.querySelector('textarea[name="content"]')
		const btnList = document.querySelectorAll('a.confirm')
		const login = '%{login.userid}'
		const cpath
// 		function loginCheck(){
// 			const login = '${login.userid}'
// 			if(login == ''){
// 				if(confirm('댓글 작성을 위해 로그인합니다.')){
// 					textarea.blur()		// blur, focus를 잃는 상황
// 					location.href = '${cpath}/member/login.jsp'
// 				}
// 				else {
// 					textarea.disabled = 'disabled'
// 					textarea.placeholder = '로그인 한 사용자만 댓글을 작성할 수 있습니다.'
// 				}
// 			}
// 		}
		textarea.onclick = loginCheck
</script>

<script>
// 		const link = document.querySelector('a.delete')
		// class가 "delete"인 링크 요소(<a>)를 찾아서 link 상수에 할당
		// 게시글 삭제 기능을 수행하는 링크
		const btnList = document.querySelectorAll('a.confirm')
		// 배열을 만들어 confirm clsss를 불러옴, modify confirm 띄워쓰기로 구분됨
		
		const textarea = document.querySelector('textarea[name="content"]')
		const btnList = document.querySelectorAll('a.confirm')
		const login = '${login.userid}'
		const cpath = '${cpath}'
				
		textarea.onfocus = loginCheck
		btnList.forEach(btn => btn.onclick = confirmHandler)
</script>


</body>
</html>