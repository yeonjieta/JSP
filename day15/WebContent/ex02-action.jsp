<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ex02.FileUtil" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02-action.jsp</title>
</head>
<body>
<!-- // request를 생성하고 파일객체를 반환 -->

<%
// 		FileUtil util = new FileUtil();
		FileUtil util = FileUtil.getInstance(request); // 스크립틀릿에선 request로 전달
		File f = util.getUploadFile(request);
		// db엔 파일이 아니라 파일이 저장된 경로를 올리면 됨 
		String fileName = f.getName();
		long length = f.length();
%>
<fieldset>
		<ul>
				<li>fileNmae : <%=fileName %></li>
				<li>fileSize : <%=length %></li>
				<li>content : <img src="image/<%=fileName %>" width="300"></li>
		</ul>
</fieldset>

<p>
		<a href="ex02.jsp"><button>돌아가기</button></a>
</p> 

</body>
</html>