<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - out</title>
</head>
<body>
<!-- 
out 태그
: 영역에 저장된 변수를 출력할 경우 사용
escapeXml속성이 true면 HTML 태그가 그대로 출력
innerText()와 동일
 -->
 	<!-- <i> 태그가 포함된 문자열로 변수를 생성 -->
	<c:set var="iTag">
		i태그는 <i>기울임</i> 을 표현합니다.
	</c:set>
	
	<!-- escapeXml속성은 true가 디폴트값이므로 HTML이 그대로 출력 -->
	<h4>기본 사용</h4>
	<c:out value="${iTag }" />
	
	<!-- 
	false가 되면 HTML태그가 적용되어 출력
	innerHTML()과 동일
	 -->
	<h4>escapeXml 속성</h4>
	<c:out value="${iTag }" escapeXml="false" />
	
	<!-- 
	최초 실행시에는 파라미터가 없는 상태이므로 default값이 출력
	 -->
	<h4>default 속성</h4>
	<c:out value="${param.name }" default="이름없음" />
	<!-- value속성이 null일 경우에만 default값이 출력되고
	빈값인 경우에는 출력되지 않음 -->
	<c:out value="" default="빈 문자열도 값입니다." />
</body>
</html>