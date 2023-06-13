<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<h3>정보 수정</h3>
<c:set var="dto" value="${dao.selectOne(param.idx) }" />

<form method="POST" action="modify-action.jsp">
	<table>
		<tr>
			<td>ID</td>
			<td><input type="text" name="userid" placeholder="ID" value="${dto.userid }" readonly></td>
		</tr>
		<tr>
			<td>Password</td>
			<td><input type="password" name="userpw" placeholder="Password" required></td>
		</tr>
		<tr>
			<td>Name</td>
			<td><input type="text" name="username" placeholder="Name" value="${dto.username }" required></td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td><input type="date" name="birth" value="${dto.birth }" required></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="email" name="email" placeholder="foo@bar.com" value="${dto.email }" required></td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				<select name="gender" required>
					<option value="">=== 성별 ===</option>
					<option value="남성" ${dto.gender == '남성' ? 'selected' : '' }>남성</option>
					<option value="여성" ${dto.gender == '여성' ? 'selected' : '' }>여성</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>나이</td>
			<td><input type="number" name="age" min="1" max="120" 
					   placeholder="나이" value="${dto.age }" required></td>
		</tr>
	</table>
	<input type="submit" value="정보수정">
</form>



</body>
</html>