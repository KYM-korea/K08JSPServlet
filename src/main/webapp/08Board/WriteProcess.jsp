<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 글쓰기 페이지에 오랫동안 머물러 세션이 삭제되는 경우가
있으므로 글쓰기 처리 페이지에서도 반드시 로그인을 확인 -->
<%@ include file="IsLoggedIn.jsp" %>
<%
//클라이언트가 작성한 폼값을 수령
String title = request.getParameter("title");
String content = request.getParameter("content");

//폼값을 DTO객체에 저장
BoardDTO dto = new BoardDTO();
dto.setTitle(title);
dto.setContent(content);
/* 특히 아이디의 경우 로그인 후 작성 페이지에 진입할 수 있으므로
세션 영역에 저장된 회원아이디를 가져와서 DTO에 저장*/
dto.setId(session.getAttribute("UserId").toString());

// DB연결을 위해 DAO객체를 생성
BoardDAO dao = new BoardDAO(application);
// 입력값이 저장도니 DTO객체를 인수로 전달하여 insert 쿼리문을 실행
int iResult = dao.insertWrite(dto);
dao.close();

if(iResult ==1){
	/*
	입력에 성공한 경우 리스트로 이동하여 새롭게 등록된 게시물을 확인
	*/
	response.sendRedirect("List.jsp");
}else{
	// 실패했다면 재입력을 위해 글쓰기 페이지로 다시 돌아감
	JSFunction.alertBack("글쓰기에 실패하였습니다.", out);
}
%>