<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex07-process.jsp</title>
</head>
<body>



<%
	String n1 = request.getParameter("n1");
	String n2 = request.getParameter("n2");
	
	int num1 = Integer.parseInt(n1);
	int num2 = Integer.parseInt(n2);
	int answer = num1 + num2;
	
	String msg = String.format("%d + %d = %d", num1, num2, answer);
				// (session객체에 저장될 때 사용될 이름, 실제로 저장될 값)
	session.setAttribute("msg", msg);
// session을 쓴 이유는?

// HTTP는 stateless(클라이언트와 서버 관계에서 서버가 클라이언트의 상태를 보존하지 않음)한 
// 프로토콜이기 때문에, 즉 서버는 클라이언트를 구분하지 않고 일반적인 요청-응답 방식으로 처리한다.
// 이 때문에 클라이언트의 이전 상태를 서버에서 유지할 필요가 있을 때가 있다. 
// 이를 위해 서블릿에서는 세션 객체를 제공
// session은 client별로 생성, 해당 client와 연결된 브라우저가 종료될 때까지 유지
// 서버는 session id를 생성하여 client에게 cookie로 전달, client는 이후 요청에서 세션 id를 함께 // 전달, 이를 통해 server는 client를 구분하고, 해당 client의 이전 상태를 유지 가능
// 계산 결과를 세션 객체에 저장하여, 다른 페이지에서도 이전 계산 결과를 사용할 수 있도록 하기 위해 // session을 사용
// 다른 내장객체도 비슷한 역할을 하지만 , session이 클라이언트의 이전 상태를 유지하는데 특화돼있음
%>

<a href="ex07-result.jsp"> 결과 확인</a>

</body>
</html>