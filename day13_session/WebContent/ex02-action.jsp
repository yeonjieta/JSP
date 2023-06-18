<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%!
			// db에 들어가있을 정보
		String[][] arr = {
						//				1					2					3
/* userid       */				{"test", 		"admin", 		"itbank"},
/* userpw     */				{"1234", 		"1", 				"it"},
/* username */				{"테스트", 		"관리자", 			"아이티뱅크"},
		};
			// 나중에 dao와 같이 자바 클래스에 만들어서 사용 
		public HashMap<String, String> login(String id, String pw){
			HashMap<String, String> map = null;
			for(int i = 0; i < 3; i++){
				if(arr[0][i].equals(id)){
					if(arr[1][i].equals(pw)){
						map = new HashMap<String, String>();
						map.put("userid", arr[0][i]);
						map.put("userpw", arr[1][i]);
						map.put("username", arr[2][i]);
						break;
					}
				}
			}
			return map;
		}
%>

<% 
		request.setCharacterEncoding("UTF-8");

		String userid = request.getParameter("userid");
		String userpw = request.getParameter("userpw");
		
		HashMap<String, String> loginInfo = login(userid, userpw);
		
		session.setAttribute("login", loginInfo);    // 객체를 세션에 저장
		session.setMaxInactiveInterval(600);		  // 로그인 유효 시간 설정
																	  // 요청이 발생할 때 마다 갱신된다.
		response.sendRedirect("ex02-main.jsp");
%>

</body>
</html>