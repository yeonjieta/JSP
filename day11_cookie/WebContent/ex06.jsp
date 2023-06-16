<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex06.jsp</title>
</head>
<body>

<h1>쿠키를 활용한 팝업 처리</h1>
<hr>

<p>쿠키 : ${cookie.donotPopup.value }</p>

<script>
		const donotPopup = '${cookie.donotPopup.value}'
		// 자스의 문자열로
		
		function openPopup() {
			let options = 'top=50, left=50, width=500, height=400,'
			options += 'status=no, menubar=no, toolbar=no, resizable=no'
			const url = 'ex06-popup.jsp'  // 이페이지를 팝업으로 띄워
			window.open(url, '공지사항', options)
		}								// 타이틀  옵션 
		
		if(donotPopup != 'on'){  // on이면 팝업을 띄우지 않겠다.
			openPopup()
		}
</script>

</body>
</html>