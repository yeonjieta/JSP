<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

<form action="${cpath }/add-action.jsp" method="POST" >
	<p><input type="text" name="name" placeholder="제품명을 입력하세요" ></p>
	<p><input type="number" name="price" placeholder="가격을 입력하세요" value="1000" step="100"></p>
	<p><input type="number" name="cnt" ></p>
	<p><input type = "submit"></p>
</form>


</body>
</html>