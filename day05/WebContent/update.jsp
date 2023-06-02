<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>


<%
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String gender = request.getParameter("gender");

// 수정 작업 수행
	int row = dao.update(name, age, gender);

	if (row != 0) {
	response.sendRedirect(cpath + "/list.jsp");
	} 
	else {
%>
	<h3>수정 실패</h3>
	<a href="<%=cpath%>/list.jsp">목록</a>
	<%
		}
	%>
	</body>
	</html>