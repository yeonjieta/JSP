<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>POST 형태로 전송</h1>
<hr>
<h3>request method는 내장 객체 request에서 확인 가능</h3>

<% 
	// 요청에 담긴 파라미터가 한글 및 특수문자를 포함한다면 인코딩 규칙을 재설정해야 한다. 아니면 깨짐, 먼저 해야한다 꼭.
	request.setCharacterEncoding("UTF-8");

	String userid = request.getParameter("userid");
	String userpw = request.getParameter("userpw");
	
	String method = request.getMethod();
	// 현재 요청이 GET인지 POST인지를 판별하여 method 변수에 저장
	//스크립틀릿을 나누어서 적어도 하나의 자바코드로 식별한다!!
	
	
%>
<h3>request.getMethod() : <%=method %></h3>


<!-- 메서드가 get이고 자바문이 성립하면 html을 실행 -->
<% if(method.equals("GET")) { %>
<!--HTTP 요청 메서드가 GET 방식인지를 확인-->
			<form method="POST">
<!--GET 방식으로 요청이 들어온 경우에는, HTML <form> 태그의 method 속성 값을 "POST"로 설정하여, 로그인 정보를 POST 방식으로 서버로 전송하는 폼을 생성-->
			 	 <p><input type="text" name ="userid" placeholder="ID"></p>
				 <p><input type="text" name ="userpw" placeholder="Password"></p>
				 <p><input type="submit" value="로그인"></p>
			</form>
<% }  %>
// GET 방식으로 요청이 들어오면 로그인 폼을 보여주고, 로그인 버튼을 누르면 POST 방식으로 서버로 전송

// 로그인 정보를 출력하고 다른 페이지로 이동하는 링크
<% if(method.equals("POST")) { %>
			<h3>userid : <%=userid  %></h3>
			<h3>userpw : <%=userpw  %></h3>
			<a href="ex05.jsp"><button>ex05.jsp</button></a>
<% } %>

//로그인 정보를 전송할 때는 POST 방식이 일반적으로 사용되지만, 
// 로그인 폼을 보여줄 때는 GET 방식을 사용하는 것이 일반적



</body>
</html>