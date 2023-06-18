<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.*"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="dao" value="${MemberDAO.getInstance() }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02-form.jsp</title>
</head>
<body>
<c:if test="${not empty login }">
		<c:redirect url="/ex02-main.jsp" />
</c:if>

<h1>로그인 폼</h1>
<hr>

<form method="POST" action="ex02-action.jsp">
		<p><input type="text" name="userid" placeholder="ID" autocomplete="off"></p>
		<p><input type="password" name="userpw" placeholder="Password"></p>
		<p>
				<label>
						<input type="checkbox" name="autologin">
						자동로그인
				</label>
		</p>
		<p><input type="submit" value="로그인"></p>
</form>

<h3>db: ${dao.test() }</h3>
</body>
</html>