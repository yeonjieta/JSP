<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ include file="header.jsp" %>
<c:set var ="dto" value="${dao.select(param.idx) }" />
    <%@ page import="java.net.*" %>
    <%@ page import="java.net.URLDecoder" %>
    
     <%!
    	public int getCommaCount(String s) {
    		int count = 0;
    		for(int i = 0; i < s.length(); i++){
    			char ch = s.charAt(i);
    			if(ch == ','){
    				count +=1;
    			}
    		}
    	return count;
    }
    %>
   
<h1>단일 조회 및 쿠키 생성</h1>
<hr>

<h3>idx : ${param.idx }</h3>
<div id ="root">
	<div id = "iframe">
		${dto.iframe }<br>
		${dto.title }<br>
		${dto.channel }
	</div>
	
</div>



<%

		String idx = request.getParameter("idx");

		Cookie[] cs = request.getCookies();
		String value = "";
		for(int i = 0; cs != null && i < cs.length; i++){
			if(cs[i].getName().equals("recent")){
				value = URLDecoder.decode(cs[i].getValue(), "UTF-8");
			}
		}
			if("".equals(value)){ 
				value += idx;		 
			}
			else if(value.contains(idx)){  
				
			ArrayList<String> list = new ArrayList<>(Arrays.asList(value.split(",")));
			list.remove(idx); 
			value = idx;    
			for(String s : list.subList(0, list.size())){  
				  value += "," + s;
			}
		}
			else if(getCommaCount(value) == 4){	
				value = value.substring(0, value.lastIndexOf(",")); 
				value = idx + "," + value ; 
			}
			else {
				value=idx + "," + value;
			}
			Cookie c = new Cookie("recent", URLEncoder.encode(value, "UTF-8"));
			c.setMaxAge(60 * 5);
			response.addCookie(c);
%>
<h3>recent : ${URLDecoder.decode(cookie.recent.value, "UTF-8") }</h3>
<a href="list.jsp"><button>목록으로</button></a>

</body>
</html>