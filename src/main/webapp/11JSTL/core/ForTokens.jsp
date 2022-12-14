<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - forTokens</title>
</head>
<body>
	<!-- 
	forTokens 태그 : 문자열에서 특정 구분자를 통해 반환된 배열의 크기만큼
		반복해야할 경우 사용
	속성]
		items : 구분자를 통해 반환된 배열의 크기만큼 반복해야할 경우 사용
		delims(delimiter) : 구분자를 지정
			( 여러가지 특수기호를 사용 가능 )
		var : 구분자를 통해 잘라낸 토큰을 저장
		※토큰이란? : 문법적으로 의미있는 최소단위를 의미
		하이픈으로 구분되어있는 전화번호를 분리했을때 각각의 번호가 토큰으로 정의
	 -->
	<%
	String rgba = "Red, Green, Blue, Black";
	%>
	<h4>JSTL의 forTokens태그 사용</h4>
	<c:forTokens items="<%=rgba %>" delims="," var="color">
		<span style="color:${color};" >${color }</span> <br />
	</c:forTokens>
	
	<h4>StringTokenizer 클래스 사용</h4>
	<%
	StringTokenizer tokens = new StringTokenizer(rgba,",");
	out.println("토큰수 : " + tokens.countTokens() + "<br>");
	while(tokens.hasMoreTokens()){
		String token = tokens.nextToken();
		out.println(token + "<br>");
	}
	%>
	
	<h4>String 클래스의 split() 메소드 사용</h4>
	<%
	String[] colorArr = rgba.split(",");
	for(String s : colorArr){
		out.println(s+"<br>");
	}
	%>
	
</body>
</html>