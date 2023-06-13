<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>



<c:set var="list" value="${dao.selectAll() }" />
<%-- <h3>dao : ${dao }</h3> --%>
<%-- <h3>list : ${list }</h3> --%>

<table border="1" cellpadding="10" cellspacing="0">
		<tr bgcolor="green">
				<th>IDX</th>
				<th>USERID</th>
				<th>USERPW</th>
				<th>USERNAME</th>
				<th>EMAIL</th>
				<th>BIRTH</th>
				<th>GENDER</th>
				<th>AGE</th>
				<th>탈퇴</th>
				<th>수정</th>
		</tr>

		<c:forEach var="dto" items="${list }" >
		<tr bgcolor="skyblue">
				<td>${dto.idx }</td>
				<td><a href="${cpath }/view.jsp?idx=${dto.idx }">${dto.userid }</a></td>
				<td>${dto.userpw }</td>
				<td>${dto.username }</td>
				<td>${dto.email }</td>
				<td>${dto.birth }</td>
				<td>${dto.gender }</td>
				<td>${dto.age }</td>
				<td>
					<a href="${cpath }/delete.jsp?idx=${dto.idx }"><button>탈퇴</button></a>
				</td>
				<td>
					<a href="${update }/add.jsp"><button>수정</button></a>
				</td>
		</tr>
		</c:forEach>

</body>
</html>