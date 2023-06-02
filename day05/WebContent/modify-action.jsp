<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>

<jsp:useBean id="dto" class="student.StudentDTO"/>
<jsp:setProperty property="*" name="dto" />

<!-- <script> -->
<%-- 		const row = '<%=dao.modify(dto)%>'      // SQL에 영향받은 줄 수를 정수로 반환 --%>
		
// 		if(row != 0) {			
// 			alert('수정성공')
<%-- 			location.href = '<%=cpath %>/list.jsp'		 --%>
// 		}
// 		else {			// 문자열과 정수간의 비교도 가능하다('0' == 0)
// 			alert('수정실패')
// 			history.go(-1)
// 		}
<!-- </script> -->

<!-- 나중에 함수이름 바꿔서 해보기~~~ -->

</body>
</html>