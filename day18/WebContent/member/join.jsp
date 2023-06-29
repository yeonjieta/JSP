<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>

<main>
<!-- 		페이지가 처음로드 됐을 때  -->
		<h3>회원가입</h3>
		<c:if test="${pageContext.request.method == 'GET' }">
		<form method="POST">
				<p><input type="text" name="userid" placeholder="ID"></p>
				<p><input type="password" name="userpw" placeholder="Password"></p>
				<p><input type="text" name="username" placeholder="사용자이름"></p>
				<p><input type="email" name="email" placeholder="이메일"></p>
				<p><input type="submit" name="제출"></p>
		</form>
		</c:if>
		
		<c:if test="${pageContext.request.method ==  'POST' }">
				<jsp:useBean id="dto" class="member.MemberDTO"/>
				<jsp:setProperty property="*" name="dto" />
				<c:set var="row" value="${memberDAO.insert(dto) }" />
				<h3>${row != 0 ? '가입성공' : '가입실패' }</h3>
				<a href="${cpath }/member/login.jsp"><button>로그인페이지로</button></a>
		</c:if>
</main>

</body>
</html>