package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//서블릿 생성을 위해 첫번째로 HttpServlet클래스를 상속
public class DirectServletPrint extends HttpServlet{

	/*
	사용자가 post방식으로 전송한 요청을 처리하기 위해 doPost() 메소드를 오버라이딩
	if.해당 메소드가 오버라이딩 되지 않으면 요청을 처리할 메소드가 없으므로 405에러 발생
	*/
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//서블릿에서 직접 HTML태그를 출력하기 위해 문서의 컨텐츠타입을 설정
		resp.setContentType("text/html;charset=UTF-8");
		//직접 출력을 위해 PrintWriter객체를 생성
		PrintWriter writer = resp.getWriter();
		
		//출력할 내용을 기술
		writer.println("<html>");
		writer.println("<head><title>DirectServletPrint</title></head>");
		writer.println("<body>");
		writer.println("<h2>서블릿에서 직접 출력합니다.</h2>");
		writer.println("<p>jsp로 포워드하지 않습니다.</p>");
		writer.println("</body>");
		writer.println("</html>");
		//객체의 자원 해제
		writer.close();
		/*
		해당 방식은 JSP페이지 없이 서블릿에서 직접 내용을 출력해야할 경우 사용
		( API 통신시 주로 사용 )
		 */
	}
}