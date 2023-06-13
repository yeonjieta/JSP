<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<jsp:useBean id="dto" class="member.MemberDTO" />
<jsp:setProperty property="*" name="dto" />

<c:set var="row" value="${dao.insert(dto) }" />

<c:if test="${row != 0 }">
	<h3>회원가입 성공</h3>
	<a href = "${cpath }/header.jsp"><button>홈으로</button></a>
</c:if>

<c:if test="${row == 0 }">
	<h3>회원가입실패</h3>
	<a href = "${cpath }/list.jsp"><button>리스트로</button></a>
</c:if>



</body>
</html>