<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체 - request</title>
</head>
<body>
<%
// post 방식으로 전송된 한글이 깨지는 현상 방지
request.setCharacterEncoding("UTF-8");
/*
getParameter()
	: input 태그중 text, radio타입처럼 하나의 값이 전송되는 경우 사용
	받은 값은 문자, 숫자에 상관없이 String타입으로 저장
getParameterValues()
	: checkbox 혹은 <select>태그에 multiple 속성을 부여하여 2개 이상의
	값이 전송될 경우 사용
	받은 값은 String타입의 배열로 저장
*/
String id = request.getParameter("id");
String sex = request.getParameter("sex");
//checkbox의 경우 2개이상의 값이므로 배열로 받아 처리
String[] favo = request.getParameterValues("favo");
String favoStr="";
if(favo != null){
	// 전송된 값이 있는 경우 배열의 크기만큼 반복
	for(int i = 0 ; i < favo.length; i++){
		favoStr += favo[i] + " ";
	}
	// 체크박스는 선택한 항목만 전송
}
/* 
<textarea> 태그는 두줄 이상 입력이 가능하므로 엔터기 \r\n으로 저장
따라서 화면에 출력시 <br>태그로 변경
*/
String intro = request.getParameter("intro").replace("\r\n","<br/>");
%>
<ul>
	<li>아이디 : <%= id %></li>
	<li>성별 : <%= sex %></li>
	<li>관심사항 : <%= favoStr %></li>
	<li>자기소개 : <%= intro %></li>
</ul>
</body>
</html>