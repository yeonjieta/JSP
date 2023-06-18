<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = "ko">
<head>
<meta charset="UTF-8">
<title>ex02_cookie_check.jsp</title>
</head>
<body>

<h1>쿠키체크</h1>
<hr>
<fieldset>
<legend>스크립틀릿 쿠키 확인</legend>
<ul>
<%
		// 1) 스크립틀릿, 자바코드에서 확인하기
		// request 해서 cookie를 꺼내서 반복을 돌려서 확인 (spring 가면 하기 때문에 자바코드로 하는 것도 알아야한다.)
		Cookie[] cs = request.getCookies(); // 쿠키가 없다면 cs의 값은 null
		for(int i = 0; cs != null && i < cs.length; i++){	// cs가 null이면, length접근 불가
			Cookie c = cs[i];
			String name = c.getName();
			String value = c.getValue();
			
			// 인코딩된 값이 저장되어 있다면 출력하기 전 decode를 수행해야한다.
			value = URLDecoder.decode(value, "UTF-8");
			
			out.println("<li>" + name + " : " + value + "</li>");
		}
%>
</ul>
</fieldset>
<br>
<fieldset>
		<legend>EL 태그 쿠키 확인</legend>
		<ul>
				<li>ipaddr : ${URLDecoder.decode(cookie.ipaddr.value) }</li>
				<li>lmt : ${URLDecoder.decode(cookie.lmt.value) }</li>
		</ul>
</fieldset>
<br>

<%=URLEncoder.encode("아이유", "UTF-8") %><br>
<%=URLEncoder.encode("가", "UTF-8") %><br>

<fieldset>
		<legend>자바스크립트 확인</legend>
		<ul id="js">
		</ul>
		<script>
				const cookie = document.cookie
				// 현재페이지에 설정된 모든 쿠키를 문자열 형태로 가져온다.
				const arr = cookie.split('; ')
				// 세미콜론과 공백을 기준으로 나눠 배열을 만든다. 각 배열 요소는 하나의 쿠키를 나타냄
				// 보통 'name=value; name=value' 이런식으로 문자열이 쿠키를 포함하고 있기 때문에 '; '로 구분 
				const js = document.getElementById('js')
				// id가 js인 요소를 찾아 js변수에 저장
				for(let i = 0; i < arr.length; i++){
						console.log(arr[i]) // 각 쿠키를 콘솔에 출력(디버깅 목적)
						const li = document.createElement('li') // <li>요소를 생성하여 변수 li에 저장, 이후 쿠키 정보를 담는 목적으로 사용
						li.innerText = arr[i] // 'li'의 텍스트 내용을 현재 반복중인 쿠키의 값으로 설정 
						js.appendChild(li) // js 요소의 자식으로 li 요소를 추가 > 쿠키 정보가 목록에 추가
				}
				alert(document.cookie)    
		</script>
</fieldset>

<p>
		<a href = "ex01_cookie_making.jsp"><button>쿠키 만들기</button></a>
		<a href = "ex03_cookie_delete.jsp"><button>쿠키 삭제</button></a>
</p>
</body>
</html>