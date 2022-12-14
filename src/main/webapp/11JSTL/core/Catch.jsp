<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - catch</title>
</head>
<body>
	<!-- 
	catch태그
	 : EL이나 JSP에서 발생한 예외를 처리할때 사용
	 var속성을 사용하면 에러 내용을 원하는 위치에 출력 가능
	 JSTL문법 오류는 catch되지 않음
	 -->
	<h4>자바 코드에서의 예외</h4>
	<%
	int num1 = 100;
	%>
	
	<c:catch var="eMessage">
		<%
		//정수는 0으로 나누면 무한대가 되므로 연산 불능 예외 발생
		int result = num1 / 0;
		%>
	</c:catch>
	예외 내용 : ${eMessage }
	
	<h4>EL에서의 예외</h4>
	<c:set var="num2" value="200" />
	<!--
	EL에서는 + 기호를 덧셈연산에만 사용
	( 문자열을 연결하는 기능이 없으므로 예외 발생 )
	 -->
	<c:catch var = "eMessage">
		${"일" + num2 }
	</c:catch>
	예외 내용 : ${eMessage }
</body>
</html>