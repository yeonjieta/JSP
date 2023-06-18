<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="login.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03-form</title>
</head>
<body>

<%request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class="login.LoginDTO" />
<jsp:setProperty property="*" name="user" />

<c:set var="dao" value="${LoginDAO.getInstance() }" />
<c:set var="login" value="${dao.login(user) }" scope="session" />
<!-- session.setAttribute("login", login); -->


<c:redirect url="ex03-main.jsp" />


</body>
</html>