<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체 - request</title>
</head>
<body>
	<h2>3. 요청 헤더 정보 출력하기</h2>
	<%
	/* 
	getHeaderNames() : 사용자의 요청 헤더를 얻어올때 사용하는 메소드로
		반환타입은 Enumeration객체
		hasMoreElements() : 출력할 정보가 있는지 확인하여 boolean 값으로 반환
		nextElement() : 헤더명을 반환
		
	getHeader() : 헤더명을 통해 헤더값을 반환
	*/
	Enumeration headers = request.getHeaderNames();
	while(headers.hasMoreElements()){
		// 헤더명을 반복해서 획득
		String headerName = (String)headers.nextElement();
		// 헤더값 획득
		String headerValue = request.getHeader(headerName);
		out.print("헤더명 : " + headerName + ", 헤더값 : " + headerValue + "<br/>");
	}
	/* 요청헤더를 통해 확인할 수 있는 값
	uesr-agent :  사용자가 접속한 웹 브라우저의 종료를 확인 가능
	Chrome, firefox, 등 여러 웹브라우저를 통해 테스트 해보면 각기 다른 결과 출력 확인 가능
	
	referer : 웹 서핑을 통해 특정한 링크를 클릭하여 다른 사이트로 방문할 경우 남는 흔적
		특정 사이트를 통해 해당 페이지로 유입되었는지 확인 가능
	cookie : 웹서버가 브라우저를 통해 클라이언트의 컴퓨터에 남기는 흔적으로 파일형태로 저장
	*/
	%>
	<p>이 파일을 직접 실행하면 referer정보는 출력되지 않습니다.</p>
</body>
</html>