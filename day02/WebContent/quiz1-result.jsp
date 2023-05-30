<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--  POST로 전달한다면 파라미터 입력전에 반드시 해줘야함 -->
<%
	request.setCharacterEncoding("UTF-8");
	
	// POST 방식의 요청이 아니라면 quiz1.jsp로 보내기, result에서 실행해도 form으로 감
	if(request.getMethod().equals("POST") == false){
		response.sendRedirect("quiz1.jsp");
	}

%>
<!--  // 한 번에 처리가능 ,나눠있는 파라미터를 하나의 객체로 묶어줌으로써 디비로 넣든 다른 페이지로 넘길 때 매개변수를 하나만 할수있으니 처리하기 쉽다 -->
<jsp:useBean id ="dto" class="quiz1.Quiz1DTO" scope ="page"/>
<jsp:setProperty property="*" name="dto"  />
<%@ page import ="quiz1.Quiz1DTO" %>
<table border="1" cellpadding="10" cellspacing="0"></table>

 <table>
 	<tr>
 		<td>userid</td>
 		<td><jsp:getProperty name="dto" property="userid" /></td>
 	</tr>
 	<tr>
<!--  usebean은 객체를 만들고 attribute에 넣어주기 대문에 다운캐스팅 할 필요없이 dto. 으로 해결하면 됨 -->
 		<td>pw1</td>
 		<td><%=dto.getPw1() %></td>
 	</tr>
 	<tr>
 		<td>pw2</td>
 		<td>${dto.pw2 }</td>
 	</tr>
 	<tr>
 		<td>name</td>
 		<td>${dto.name }</td>
 	</tr>
 	<tr>
 		<td>yyyy</td>
 		<td>${dto.yyyy }</td>
 	</tr>
 	<tr>
 		<td>dd</td>
 		<td>${dto.dd }</td>
 	</tr>
 	<tr>
 		<td>mm</td>
 		<td>${dto.mm }</td>
 	</tr>
 	
 </table>
	
	<jsp:include page = "quiz1.jsp"/>
</fieldset>



</body>
</html>