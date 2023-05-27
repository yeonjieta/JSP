<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex04.jsp</title>
</head>
<body>


<h1>form태그를 이용한 파라미터 전달</h1>
<hr>
<%--
			form 태그는 사용자 입력값을 포함한 새로운 요청을 만들어서 서버에 전송하는 태그이다.
			form 태그는 다음 속성을 사용할 수 있다.
			
					action: 요청을 받을 서버의 주소
								생략하면 현재 주소에서 요청을 받는다.
								-- 사용자가 보내면 누가 받을건가
								
					method: 요청 방식(GET, POST, HEAD, PUT(전체수정,대체), PATCH(일부(ex) 비밀번호만)만 수정하고 싶을때), DELETE...)
								 단, form 태그는  GET, POST, HEAD 만 사용 가능하다.
								 생략하면 GET이 지정된다.
								 -- put, patch는 update에 해당
								 
								 GET : 클라이언트의 입장에서 data를 받기 위해 사용하는 메서드
								 		  어떤 내용을 받을지에 대해 마라미터를 쿼리스트링 형태로 전달할 수 있다.
								 		  따라서, 파라미터는 주소창을 통해서 전달한다.
								 		  -- 내가 받기위해 요청하는것( ex) 아이유 그림을 보고싶어요(간단함) )
								 		  -- 가장 일반적
								 		  
								 POST : 클라이언트가 입력하는 date를 서버(혹은 DB)에 만들기 위한 메서드
								 			입력받은 내용은 주소창을 통하여 전달하지 않는다. 
								 			HTTP 요청 패킷의 body에 form-data 형식으로 포함되어 전달된다.
								 		  -- 서류봉투(일정한 양식이 있는), 
								 		  주소창으로 전달하지 않는 이유 : 1)데이터 양이 너무 많을 수 있다. 2) 보안에 민감함 정보를 포함 
								 		  편지를 봉투에 담고 밀봉하면 누가 받는 구나는 알지만 안에 내용은 모름 - 이상태로 주는게 post
								 		  내가 열심히 작성한걸 보내는게 목적 ( 여러 데이터를 보낼 수 있음, 파라미터가 넘어가지만 주소창에 안보임)
 --%>

<form>  <!--  파라미터를 포함한 새로운 요청을 만드는 태그, 아무것도 안적으면 현재 페이지 -->
	<p><input type="text" name="name" placeholder="이름입력"></p>
	<p><input type="number" name="age" placeholder="나이입력"></p>
	<p><input type="submit"></p>
</form>

<fieldset>
	<legend>naver로 연결되는 form</legend>
	<form action ="https://search.naver.com/search.naver">  <!-- 네이버에 던져주면 알아서 처리하고 던져줌 -->
		<input type="text" name="query" placeholder="네이버 검색어 입력">
		<input type="submit" value ="검색">
	</form>
</fieldset>

<fieldset>
	<legend>현재 서버의  ex03.jsp로 연결되는 form</legend>
	<form action ="ex03.jsp">  <!--ex03에 던져주면 알아서 처리하고 던져줌 -->
		<input type="text" name="name" placeholder="이름입력">
		<input type="submit" value ="제출">
	</form>
</fieldset>


<%
	String name = request.getParameter("name");
	String age = request.getParameter("age");  // html name 값과 맞춰야함
			// value
	String msg;
		// 입력이안된상태                         // 입력안하고 엔터
	if(name==null || age == null || "".equals(name) || "".equals(age)){
		msg = "안녕하세요";
	}
	else{
		msg = String.format("%s님 (%s살) 안녕하세요", name, age);
	}
	%>
	<h3><%=msg  %></h3>
</body>
</html>


