<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03-forward.jsp</title>
</head>
<body>

<%
		request.setCharacterEncoding("UTF-8");

		String jspName = request.getParameter("jspName");
		// 클라이언트로부터 전달된 HTTP 요청에서 "jspName" 파라미터 값을 읽어옵니다.
		
		request.setAttribute("test", "단비 쮸쮸바 먹고싶으니까 엄마가 이리와");
		//"test"라는 이름의 속성에 "단비 쮸쮸바 먹고싶으니까 엄마가 이리와" 문자열 값을 저장
		
		RequestDispatcher rd;
		rd = request.getRequestDispatcher(jspName); //jspName으로 전달된 JSP 페이지로 포워드
		rd.forward(request, response); // 포워드된 JSP 페이지에서는 "test"라는 이름으로 저장된 속성 값을 출력할 수 있습니다.
		//               받은 요청   보낸응답  
		
		// 대상페이지가 request와 response를 그대로 전달받는다.
%>

</body>
</html>