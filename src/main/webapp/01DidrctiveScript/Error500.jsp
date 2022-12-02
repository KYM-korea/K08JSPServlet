<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page 지시어 - errorPage, isErrorPage 속성</title>
</head>
<body>
<%
/* 
	해당 파일을 처음로 실행했을 때는 퍼마미터가 없는 
	NummerFormatExceoption 발생] 실행 후 주소입력창에 파일명 뒤에
	?age=30과 같이 작성하면 예외가 사라짐
*/
	int myAge = Integer.parseInt(request.getParameter("age"))+10;
	out.print("10년 후 당신의 나이는"+ myAge+"입니다.");
%>
</body>
</html>