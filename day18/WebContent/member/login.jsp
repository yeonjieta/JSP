<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>

<main>

		<h3>로그인</h3>
		
		<c:if test="${pageContext.request.method == 'GET'}">
		<form method="POST">   
                                                                                         <!--쿠키는 el태그로 불러오면 되니 request.getCookie 안써도됨 -->
				<p><input type="text" name="userid" placeholder="ID"  value="${cookie.userid.value }"
								 required autofocus></p>
				<p><input type="password" name="userpw" placeholder="Password" required></p>
				<p><label><input type="checkbox" name="storeId"
								  ${not empty cookie.userid ? 'checked' : ' ' }>ID 저장❤️</label></p>
								  <!-- 				userid가 쿠키에 있으면 체크박스에 체크해놓은 상태 -->
				<p><input type="submit" value="로그인"></p>  
		</form>
		<div>
				<a href="${cpath }/member/join.jsp">🤕⛏️⛏️아직 회원이 아니십니꺼?⛏️⛏️🤕</a>
		</div>
		</c:if>
		
		<c:if test="${pageContext.request.method == 'POST'}">
				<jsp:useBean id="user" class="member.MemberDTO" />
<!-- 				jsp 페이지에서 사용하기 위해 useBean을 이용하여 user라는 id로 memberDTO 객체를 생성 -->
				<jsp:setProperty property="*" name="user" />
				<c:set var="login" value="${memberDAO.login(user) }" scope="session" />
				
			
					<%	
							boolean flag1 = session.getAttribute("login") != null;
							// 세션에서 login속성이 존재하는지 ? 즉 로그인 돼있는지
							boolean flag2 = request.getParameter("storeId") != null;
							// 체크박스가 선택돼있는지, 
							Cookie c = new Cookie("userid", user.getUserid());
							c.setMaxAge(flag1 && flag2 ? 60 * 60 * 24 * 7 : 0);
							response.addCookie(c);
					%>
			
			<c:redirect url="/" />
		</c:if>
</main>

</body>
</html>