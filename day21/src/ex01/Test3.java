package ex01;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test3 extends HttpServlet {
	

	private static final long serialVersionUID = 1L;
	
	@Override
	public void init() throws ServletException {
		System.out.println("init");
		super.init();
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("service");
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		super.service(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doGet");
		req.getRequestDispatcher("/WEB-INF/views/test3.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doPost");
		int n1 = Integer.parseInt(req.getParameter("n1"));
		int n2 = Integer.parseInt(req.getParameter("n2"));
		int answer = n1 + n2;
		
		String exp = String.format("%d + %d = %d", n1, n2, answer);
		
		req.setAttribute("exp", exp);
		req.getRequestDispatcher("/WEB-INF/views/test3_post.jsp").forward(req, resp);
	
	}
	
	@Override
	public void destroy() {
		System.out.println("destroy");
		super.destroy();
	}
	
	// 객체 없으면 init를 생성하고 , 있으면 더이상 만들지 않는다
	// init을 이용해 service에서 요청 메서드에 따라 doGet 실행 doPost 실행 할지 판단
	

}
