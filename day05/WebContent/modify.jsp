<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>

<h3>수정</h3>
<%
		String name = request.getParameter("name");
		StudentDTO dto = dao.selectOne(name);
		// select name, age, gender from student where name = '%s'
		// select * from student where name = '%s'
		if(dto == null){
			response.sendRedirect(cpath + "/list.jsp");
		}
		
%>

<form action="<%=cpath %>/update.jsp" method = "POST">
		<p><input type ="text" name ="name" placeholder ="이름" value ="<%=dto.getName() %>" required autofocus></p> 
		<p><input type ="number" name ="age" placeholder ="나이" value ="<%=dto.getAge() %>"  required></p>
		<p>
<!-- 		dto에 이름과 나이가 잘 들어가있다면 잘 작동 -->
				<select name ="gender" required>
						<option value = ""> == 성별 ==</option>
						<option value = "남성" <%=dto.getGender().equals("남성") ? "selected" : "" %>> 남성 </option>
						<option value = "여성" <%=dto.getGender().equals("여성") ? "selected" : "" %>> 여성 </option>
					</select>
		</p>
		<p><input type = "submit"></p>
</form>


</body>
</html>