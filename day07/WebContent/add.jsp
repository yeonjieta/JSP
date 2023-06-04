<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h3>입력</h3>

<form action="${cpath }/add-action.jsp" method="POST" >
	<p><input type="text" name="title" placeholder="제목을 입력하세요" ></p>
	<p><input type="text" name="memo" placeholder="메모를 입력하세요" ></p>
	<p><input type="date" name="sdate" ></p>
	<p><input type = "submit"></p>

</form>

</body>
</html>