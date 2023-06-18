<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.MemberDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02-action.jsp</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="user" class="member.MemberDTO" />
<jsp:setProperty property="*" name="user" />
<%
		MemberDAO dao = MemberDAO.getInstance();
		MemberDTO login = dao.login(user);
		session.setAttribute("login", login);
		
		// 자동로그인을 위해 추가 
		String autologin = request.getParameter("autologin");
		if(autologin != null ){  // 체크박스에 체크를 했다면
			Cookie c = new Cookie("JSESSIONID", session.getId()); 
		// 내가 쓰고 있는 session의 id를 cookie에 저장해서(cookie를 이용해 client에게 저장해둔다.)
			c.setMaxAge(60 * 60 * 24);
			response.addCookie(c);  // response에 cookie를 실어서 가라고 안해도 감 
		}
		
		response.sendRedirect("ex02-main.jsp");
%> 

</body>
</html>