package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
어노테이션을 통한 요청명 매핑으로 *를 통해 여러 요청명을 한번에 매핑
즉. .one으로 끝나는 모든 요청에 대해 매핑처리
*/
@WebServlet("*.one")
public class FrontController extends HttpServlet{
	
	/*
	get방식으로 들어오는 요청을 처리하기 위해 doGet메소드를 오버라이딩이 필수적
	만약 서블릿에 해당 메소드가 정의되지 않았다면 405에러가 발생
	해당 방식의 요청을 처리 불가하다는 의미
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//request내장객체를 통해 현재 요청된 URL을 획득
		//웹브라우저의 주소표시줄에 있는 전체 경로명에서 HOST(localhost)를 제외한
		//나머지 경로 획득 가능
		String uri = req.getRequestURI();
		//URL에서 마지막 /의 index를 획득
		int lastSlash = uri.lastIndexOf("/");
		//앞에서 얻은 index를 통해 URL을 자르기
		//마지막에 있는 요청명만 남김
		String commandStr = uri.substring(lastSlash);
		
		//마지막 요청명을 통해 요청을 판단한 후 해당 요청을 처리할 메소드를 호출
		//사용자의 요청정보를 담은 request객체를 인수로 전달
		//모든 요청을 메소드로 전달하는 것
		if(commandStr.equals("/regist.one"))
			registFunc(req); //회원가입 요청
		else if(commandStr.equals("/login.one"))
			loginFunc(req); //로그인 요청
		else if(commandStr.equals("/freeboard.one"))
			freeboardFunc(req); //자유게시판 요청
		
		//요청명에 관련된 변수들을 request영역에 저장
		req.setAttribute("uri", uri);
		req.setAttribute("commandStr", commandStr);
		//View로 포워드
		req.getRequestDispatcher("/13Servlet/FrontController.jsp").forward(req, resp);
	}
	
	void registFunc(HttpServletRequest req) {
		req.setAttribute("resultValue", "<h4>회원가입</h4>");
	}
	void loginFunc(HttpServletRequest req) {
		req.setAttribute("resultValue", "<h4>로그인</h4>");
	}
	void freeboardFunc(HttpServletRequest req) {
		req.setAttribute("resultValue", "<h4>자유게시판</h4>");
	}
}