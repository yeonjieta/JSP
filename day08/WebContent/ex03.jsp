<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ex03.*"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="dao" value="${MemberDAO.getInstance() }" />
<!--     싱글톤 객체생성 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03.jsp</title>

</head>
<body>

<h1>싱글톤 + 커넥션풀</h1>
<hr> 


<table border ="1" cellpadding="10" cellspacing="0">
		<tr bgcolor="hotpink">
				<th>IDX</th>
				<th>USERID</th>
				<th>USERPW</th>
				<th>USERNAME</th>
				<th>EMAIL</th>
				<th>BIRTH</th>
				<th>GENDER</th>
				<th>AGE</th>
		</tr>
		
	<c:set var="list" value="${dao.selectAll() }" />
	<c:forEach var="dto" items="${list }">
	
		<tr bgcolor="skyblue">
				<td>${dto.idx }</td>
				<td>${dto.userid }</td>
				<td>${dto.userpw }</td>
				<td>${dto.username }</td>
				<td>${dto.email }</td>
				<td>${dto.birth }</td>
				<td>${dto.gender }</td>
				<td>${dto.age }</td>
		</tr>
	</c:forEach>

</table>
</body>
</html>