<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add.jsp</title>
</head>
<body>

<h1>상품추가</h1>
<hr>
<%
		String path = application.getRealPath("img"); // 그림파일이 담긴 폴더 , "img"라는 경로에 대한 실제 파일 시스템 경로를 반환
// 		System.out.println(path);
		File dir = new File(path);
		String[] list = dir.list();  // 변수이름은 list지만 배열
		
		request.setCharacterEncoding("UTF-8");
%>
<form method="POST">
	<p><input type="text" name="name" placeholder="상품이름"></p>
	<p><input type="number" name="price" placeholder="가격"></p>
	<p>
			<select name="image">
			<% for(String fileName : list) {%>
					<option><%=fileName %></option>
			<% }  %>
			</select>
	</p>
	<p>
			<input type="submit" value="등록"> <!-- 	저장돼있는 파일 이름을 불러옴 -->
			<a href=""><input type="button" value ="목록으로"></a>  <!-- input type을 해야 안에 들어가있어도 submit이 안됨 -->
	</p>  
	
</form>

<%
	if(request.getMethod().equals("POST")){%>
		<jsp:useBean id ="user" class="snack.SnackDTO" />
		<jsp:setProperty property="*" name="user" />
		${list.add(user) }
<!--  el태그에서도 함수 호출 가넝한 -->
<% 
		response.sendRedirect("index.jsp");
		
	
	} %>

</body>
</html>