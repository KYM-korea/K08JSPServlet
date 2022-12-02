<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - Response</title>
</head>
<body>
<%
// request 내장객체를 통해 전송된 폼값 받기
String id = request.getParameter("user_id");
String pwd = request.getParameter("user_pwd");
// 문자열을 통한 단순비교로 로그인 정보를 확인
// 정보 일치시 Welcome페이지로 이동
if(id.equalsIgnoreCase("must") && pwd.equalsIgnoreCase("1234")){
	// JS의 loaction.href와 기능적으로 완전히 동일한 메소드로
	// 인수로 주어진 경로로 이동
	response.sendRedirect("ResponseWelcome.jsp");
}else{
	/* 
	인증에 실패한 경우 메인페이지로 포워드(forward)
	
	포워드란?
	 : 페이지 이동과는 다르게 제어의 흐름을 전달하고자 할때 사용
	웹 브라우저의 주소줄에는 ResponseLogin.jsp가 보여지지만 실제 출력되는
	내용은 ResponseMain.jsp가 출력
	
	하단 명령을 통하여 모든 내용을 버퍼에서 제거한 후 아래 페이지의 내용을
	웹 브라우저에 출력하면서 요청정보와 응답정보를 전달
	*/   
	request.getRequestDispatcher("ResponseMain.jsp?loginErr=1")
	.forward(request, response);
}
%>
</body>
</html>