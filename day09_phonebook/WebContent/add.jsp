<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

<h3>추가</h3>

<form method="POST" action="add-action.jsp">
		<table>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" placeholder="이름" required></td>
				</tr>
				<tr>
					<td>번호</td>
					<td><input type="text" name="pnumber" placeholder="번호" required></td>
				</tr>
				<td><input type="submit"></td>
		</table>
</form>

</body>
</html>