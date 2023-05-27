<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03.jsp</title>
</head>
<body>

<h1>parameter</h1>
<hr>

<h3> 사용자가 서버에 요청하면서 추가로 전달하는 값. 대부분 String 타입이다.</h3>
<h3> 브라우저 주소 창내용 맨 뒤에 ?name=이름 형태로 추가로 적어서 입력하세요 - Query String(서버한테 질문하는 문자열)</h3>


<%
	String name = request.getParameter("name");

	if(name != null && name.equals("") == false){
		out.print("<h3>" + name + "님 안녕하세요 !!</h3>");
	}
	else {
		out.print("<h3>반갑습니다.</h3>");
	}
	
	String requestURL = request.getRequestURL().toString();  // 요청의 전체주소를 문자열로 바꾼다.
	String protocol = request.getProtocol();    // 프로토콜의 버전을 나타냄(HTTP/1.1)
	String serverName = request.getServerName();  
	int port = request.getServerPort();
	String contextPath = request.getContextPath();  // 이 주소를 저장하고 따로 쓰게 됨 
	// JSP나 Servlet에서 웹 애플리케이션의 루트 경로를 나타내는 변수
	String requestURI = request.getRequestURI();
	Map<String, String[]> paramMap = request.getParameterMap(); 
		// haspmap 이 아니라 다른 map이라 map으로 받음
		// String[] 타입으로 값이 저장된 이유는, 매개변수에 같은 이름의 값이 여러 개 전달될 수 있기 때문
		//  JSP나 Servlet에서 각 매개변수의 이름을 key로 사용하여 값을 조회
		// ex) String[] idValues = paramMap.get("id"); (id 매개변수의 값이 담긴 배열을 조회)

	System.out.println("URL : " + requestURL);
	System.out.println("protocol : " + protocol);
	System.out.println("serverName : " + serverName);
	System.out.println("port : " + port);
	System.out.println("contextPath : " + contextPath);
	System.out.println("requestURI : " + requestURI);
	
	// paramMap의 모든 키를 String 타입의 key 변수에 할당하여 순회하는 코드
	for(String key : paramMap.keySet()){
		String[] values = paramMap.get(key);
		System.out.println("key :" + key);
		System.out.print("values : " );
		for(int i = 0; i < values.length; i++){
			String value = values[i];
			System.out.print(value);
			// 현재 처리 중인 값이 배열의 마지막 요소인지 확인
			if(i == values.length -1){
				System.out.println();
			}
			else{
				System.out.print(", ");
			}
		}
	}
	System.out.println();
	
	
	
%>
<style>
	div.sample {
		font-size : 20px;
		display : flex;
		}
		
	span.protocol {color : red;}
	span.serverName {color : orange;}
	span.serverPort {color : lime;}
	span.contextPath {color : green;}
	span.resource {color : blue;}
	span.paramName {color : purple;}
	span.paramValue {color : hotpink;}
</style>

<fieldset>
	<div class="sample">
		<span class="protocol">http</span>://
		<span class="serverName">localhost</span>:
		<span class="serverPort">8080</span>/
		<span class="contextPath">day01</span>/
		<span class="resource">ex03.jsp</span>?
		<span class="paramName">name</span>=
		<span class="paramValue">짱구</span>&
		<span class="paramName">age</span>=
		<span class="paramName">5</span>
	</div>
</fieldset>
</body>
</html>