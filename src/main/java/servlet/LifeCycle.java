package servlet;

import java.io.IOException;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//어노테이션을 통한 매핑 처리
@WebServlet("/13Servlet/LifeCycle.do")
public class LifeCycle extends HttpServlet{
	
	/*
	서블릿 수명주기에서 최초로 호출되는 메소드로 어노테이션을 통해 생성
	따라서 메소드명은 개발자가 결정
	init() 메소드가 호출되기전 전처리를 위해 주로 사용 
	 */
	@PostConstruct
	public void myPostConstruct() {
		System.out.println("myPostConstruct() 호출");
	}

	/*
	서블릿 객체 생성 후 딱 한번만 호출되는 메소드로, 보통
	서블릿을 초기화하는 역할
	 */
	@Override
	public void init() throws ServletException {
		System.out.println("init() 호출");
	}
	
	/*
	클라이언트의 요청을 분석하기 위해 호출
	전송방식에 상관없이 먼저 호출된 후 doGet()이나
	doPost()를 호출
	 */
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("service() 호출");
		/*
		service() 메소드에서 요청방식을 분석한 후 각 메소드를 호출할 경우
		별도의 호출문장을 기술하지 않음
		하단 super()만 있으면 가능
		*/
		super.service(req, resp);
	}
	
	//get방식의 요청을 처리
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doGet() 호출");
		req.getRequestDispatcher("/13Servlet/LifeCycle.jsp").forward(req, resp);
	}
	
	//post방식의 요청을 처리
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doPost() 호출");
		req.getRequestDispatcher("/13Servlet/LifeCycle.jsp").forward(req, resp);
	}
	
	/*
	 서블릿이 새롭게 컴파일 되거나 서버가 종료될 경우 호출
	 서블릿 객체는 메모리에서 소멸
	 이클립스에서 server탭에서 서버를 종료하면 아래 메소드가 호출
	 */
	@Override
	public void destroy() {
		System.out.println("destroy() 호출");
	}
	
	/*
	destroy() 메소드 호출 후 후처리를 위해 사용
	어노테이션을 사용하므로 메소드명은 개발자가 결정
	 */
	@PreDestroy
	public void myPreDestroy() {
		System.out.println("myPreDestroy() 호출");
	}
}