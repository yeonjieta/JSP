<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex06-popup.jsp</title>
</head>
<body>

<h3>공지사항</h3>

<fieldset style="height: 250px; margin: 10px auto;">
	내용
</fieldset>

<form method="POST">
	 <div style="display: flex; justify-content: space-between;">
		 <div>
	 			<label>
		 		<input type="checkbox" name="donotPopup">2분동안 열지 않습니다.
	 			</label>
		 </div>
		 <div>
	 		<input type="submit" value="닫기">  
<!-- 	 		action 없으니 현재페이지에서 받는다. 스크립틀릿으로 가자 -->
		 </div>
	 </div>	
</form>
<%
		if(request.getMethod().equals("POST")){
			String donotPopup = request.getParameter("donotPopup");
			// request.getParameter를 이용해 donotPopup 값을 가져옴 
			if(donotPopup != null){
				Cookie c = new Cookie("donotPopup", donotPopup);
												// 이름은 중요하지만 값은 중요하지 않다.
				c.setMaxAge(60 * 2); // 유효시간 걸어주고 
				response.addCookie(c);
			} 
			// value 지정 안하면 기본값 on, 체크하면 on, 안하면 null
			%>
			<script>
					window.close()
// 					현재 팝업창 닫아주기 
			</script>
			<%
		}
%>
</body>
</html>