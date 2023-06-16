<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

<h3>추가</h3>

<form method="POST" action="add-action.jsp">
		<table>
					<td>채널</td>
					<td><input type="text" name="channel" placeholder="채널" required></td>
				</tr>
				<tr>
					<td>썸네일</td>
					<td><input type="text" name="thumbnail" placeholder="썸네일" required></td>
				</tr>
				<tr>
					<td>iframe</td>
					<td><input type="text" name="iframe" placeholder="iframe" required></td>
				</tr>
				<td><input type="submit"></td>
		</table>
</form>

</body>
</html>