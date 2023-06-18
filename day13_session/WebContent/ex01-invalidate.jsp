<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<%--  page directive에서 session 속성의 값을 false로 설정하면
		현재 페이지에서는 세션을 사용하지 않겠다는 선언이 된다.
		모든 페이지마다 세션을 사용할 필요가 없다면 속성을 false로 설정하여 서버의 부하를 줄이는 방향으로 설정한다.
		안적으면 session의 기본값은 true
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01-invalidate.jsp</title>
</head>
<body>

<%
		// 현재 사용중인 세션을 폐기한다
		// 세션안에 저장된 모든 attirbute도 함께 소멸한다.
		// 다음번 요청에 세션이 필요하다면 새로운 세션을 생성한다.(이 때 세션id가 변경된다.)
		
		out.print("session : " + session.getAttribute("memo") + "<br>");

		session.invalidate();  // session 제거 
		
		session = request.getSession();    			// 요청에서 새로운 세션을 참조하여 가져온다. 괄호안에 아무것도 안넣으면 무조건 새로 만듬 
																	// 이걸 지워도 session 속성 상 form에서 자동으로 작동한다. 
		session = request.getSession(false);		// 만약 세션이 이미 있다면 새로 생성하지 않는다.
		out.print("session.getId() : " + session.getId() + "<br>");
		
		
// 		java.lang.IllegalStateException: getAttribute: 세션이 이미 무효화되었습니다.
// 		out.print("session : " + session.getAttribute("memo") + "<br>");

%>
<a href="ex01-form.jsp"><button>초기화면으로 이동</button></a>

</body>
</html>