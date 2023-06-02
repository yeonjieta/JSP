<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--     html 상으로 보면 없는거니까 page directive는 그냥 들어감 
			header와 마치 한 페이지인거 처럼 header의 </body> </html> 를 지우고 directive의 윗부분도 다 지움 -->
<!-- 			모양말고 지역변수까지 공유를 시킬지 말지가 중요 -->
<!-- 보편적으로 많이 쓰는건 directive(ex)상단부분 메뉴 만들 때, 항목 선택해도 모양 안바뀜), actionTag는 특수한 경우(게시글 목록이랑 글 같은 경우)에 -->
		
<%@ include file = "ex02-header.jsp" %>

<%
// 		int num = 4;  // Duplicate local variable num(지역변수 중복)
// 	서로다른 파일이지만 하나의 파일이 돼 실행하기 때문에 num으로 쓰면 중복된다고 뜸
%>

<h3>num : <%=num %></h3>
<!-- 페이지 소스보기 하면 header와 합쳐져있음 -->

</body>
</html>