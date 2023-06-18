<%@page import="java.util.List"%>
<%@page import="ex02.FileUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02.jsp</title>
<style>
		#root{
				display: flex;
				flex-flow : wrap;
		}
		.item {
				height: 300px;
				margin : 10px;
		}
</style>
</head>
<body>

<h1>파일 업로드 기능을 처리하는 클래스 작성하기</h1>
<hr>

<form method="POST" action="ex02-action.jsp" enctype="multipart/form-data">
		<p><input type="file" name="uploadfile" accept="image/*" required></p>
		<p><input type="submit"></p>
</form>
<%
// 		FileUtil util = new FileUtil();
// 		List<String> list = util.getFileList();
%>
<%-- <jsp:useBean id="util" class="ex02.FileUtil" /> 싱글톤을 만들었기 때문에 사용못함 --%>
<c:set var="util" value="${FileUtil.getInstance(pageContext.request) }" />
<!-- el 태그로 내장객체에 접근할 때 pageContext(징검다리 역할) 사용해야함 -->
<c:set var="list" value="${util.getFileList() }" />

<div id="root">

	<c:forEach var="fileName" items="${list }">
		<div>
				<img src="${cpath }/image/${fileName }" width="300">
		</div>
	</c:forEach>

</div>


</body>
</html>