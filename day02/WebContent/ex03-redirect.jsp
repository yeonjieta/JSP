<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%
	request.setCharacterEncoding("UTF-8");

	if(request.getMethod().equals("POST") == false) {
		response.sendRedirect("ex03.jsp");
	}
	// HTTP 요청의 메서드가 POST 방식이 아닌 경우에는 ex03.jsp 페이지로 redirect 합니다. 
	// 즉, POST 방식으로만 요청이 가능하도록 제한하는 역할
	else{
	String url = request.getParameter("url");
	response.sendRedirect(url);
	}
	//POST 방식으로 넘어온 데이터의 url 파라미터 값을 가져와서 해당 URL로 redirect 
	// 다른 주소로 이동 하라고 시키는게 redirect
	// redirect 요청을 두번 

	// 클라이언트(브라우저)에게 주소를 전달한다.
	// 클라이언트는 응답을 받은 후 새로운 요청을 작성하여 url대상에게 요청을 보낸다.
	// POST 방식으로 데이터를 전달하면 해당 URL로 redirect 되고, 그렇지 않은 경우에는 ex03.jsp 페이지로 redirect
%>

</body>
</html>