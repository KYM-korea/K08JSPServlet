<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - fmt 2</title>
</head>
<body>
	<!-- Date클래스를 통해 날짜를 설정 -->
	<c:set var="today" value="<%= new java.util.Date() %>" />
	
	<!-- 
	날짜만 출력할때 사용 (type="date")
	dateStyle 속성에 따라 아래와 같이 표현
		full : 0000년 0월 0일 0요일
		short : 00. 0. 0
		long : 0000년 0월 0일
		default :0000. 0. 0 
	 -->
	<h4>날짜 포맷</h4>
	full : <fmt:formatDate value="${today }" type="date" dateStyle="full" />
	<br />
	short : <fmt:formatDate value="${today }" type="date" dateStyle="short" />
	<br />
	long : <fmt:formatDate value="${today }" type="date" dateStyle="long" />
	<br />
	default : <fmt:formatDate value="${today }" type="date" dateStyle="default" />
	
	<!-- 
	시간만 출력할 경우 사용 (type="time")
	timeStyle의 값에 따라
		full : 오후 00시 00분 00초
		short : 오후 00:00
		long : 오후 00시 00분 00초 KST
		default : 오후 00:00:00
	 -->
	<h4>시간 포맷</h4>
	full : <fmt:formatDate value="${today }" type="time" timeStyle="full" />
	<br />
	short : <fmt:formatDate value="${today }" type="time" timeStyle="short" />
	<br />
	long : <fmt:formatDate value="${today }" type="time" timeStyle="long" />
	<br />
	default : <fmt:formatDate value="${today }" type="time" timeStyle="default" />
	
	<!-- 
	날짜와 시간을 둘 다 표시하므로 포맷도 각각 지정 가능
	앞에서 사용한 속성값들을 조합하여 테스트
	 -->
	<h4>날짜/시간 표시</h4>
	<fmt:formatDate value="${today }" type="both" dateStyle="full" timeStyle="full" />
	<br />
	<fmt:formatDate value="${today }" type="both" pattern="yyyy-MM-dd hh:mm:ss"/>
	
	<h4>타임존 설정</h4>
	<!-- GMT : 세계 표준시로 영국 그리니치 천문대를 기준 -->
	<fmt:timeZone value="GMT">
		<fmt:formatDate value="${today }" type="both" dateStyle="full"
		timeStyle="full" />
	</fmt:timeZone>
	<br />
	<fmt:timeZone value="America/Chicago">
	<!-- 타임존을 미중부로 설정 -->
		<fmt:formatDate value="${today }" type="both" dateStyle="full"
		timeStyle="full" />
	</fmt:timeZone>
	<br />
	<!-- 표준시에 9를 더하면 KST(대한민국 표준시) -->
	<fmt:timeZone value="GMT+9">
		<fmt:formatDate value="${today }" type="both" dateStyle="full"
		timeStyle="full" />
	</fmt:timeZone>
	
	<h4>timeZone에 사용할 수 있는 문자열 구하기</h4>
	<c:forEach var="ids" items="<%= java.util.TimeZone.getAvailableIDs() %>">
		${ids } <br />
	</c:forEach>
</body>
</html>