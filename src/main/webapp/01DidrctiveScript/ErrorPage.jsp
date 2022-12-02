<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    errorPage="isErrorPage.jsp"%>
<%-- 
에러페이지 처리방법 2
: page지시어에 errorPage속성을 추가
해당 속성은 에러발생 시 현재 페이지에서 처리하지 않고,
지정된 페이지로 오류를 전달하겠다는 의미를 내포

해당 파일을 실행하면 즉시 500에러 발생
해당 에러는 지시어에 의한 지정된 페이지로 전달하여 실제 출력내용은
isErrorPage.jsp파일이 출력
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page 지시어 - errorPage, isErrorPage속성</title>
</head>
<body>
<%
	int myAge = Integer.parseInt(request.getParameter("age"))+10;
	out.println("10년 후 당신의 나이는" + myAge + "입니다");
%>
</body>
</html>