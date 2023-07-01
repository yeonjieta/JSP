package ex01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test2 extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		super.service(req, resp);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();  // 응답에 문자열을 기록하기 위한 객체 getWriter()를 부른다.
		
		// out을 통해 resp(response)에 전달
		String html = "<!DOCTYPE html>\r\n";
		html += "<html lang=\"ko\">\r\n";
		html += "<head>\r\n";
		html += "<title>Test1 servlet</title>\r\n";
		html += "</head>\r\n";
		html += "<body>\r\n";
		
		html += "<h1>Test2!</h1>\r\n";
		html += "<hr>\r\n";
		html += "<form method=\"POST\">\r\n";    // @@ get에서는 post로 보내게 만들고
		html += "		<input type=\"text\" name=\"n1\">\r\n";
		html += "		<input type=\"text\" name=\"n2\">\r\n";
		html += "		<input type=\"submit\">\r\n";
		html += "</form>\r\n";
		
		html += "</body>";
		html += "</html>";
		
		out.write(html);
		out.flush();
		out.close();
		
	}
	
	// @@ post에는 받아서 계산을 한다 
	// POST에 띄워주기 위한 
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			int n1 = Integer.parseInt(req.getParameter("n1"));
			int n2 = Integer.parseInt(req.getParameter("n2"));
			
			int answer = n1 + n2;
			
			String exp = String.format("%d + %d = %d", n1, n2, answer);
			
			PrintWriter out = resp.getWriter();
			out.write("<html>");
			out.write("<h3>" + exp + "</h3>");
			out.write("<html>");
			out.flush();
			out.close();
	}
	
	// data를 만들어서 보내주기 때문에 jsp에는 보여주기만 하면 된다. 
	
	// redirect는 끊고 다시 하는거 
	// forward 는 전화 끊지말고 잠시 기다려주세요, 그쪽으로 연결해드릴게요 느낌(애초에 request, response를 넘기는 느낌)
	

}
