<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>

<main>

<h3>회원가입</h3>


	<c:if test="${pageContext.request.method == 'GET' }">
		<form method='POST'>
				<p><input type="text" name="userid" placeholder="ID"></p>
				<p><input type="password" name="userpw" placeholder="PW"></p>
				<p><input type="username" name="username" placeholder="NAME"></p>
				<p><input type="email" name="email" placeholder="EMAIL"></p>
				<p><input type="submit" placeholder="제출"></p>
				<p></p>
		</form>
	</c:if>
	
	<c:if test="${pageContext.request.method == 'POST'}">
		<jsp:useBean id="dto" class="member.MemberDTO" />
		<jsp:setProperty property="*" name="dto" />
		<c:set var="row" value="${memberDAO.insert(dto) }" />
		<h3> ${row != 0 } ? '가입 성공' : '가입 실패'</h3>
		<a href="${cpath }/member/login.jsp"><button>GO TO THE LOGIN PAGE</button></a>
 	</c:if>
</main>

</body>
</html>