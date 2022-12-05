<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie</title>
</head>
<body>
	<!--
	 쿠키
	 : 클라이언트의 상태 정보를 유지하기 위한 기술로 클라이언트의 PC에 파일형태로 저장
	 쿠키하나의 크기는 4kb이고, 3000개까지 생성 가능
	-->
	<h2>1. 쿠키(Cookie) 설정</h2>
	<%
	/* 
	쿠키는 생성자를 통해서만 생성 가능
	setName()이란 메소드가 없으므로 쿠키는 생성한 후 쿠키명을 변경 불가
	*/
	Cookie cookie = new Cookie("myCookie","쿠키맛나요");
	/*
	쿠키의 진로설정
	컨텍스트루트 경로로 지정하므로 웹 애플리케이션 전체에서 사용 가능
	*/
	cookie.setPath(request.getContextPath());
	// 쿠키의 유지시간 설정 (3600초이므로 1시간으로 설정)
	cookie.setMaxAge(3600);
	// 응답헤더에 쿠키를 추가하여 클라이언트 쪽으로 전송
	response.addCookie(cookie);
	/*
	여기까지의 코드를 통해 클라이언트 측에 쿠키 생성 가능
	*/
	%>
	
	<h2>2. 쿠키 설정 직후 쿠키값 확인하기</h2>
	<%
	/*
	request 내장객체의 getCookies()를 통해 현재 생성된 모든 쿠키를
	배열의 형태로 획득
	*/
	Cookie[] cookies = request.getCookies();
	// 생성된 쿠키가 존재하면 갯수만큼 반복
	if(cookies!=null){
		// 확장된 for문을 통해 쿠키 읽기
		for(Cookie c : cookies){
			//쿠키명과 쿠키값을 웹브라우저에 출력
			String cookieName = c.getName();
			String cookieValue = c.getValue();
			out.println(String.format("%s : %s<br>",cookieName, cookieValue));
		}
	}
	/*
	쿠키가 생성된 직후에는 쿠키값을 읽기 불가
	클라이언트 측에 있는 쿠키를 서버로 재전송하기 위해 페이지 이동을 하거나
	새로고침을 하여 새로운 요청을 보내야만 읽기 가능
	*/
	%>
	<h2>3. 페이지 이동 후 쿠키값 확인하기</h2>
	<a href="CookieResult.jsp">
		다음 페이지에서 쿠키값 확인하기
	</a>
</body>
</html>