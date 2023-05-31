<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>El Tag</h1>
<hr>
<ul>
	<li>페이지간의 객체 공유를 위해서 attribute를 사용할 수 있다.</li>
	<li>attribute에 저장하면 Object로 업캐스팅된다.</li>
	<li>객체 다운캐스팅을 위해서는 코드가 길어진다.</li>
	<li>El태그의 기본적인 사용법은 attribute를 출력하는 것이다.</li>
	<li>출력결과는 toString()의 반환값으로 출력된다.</li>
</ul>
<%@ page import="ex01.Human" %>
<%
	Human ob1 = new Human("이지은", 31);
	Human ob2 = new Human("홍진호", 42);
	Human ob3 = new Human("나단비", 5);
	Human ob4 = new Human("이제훈", 40);
	
	pageContext.setAttribute("ob1", ob1);
	// ob1 객체를 pageContext 범위에 저장(현재페이지만 접근 가능)
	request.setAttribute("ob2", ob2);
	// 현재 요청에 대한 모든 페이지에서 접근 가능
	session.setAttribute("ob3", ob3);
	// 특정사용자의 세션 동안 유지
	application.setAttribute("ob4", ob4);
	// 웹 어플리케이션 전체에 접근 가능
%>

<fieldset>
	<h3>
			이름: <%=((Human)pageContext.getAttribute("ob1")).getName() %><br> 
<!-- 			// 다운캐스팅 한걸 한번더 묶어서 .getName() -->
<!-- pageContext범위에서 ob1 객체를 가져와서 다운캐스팅 한 후, getName() 메서드를 호출하여 이름 출력 -->
			나이 : <%=((Human)pageContext.getAttribute("ob1")).getAge() %>
	</h3>
	<h3>
			이름 : ${ob1.name }<br>
			나이 : ${ob1.age }
	</h3>
	<h3>${ob1 }</h3>
<!-- 	Human에 toString 오버라이딩한형태로 나옴 -->
</fieldset>

<fieldset>
	<h3>
		이름 : ${ob2.name }<br>
		나이 : ${ob2.age }
	</h3>
</fieldset>
<br>

<fieldset>
	<h3>
		이름 : ${ob3.name }<br>
		나이 : ${ob3.age }
	</h3>
</fieldset>
<br>

<fieldset>
	<h3>
		이름 : ${ob4.name }<br>
		나이 : ${ob4.age }
	</h3>
</fieldset>
<br>


</body>
</html>