<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex06.jsp</title>
</head>
<body>

<h1>EL 태그 다양한 사용법</h1>
<hr>

<%
	pageContext.setAttribute("test", "test1");
// 	String test2 = request.getParameter("test2");
// 	if(test2 == null){
// 		response.sendRedirect("ex06.jsp?test2=hello");
// 	}
%>
<a href="ex06.jsp?test2=hello"><button>클릭</button></a>
<ul>
	<li>\${test } : ${test }</li>
	<li>\${param.test2 } : ${param.test2 }</li>
<!-- 	parameter에 접근해서 참조 -->
	<li>\${header.referer } : ${header.referer }</li>
<!-- 	header: 요청에 header와 body가 있음 
		referer : header 안에 이전에 어디를 통해서 들어왔는지 표기돼있음 -->
	<li>\${cookie.JSESSIONIN.value } : ${cookie.JSESSIONID.value }</li>
	<li>\${pageContext  } : ${pageContext }</li>
	<li>\${pageContext.request  } : ${pageContext.request }</li>
	<li>\${pageContext.session } : ${pageContext.session }</li>
	<li>\${pageContext.servletContext  } : ${pageContext.servletContext }</li>
	<li>\${pageContext.request.contextPath  } : ${pageContext.request.contextPath }</li>
	<li>\${pageContext.request.method  } : ${pageContext.request.method }</li>
	<li>\${pageContext.request.remoteAddr  } : ${pageContext.request.remoteAddr }</li> 
<!-- 	emoteAddr : 접속한 클라이언트의 아이피, 브라우저 입장에선 내 아이피 -->

</ul>
<hr>

<%@ page import = "java.util.*" %>
<%
	Enumeration<String> headerNames = request.getHeaderNames();

	while(headerNames.hasMoreElements()) {   // sc.hasNextLine()
		String headerName = headerNames.nextElement();
		String header = request.getHeader(headerName);
		out.print("<li>" + headerName + " : " + header + "</li>");
	}
%>

</body>
</html>