<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="ex02.TestDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>DAO를 이용한 데이터 화면 출력</h1>
	<hr>


	<!-- 스크립틀릿이나 표현식이 아예 안들어감  -->
	<div>
		<jsp:useBean id="dao" class="ex02.TestDAO" />
		<!-- useBean 장점 중 하나 attribute 바로 들어감,  attribute에 저장했으니 el 태그로 바로 참조 가능 -->

		<h3>version : ${dao.getVersion() }</h3>
		<!-- 반환값이 호출 자리를 대신한다 -->
	</div>
	<!-- div는 margin 이나 padding이 없다 -->

	<br>
	<br>


	<!-- 자바코드를 이용해 처리할 수 있다 -->
	<%
		TestDAO dao2 = new TestDAO();
	String version = dao2.getVersion();
	System.out.println(version);
	// 	이미 close로 닫아서(해제해서) 두번 쓸 수 없다. (접속을 해제했습니다.)
	// 한 번 생성하면 한 번만 쓰고 버린다. 더쓰고 싶으면 새로 생성해야해한다.
	%>

	<div>
		<h3>
			version :
			<%=dao2.getVersion()%></h3>
		<!-- 해당객체의 getVersion()을 호출한다 -->
	</div>

	<%
		// 현재페이지에서 dao 사용이 끝났다면 반드시 close() 호출하기, 마지막에 한 번 만 닫아주게끔 설정
	dao2.close();
	%>
</body>
</html>