<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 똑같은 내용 반복되니까 <!DOCTYPE html> 지움 -->
<!-- 대문페이지에서 출력해야할 부분 만들기 -->
    <%@ include file = "header.jsp" %>



<h3>대문페이지</h3>
<h4>DB : <%=dao.test() %></h4>
<!-- 위(header)에서 만들고 밑(index)에서 불러다 쓴다  -->

</body>
</html>