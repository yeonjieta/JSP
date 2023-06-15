<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

<c:set var="list" value="${dao.selectAll()}"/>

<table border="1" cellpadding="10" cellspacing="0">
		<tr bgcolor = "skyblue" >
				<th>번호</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>즐겨찾기</th>
		</tr>
		
		<c:forEach var="dto" items="${list }">
			<tr bgcolor = "white" >
				<td>${dto.idx }</td>
				<td><a href="${cpath }/view.jsp?idx=${dto.idx}">${dto.name }</a></td>
				<td>${dto.pnumber }</td>
				
				<td>
					<a href="${cpath }/changefavorites.jsp?idx=${dto.idx}">
					<button class="${dto.favorites == 1 ? 'normal' : 'cancle' }">
							${dto.favorites == 1 ? '즐겨찾기' : '일반' }
					</button>
					</a> 
				</td>
				
			</tr>
		</c:forEach>
</table>
</body>
</html>