<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>

<main>


<h3>로그인</h3>
<c:if test="${pageContext.request.method == 'GET' }">
		<form method == 'POST'>
				<p><input type="text" name="userid" placeholder="ID를 입력하세요" value="${cookie.userid.value }"
										required autofocus></p>
				<p><input type="password" name="userpw" placeholder="PW를 입력하세요" required></p>
				<p><label><input type="checkbox" name="storId" 
								${not empty cookie.userid ? 'checked' : ' ' }>ID 저장👌</label></p>
				<p><input type="submit" value="로그인"></p>
		</form>
		<div>
				<a href="${cpath }/member/join.jsp">아직 회원이 아니십니까?😊</a>
		</div>
</c:if>

<c:if test="${pageContext.request.method == 'POST' }">
	<jsp:useBean id="user" class="member.MemberDTO"/>
	<jsp:setProperty property="*" name="user" />
	<c:set var="login" value="${memberDAO.login(user) }" />

<%
		boolean flag1 = session.getAttribute("login") != null;
		// session에 login 속성이 존재하는지? ( 로그인 돼있는지? )
		boolean flag2 = request.getParameter("storId") != null;
		// checkbox가 선택되어있는지
		Cookie c = new Cookie("userid", user.getUserid());
		c.setMaxAge(flag1 && flag2 ? 60 * 60 * 24 * 7 : 0);
		// 둘 다 true면 1주일동안 지속, 아니면 0초동안 지속
		response.addCookie(c);
%>

<c:redirect url="/" />  
<!-- 기본 경로 설정 -->
</c:if>
</main>

</body>
</html>