<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>



<table border="1" cellpadding ="10" cellspacing ="0" width ="700" align="center">
		<thead>
				<tr bgcolor ="silver">
						<th>NAME</th>
						<th>AGE</th>
						<th>GENDER</th>
						<th>수정</th>
						<th>삭제</th>
				</tr>
				
		</thead>
		<tbody>
		<% 
				List<StudentDTO> list = dao.selectAll(); // return list;가 여기로 반환, 3번반복
				for(int i = 0; i < list.size(); i++){
					StudentDTO dto = list.get(i);
		%>
				<tr>
						<td><%=dto.getName() %></td>
						<td><%=dto.getAge() %></td>
						<td><%=dto.getGender() %></td>
						<td><a href="<%=cpath %>/modify.jsp?name=<%=dto.getName() %>"><button>수정</button></a></td>
						<td><a href="<%=cpath %>/delete.jsp?name=<%=dto.getName() %>"><button>삭제</button></a></td>
				</tr> 
<!-- 				// tr이 3번 반복된다. 페이지 소스보기하면 tr이 3개 반복돼있다. -->
<!-- 					유동적 변경을 위해 cpath, day05로 해놓으면 고정돼있으니 변경이 안된다. -->
			<% } %>
		
		</tbody>
</table>


</body>
</html>