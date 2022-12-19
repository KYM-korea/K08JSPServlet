package model2.mvcboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fileupload.FileUtil;
import utils.JSFunction;

@WebServlet("/mvcboard/pass.do")
public class PassController extends HttpServlet{
	//패스워드 검증 페이지로 진입
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		 /mvcboard/pass.do?mode=????&idx=???
		 요청명은 위와 같으므로 파라미터를 받아오는 작업이 필요
		 서블릿에서는 2가지 방법으로 획득이 가능
		 방법1] request내장객체를 이용 => req.getparameter(파라미터명)
		 방법2] View(JSP파일)에서 EL의 param내장객체를 사용
		 	=> ${param.파라미터명}
		 */
		//파라미터를 받은 후 request영역에 저장하고 View로 포워드
		req.setAttribute("mode", req.getParameter("mode"));
		req.getRequestDispatcher("/14MVCBoard/Pass.jsp").forward(req, resp);
	}
	
	//비밀번호 검증 페이지에서 전송한 경우 수정, 삭제 처리
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//입력한 비밀번호와 hidden박스에서 전송된 파라미터 받기
		String idx = req.getParameter("idx");
		String mode = req.getParameter("mode");
		String pass = req.getParameter("pass");
		
		//DAO객체 생성 및 패스워드 검증
		MVCBoardDAO dao = new MVCBoardDAO();
		boolean confirmed = dao.confirmPassword(pass, idx);
		dao.close();
		
		//패스워드 검증에 성공한 경우
		if(confirmed) {
			if(mode.equals("edit")) {
				/*
				수정의 경우 검증이 완료된 패스워드를 session영역에 저장
				session영역은 페이지를 이동해도 데이터가 공유되므로 해당 게시물을
				수정완료할때까지 유지하며, 수정이 완료되면 제거
				( 저장한 패스워드는 수정을 위한 update쿼리문의 where절에 사용할 예정 )
				
				getSession()메소드를 통해 session객체를 획득
				 */
				HttpSession session = req.getSession();
				//검증에 사용된 패스워드를 세션영역에 저장
				session.setAttribute("pass", pass);
				/*
				수정 페이지로 이동
				하단 URL패턴을 이용하여 패스워드 검증없이 진입할 경우
				세션에 저장된 패스워드가 없으므로 수정처리가 되지 않도록 처리
				 */
				resp.sendRedirect("../mvcboard/edit.do?idx="+idx);
			}else if(mode.equals("delete")) {
				//게시물을 삭제하고 첨부파일이 있는 경우 같이 삭제
				dao = new MVCBoardDAO();
				//기존 게시물에 내용을 읽어오기
				MVCBoardDTO dto = dao.selectView(idx);
				//게시물을 삭제
				int result = dao.deletePost(idx);
				dao.close();
				//게시물 삭제에 성공할 경우
				if(result == 1) {
					//파일도 삭제
					String saveFileName = dto.getSfile();
					FileUtil.deleteFile(req, "/Uploads", saveFileName);
				}
				//삭제가 완료되면 리스트로 이동
				JSFunction.alertLocation(resp, "삭제되었습니다.", "../mvcboard/list.do");
			}
		}else {
			//검증에 실패한 경우 뒤로 돌아가기
			JSFunction.alertBack(resp, "비밀번호 검증에 실패했습니다.");
		}
	}
}