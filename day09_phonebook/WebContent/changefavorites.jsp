<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

<c:set var="row" value="${dao.changefavorites(param.idx) }" />
<c:redirect url ="list.jsp" />

</body>
</html>