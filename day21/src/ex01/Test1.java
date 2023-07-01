package ex01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
// 자바의 모든 내용 상속
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Test1 extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// 메서드를 상속받아서 만들어주기만 하면 된다.
	@Override                                                                                         //resp : request, rsponse
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter out = resp.getWriter();  // 응답에 문자열을 기록하기 위한 객체 getWriter()를 부른다.
		// out을 통해 resp(response)에 전달
		String html = "<!DOCTYPE html>\r\n";
		html += "<html lang=\"ko\">\r\n";
		html += "<head>\r\n";
		html += "<title>Test1 servlet</title>\r\n";
		html += "</head>\r\n";
		html += "<body>\r\n";
		html += "<h1>Hello, Servlet !!</h1>\r\n";
		html += "</body>";
		html += "</html>";
		
		out.write(html);
		out.flush();
		out.close();
		
		// web.xml에가서 내가 만든 servlet을 동록해줘야한다.
	}

}
