<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01_cookie_making.jsp</title>
<body>

<%
		//  쿠키는 db에 저장하기엔 너무 과부하고 , 로그인하지않아도 볼 수 있는 최근 본 상품 등 이럴 때 이용한다.
		// 사용자가 입력했던 내용을 임시로 저장해뒀다, 다음 번 요청 때 쿠키의 값에 따라 불러옴, 실행 내용이 달라질 수 있다. 
		// 4키로바이트 넘어갈 수 없음
		String ip = request.getRemoteAddr(); 		// 원격컴퓨터(접속자)의 IP주소를 문자열로 저장
		Cookie c1 = new Cookie("ipaddr", ip);			// 새로운 쿠키 생성(쿠키이름, 쿠키값)
		c1.setMaxAge(60 * 60 * 24 * 7);				// 쿠키의 유효시간을 설정(시간이 지나면 쿠키 소멸), 60분 60초 24시간 7일동안 보관
		response.addCookie(c1);							// 클라이언트에게 보낼 응답에 쿠키를 같이 보냄, response에 적재
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		Date date = new Date();							// 현재 날짜와 시간을 문자열로 생성
		String lastAccessedTime = sdf.format(date);			
		
		// 띄워쓰기 및 기호는 쿠키 내용으로 사용할 수 없기 때문에 인코딩을 진행한다.
		lastAccessedTime = URLEncoder.encode(lastAccessedTime, "UTF-8");
		
		Cookie c2 = new Cookie("lmt", lastAccessedTime);		// 마지막 접근 시간을 쿠키로 생성, cookie는 문자열만 처리
		c2.setMaxAge(60 * 60 * 24 * 7);				// 쿠키의 유효시간 설정	
		response.addCookie(c2);							// 응답에 쿠키를 같이 보냄
		
		// 클라이언트에게 보내줄 응답에 쿠키를 같이 포함시켜서 보내는 작업
		// 쿠키는 클라이언트가 보관하다가, 다음번 요청에 같이 포함되어서 서버로 넘어온다.
		// 따라서, 쿠키를 방금 보낸 시점에서는 쿠키를 확인할 수 없고, 보통 리다이렉트를 이용하여 주소를 갱신시킨다.
		
		// 다음번 올 때 이쪽으로 넘김, 처음에 10개 저자하고 바로 쿠폰써주세요 안됨, 담 번에 올 때 사용가능 느낌
		response.sendRedirect("ex02_cookie_check.jsp");
%>

</body>
</html>