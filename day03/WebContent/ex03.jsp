<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03.jsp</title>
</head>
<body>

<h1>객체 타입 배열 출력하기</h1>
<hr>
<%@ page import="ex01.Human, java.util.*" %>
<%
	Human ob1 = new Human("이지은", 31);
	Human ob2 = new Human("홍진호", 42);
	Human ob3 = new Human("나단비", 5);
	Human ob4 = new Human("이제훈", 40);
	
	Human[] arr = {ob1, ob2, ob3, ob4};
	List<Human> list = Arrays.asList(arr);
	
	request.setAttribute("arr", arr);
	request.setAttribute("list", list);
	
	request.setAttribute("arr", arr);
%>

<!-- el태그 안에선 list, array 둘 다 동일한 방식으로 접근 (원래 list.get(i)) -->

<ul>
	<li> 
		<%=((Human[])request.getAttribute("arr"))[0].getName() %>,
		<%=((Human[])request.getAttribute("arr"))[0].getAge() %>
	</li>
	<li>${arr[1].name }, ${arr[1].age }</li>
	<li>${list[2].name }, ${list[2].age }</li>
	<li>${list[3].name }, ${list[3].age }</li>
</ul>

<!-- 스클립틀릿을 이용한 반복문 -->
<ol>
<%
	for(int i =0; i < arr.length; i++){
		pageContext.setAttribute("i", i);
// 		현재페이지에서만 유효하니까 지역변수 쓰는 느낌, 다른데도 끌어써야하면 request, setApplication
// 		 이 부분 없으면 출력안됨
		%>
		<li>${arr[i] }</li>
		<%
	}
%>
</ol>

<ul>
<%
	for(Human ob: arr){
		pageContext.setAttribute("ob", ob);
		%><li>${ob }</li><%
	}
%>
</ul>
</body>
</html>