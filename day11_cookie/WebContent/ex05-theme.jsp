<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex05-theme.jsp</title>
<c:set var="theme" value="${URLDecoder.decode(cookie.theme.value) }" />
<!-- // 스위치 케이스와 비슷 , 이 안에서 하나만 선택 -->
<c:choose>  
		<c:when test= "${theme == 'Dark Theme' }">
				<c:set var="bgcolor" value="#111" />
				<c:set var="color" value="#ccc" />
		</c:when>
		<c:when test="${theme == 'Pink Theme' }">
				<c:set var="bgcolor" value="#111" />
				<c:set var="color" value="hotpink" />
		</c:when>
		<c:when test="${theme == 'Light Theme' }">
				<c:set var="color" value="black" />
		</c:when>
		
</c:choose>

<style>
		html {
		color: ${color};
		background-color: ${bgcolor}; 
		}
</style>

</head>
<body>

<h1>컬러 테마</h1>
<hr>
<%-- ${theme == 'Light Theme' ? 'selected' : '' } << Light Theme 선택하면 Light Theme 그대로 있음 선택창에 --%>
<form method="POST">
	<p>
		<select name="theme">
				<option ${theme == 'Light Theme' ? 'selected' : '' }>Light Theme</option>
				<option ${theme == 'Dark Theme' ? 'selected' : '' }>Dark Theme</option>
				<option ${theme == 'Pink Theme' ? 'selected' : '' }>Pink Theme</option>
		</select>
		<input type="submit">
	</p>
</form>

<%
		if(request.getMethod().equals("POST")){
			String theme = request.getParameter("theme");
			// <select name="theme">
			theme = URLEncoder.encode(theme,"UTF-8");
			Cookie c = new Cookie("theme", theme);
			// <select name="theme"> 값 유지 위해 쿠키 생성
			c.setMaxAge(60 * 5);
			response.addCookie(c);
			response.sendRedirect("ex05-theme.jsp");
		}
%>

<fieldset style="width: 500px; height: 300px; overflow-y: scroll;">
		<pre>
주인공은 아니었지
누구의 시점에서도
그냥 스쳐 지나가거나
친구3이라거나
이름 없는 역할 뿐
너에게는 알 수 없는
멋진 향기가 났었지
지나칠 수 없는 마음을
대사 한 줄 없지만
말하고 싶었는데
창가에 비친 너의 얼굴은
나만을 위한 등장이었는지
단 한 번의 명장면이
빠르게 지나가고 있었지
소리쳐 이름을 불러 볼까
한 시간쯤은 기억해 줄까
뒤를 돌아봐 주었지만
너의 미소는 내게 와주지 않았지
다음 편이 기대되지 않는
예상 가능한 엔딩만 남은
로맨스도 뭣도 아닌
나의 부동의 첫사랑
좋아하는 마음이란
왜 감출 수가 없는지
나는 바보 같은 말투로
대본에도 없었던
고백을 해버렸지
대답이 없는 너의 표정은
누구를 위한 연출이었는지
웃기라도 해준다면
이상한 애가 돼도 좋은데
소리쳐 이름을 불러 볼까
30분쯤은 기억해 줄까
뒤를 돌아봐 주었지만
너의 미소는 내게 와주지 않았지
다음 편이 기대되지 않는
예상 가능한 엔딩만 남은
로맨스도 뭣도 아닌
나의 부동의 첫사랑
굳이 응원해 준 사람도 없었지만
너를 향한 노래가 생겼어
이젠 웃으며 부를 수 있어
그저 흐릿한 조명처럼
너의 미소를 빛내줄 수만 있다면
예고편이 공개되지 않고
뻔한 엔딩도 맺지 못했지만
나의 마음속 언제나
항상 빛나고 있는
부동의 첫사랑
		</pre>
</fieldset>

</body>
</html>