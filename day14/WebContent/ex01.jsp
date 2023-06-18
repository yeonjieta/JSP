<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01.jsp</title>
</head>
<body>

<h1>쿠키 유효시간 확인</h1>

<% 
		Cookie jsessionid = null;
		Cookie[] cs = request.getCookies();
		for(int i = 0; cs != null && i <cs.length; i++){
				Cookie c = cs[i];
				if(c.getName().equals("JSESSIONID")){
					jsessionid = c;
					break;
				}
			}
		Cookie c1 = new Cookie("test", "1234");
		c1.setMaxAge(60);
		response.addCookie(c1);
		
		Cookie c2 = new Cookie("JSESSIONID", session.getId());
		// JSESSIONID를 쿠키를 통해 저장, 그럼 넣어뒀던게 그대로 남아있다. 이전에 쓰던 session을 다시 찾을 수 있다. session의 만료시간 때문에 사라지면 안되고, 쿠키도 소멸하면 안된다.
		// 내가 사용하던 세션을 불러오기 
		c2.setMaxAge(1200);
		response.addCookie(c2);
%>			

<h3>jsessionid.getMaxAge() : <%=jsessionid.getMaxAge() %></h3>	 
<!-- 정상적으로 값을 받아오지 못해서 -1이 뜬다.  -->
<h3>jsessionid.getValue() : <%=jsessionid.getValue() %></h3>
<h3>session.getId() : <%=session.getId() %></h3>	
<br>
<h3>\${cookie.test.value } : ${cookie.test.value }</h3>
<h3>\${cookie.test.maxAge} : ${cookie.test.maxAge }</h3>


</body>
</html>