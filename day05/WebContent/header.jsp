<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="student.*, java.util. *" %>
<!-- header에 걸어주면 모든 페이지에 적용되니 header에 java.util.* 걸어주기 -->
<!-- import="student.* : 패키지명인 "student"를 기준으로 해당 패키지에 속한 모든 클래스들을 import한다는 의미 -->
<!DOCTYPE html>

<html lang = "ko">
<!-- 한국어 번역 하라고 더이상 안뜸 -->

<head>
<meta charset="UTF-8">
<%
		request.setCharacterEncoding("UTF-8");

		StudentDAO dao = new StudentDAO();
		// DAO 클래스는 데이터베이스에 접근하는 메서드를 제공하고, 
		// JSP 페이지에서는 DAO 객체를 생성하여 해당 메서드를 호출하여 데이터베이스와 상호작용
		// StudentDAO 클래스의 인스턴스를 생성해서 JSP페이지에서 'dao'객체를 사용하여
		// 데이터베이스와의 견결 및 데이터 액세스를 처리할 수 있다.
		// 예를 들어, dao 객체를 사용하여 학생 정보를 조회하거나 삽입하는 등 db작업 수행 가능
		// header page에 dao 객체를 생성한이유 : jsp페이지와 연결된 모든 페이지에서 dao 객체를 사용가능
		String cpath = request.getContextPath();
		//  현재 웹 애플리케이션의 컨텍스트 경로를 가져와서 cpath 변수에 저장하는 역할
		// 이후 cpath 변수를 사용하여 경로 지정에 유연성을 제공할 수 있다
		//현재 HTTP 요청의 컨텍스트 경로를 가져와서 "cpath" 변수에 저장
		// ContextPath : 웹 애플리케이션이 "http://example.com/myapp"에 배포되었다고 가정해보면 
		// 여기서 "http://example.com"는 웹 애플리케이션의 도메인 이름이고, "/myapp"이 컨텍스트 경로
%>


<title>day05</title>
<!-- 상단 공통 부분 만들기 -->
<style>
		a {
				text-decoration: none;
				color : inherit;
		}
		a:hover {
				text-decoration: underline;
		}
		h1 {
				text-align: center;
		}
		nav > ul {
				display: flex;
				justify-content : center;
				
				
				list-style: none;
				width: 800px;
				margin : 0 auto;
				padding: 0;
		}
		nav > ul > li {
				flex : 1;
				text-align : center;
		}

</style>
</head>
<body>

<header>
		<h1><a href="<%=request.getContextPath() %>">day05</a></h1>
</header>

<nav>
		<ul>
				<li><a href="<%=request.getContextPath() %>/list.jsp">목록</a></li>
<!-- 				request.getContextPath()를 사용하여 경로를 지정하지 않으면 웹 애플리케이션의 컨텍스트 경로가 포함되지 않게된다.  -->
<!-- 				따라서 경로가 올바르게 생성되지 않아 목록 페이지인 list.jsp로 이동할 수 없다. -->
				<li><a href="<%=request.getContextPath() %>/add.jsp">추가</a></li>
		</ul>
</nav>

<hr>



