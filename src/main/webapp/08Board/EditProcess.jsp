<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="IsLoggedIn.jsp" %>
<%
	String num = request.getParameter("num");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	//DTO객체에 수정할 내용 세팅
	BoardDTO dto = new BoardDTO();
	dto.setNum(num);
	dto.setTitle(title);
	dto.setContent(content);

	//DAO객체 생성을 통해 오라클 연결
	BoardDAO dao = new BoardDAO(application);
	// update 쿼리문을 실행하여 게시물 수정
	int affected = dao.updateEdit(dto);
	//자원해제
	dao.close();
	
	if(affected == 1){
		/*
		수정이 완료되었으면 수정된 내용을 확인하기 위해 주로 내용보기
		페이지로 이동
		*/
		response.sendRedirect("View.jsp?num=" + dto.getNum());
	}else{
		//수정 실패하면 뒤로 이동
		JSFunction.alertBack("수정하기에 실패하였습니다,", out);
	}
%>