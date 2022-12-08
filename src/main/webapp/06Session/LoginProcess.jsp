<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//아이디와 패스워드 받기
String userId = request.getParameter("user_id");
String userPwd = request.getParameter("user_pw");

String oracleDriver = application.getInitParameter("OracleDriver");
String oracleURL = application.getInitParameter("OracleURL");
String oracleId = application.getInitParameter("OracleId");
String oraclePwd = application.getInitParameter("OraclePwd");

//위 정보를 통해 DAO객체를 생성하고 이때 오라클에 연결
MemberDAO dao = new MemberDAO(oracleDriver, oracleURL, oracleId, oraclePwd);
//폼값으로 받은 아이디, 패스워드를 인수로 전달하여 로그인 처리를 위한 쿼리 실행
MemberDTO memberDTO = dao.getMemberDTO(userId, userPwd);
//자원 해제
dao.close();

if(memberDTO.getId() != null){
	//로그인에 성공한 경우 세션영역에 회원아이디와 이름을 저장
	//해당 변수명으로 저장하므로 기억!!!!
	session.setAttribute("UserId", memberDTO.getId());
	session.setAttribute("UserName", memberDTO.getName());
	//로그인 페이지로 '이동'
	response.sendRedirect("LoginForm.jsp");
}else{
	//로그인에 실패한 경우 request영역에 에러메세지를 저장
	request.setAttribute("LoginErrMsg", "로그인 오류입니다.");
	//로그인 페이지로 '포워드'
	request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
}
%>