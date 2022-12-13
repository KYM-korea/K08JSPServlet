<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
// 예시에서 사용할 변수 선언
// page영역에 속성 저장
pageContext.setAttribute("num1", 9);
pageContext.setAttribute("num2", "10");

// empty연산자를 사용하기 위한 변수 ( 빈문자열, 원소가 없는 배열 등.. )
pageContext.setAttribute("nullStr", null);
pageContext.setAttribute("emptyStr", "");
pageContext.setAttribute("lengthZero", new Integer[0]);
pageContext.setAttribute("sizeZero", new ArrayList());
%>
<html>
<head>
<meta charset="UTF-8">
<title>표현 언어(EL) - 연산자</title>
</head>
<body>
	<!-- 
	null이거나 빈문자열, 길이가 0일 컬렉션 혹은 배열일 경우 empty연산자는 true를 반환
	( 객체가 비었는지 확인 )
	 -->
	<h3>empty 연산자</h3>
	empty nullStr : ${empty nullStr } <br />
	empty emptyStr : ${empty emptyStr } <br />
	empty lengthZero : ${empty lengthZero } <br />
	empty sizeZero :  ${empty sizeZero }
	
	<h3>삼항 연산자</h3>
	<!-- EL식 내부에 Java와 동일한 형태로 기술 -->
	num1 gt num2 ? "참" : "거짓"
		=> ${num1 gt num2 ? "num1이 크다" : "num2가 크다" }
		
	<!-- 
	EL에서는 null을 0으로 판단
	but, null과 정수를 연산하는 부분을 이클립스는 에러로 표시
	( 실행에는 전혀 문제 없음 )
	
	아래 코드로 인하여 프로젝트 전체에 에러가 표기되므로 주석 처리
	 -->
	<%-- <h3>null 연산</h3>
	null + 10 : ${ null + 10 } <br />
	nullStr + 10 : ${ nullStr + 10 } <br />
	param.noVar > 10 : ${ param.noVar > 10 } --%>
</body>
</html>