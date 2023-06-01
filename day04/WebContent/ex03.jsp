<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "ex03.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03.jsp</title>
</head>
<body>

<h1>DB에 있는 테이블 정보 불러오기</h1>
<hr>

<%-- DAO 객체를 생성하기 --%>
<%
	StudentDAO dao = new StudentDAO();
	List<StudentDTO> list = dao.selectAll();
%>

<%-- 화면에 표시할 <table> 태그 만들기 --%>

<table border="1" cellpadding="10" cellspacing="0" width="300">
		<thead>
		<tr bgcolor="silver">
				<th>NAME</th>
				<th>AGE</th>
				<th>GENDER</th>
		</tr>
		</thead>
		<%-- <tbody> 내부의 <tr> 태그는 반복문으로 출력 --%>
		<tbody>
		<% for(StudentDTO dto : list) { %>
		<tr>
				<td><%=dto.getName() %></td>
				<td><%=dto.getAge() %></td>
				<td><%=dto.getGender() %></td>
		</tr>
		<% }%>
		</tbody>
</table>
</body>
</html>


<!-- 데이터 형태를 맞춰주는게 dto -->
<!-- db 데이터를 가져와서 자바식으로  -->