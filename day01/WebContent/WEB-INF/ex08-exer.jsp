<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%
	String name = request.getParameter("name");
// client가 요청한 내용
if( name != null && name.equals("") == false){
	out.print("<h3>" + name + "님 안녕하세요!!</h3>" );
}
else{
	out.print("<h3>반갑습니다.</h3>");
}
Map<String, String[]> paramMap = request.getParameterMap();
for(String key : paramMap.keySet()){
	String[] values = paramMap.get(key);
	
}
%>

</body>
</html>