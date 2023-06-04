<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:set var="list" value="${dao.selectAll() }" />

<table border="2" cellpadding="10" cellspacing="0">
  <tr bgcolor="lightgreen">
    <th>TITLE</th>
    <th>MEMO</th>
    <th>SDATE</th>
    <th>삭제</th>
  </tr>
  
  <c:forEach var="dto" items="${list }" >
  <tr bgcolor="skyblue">
    <td>${dto.title }</td>
    <td>${dto.memo }</td>
    <td>${dto.sdate }</td>
    <td><a href="${cpath }/delete.jsp?idx=${dto.idx }"><button>삭제</button></a></td>
  </tr>
  </c:forEach>
</table>





</body>
</html>