<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01.jsp</title>
</head>
<body>

<h1>include</h1>
<hr>
<h3>여러 페이지에서 반복되는 구간을 하나의 파일로 만들어두고 여러 파일에서 포함시키기</h3>

	<table border="1" cellpadding="10" cellspacing="0">
		<thead>
			<tr bgcolor="silver">
				<th>태그</th>
				<th>종류</th>
				<th>작동순서</th>
				<th>변수</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><b>&lt;%@ include file="***.jsp" %></b></td>
				<td>지시자(directive)</td>
				<td>소스 먼저 합친 후 컴파일</td>
				<td>같은 영역으로 합쳐짐, 변수 공유 됨</td>
<!-- 				같이 일해보자 느낌 -->
			
				
			</tr>
			<tr>
				<td>&lt;jsp:include page="***.jsp" /></td>
				<td>jsp 액션태그</td>
				<td>각각 컴파일 후 결과만 합쳐서 보여줌</td>
				<td>서로 다른 영역으로 실행됨. 변수 공유 불가</td>
<!-- 				괜히 영역 합쳤다 서로 변수가 충돌하겠다 싶을 때 이거 씀 -->
<!-- 	애초에 다른 파일인데 모양만 합친거 (잠깐 필요에 의해서) -->
<!-- 				모니터 윗판 따로 아랫판 따로 만드는거라 생각하면됨 -->
			</tr>
		</tbody>
	</table>


</body>
</html>