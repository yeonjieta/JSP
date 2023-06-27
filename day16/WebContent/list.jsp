<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>


<div id="root">
		<c:set var="list" value="${dao.selectAll() }" />
		<c:forEach var="dto" items="${list }">
				<div class="item">
						<div class="date">${dto.writeDate }</div>
						<div class="image"><img src="${cpath }/image/${dto.pic }"></div>
						<div class="content">${dto.content }</div>
						<div class="ip">${dto.ipaddr }</div>
						<div class="delete"><a href="${cpath }/delete.jsp?idx=${dto.idx }"><button>삭제</button></a></div>
				</div>
		</c:forEach>
</div>


</body>
</html>