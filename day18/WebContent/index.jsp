<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<main>
			<fieldset>
					<legend>구현해야할 기능</legend>
					<ul>
							<li>member
								  <ol>
								  		<li>로그인</li>
								  		<li>로그아웃</li>
								  		<li>회원가입</li>
								  </ol>
							</li>
							<li>
								  board
								  <ol>
								  		 <li>목록</li>
								  		 <li>작성</li>
								  		 <li>조회</li>
								  		 <li>검색</li>
								  		 <li>수정</li>
								  		 <li>삭제</li>
								  </ol>
							</li>
							<li>reply
								 	<ol>
								 			<li>목록</li>
								 			<li>작성</li>
								 			<li>삭제</li>
								 	</ol>
							</li>
					</ul>
			</fieldset>
			
			<!--  window에서 강제종료 방법 -->
<pre class="cmd">
C: \> netstat -ano | findstr 8080
   TCP    0.0.0.0:8080           0.0.0.0:0              LISTENING       6736
   TCP    [::]:8080          	  [::]:0                  LISTENING       6736
 
 C: \> taskkill /f /pid 6736
 성공: 프로세스(PID 6736)가 종료되었습니다.	
</pre>
	<p><%=application.getRealPath("/upload") %></p>
	<p><img src="${cpath }/upload/kong.jpg" width="300"></p>

</main>
</body>
</html>