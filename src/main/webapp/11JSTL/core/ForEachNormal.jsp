<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - forEach 1</title>
</head>
<body>
<!-- 
forEach태그의 일반 for문 형태
	속성] begin : 반복문의 시작값
		  end : 종료값
		  step : 증가치 ( 제외할 경우 1로 고정 )
		  var : 반복시 사용할 변수
 -->
	<h4>일반 for문 형태의 forEach 태그</h4>
	<!-- 총 3회 반복 -->
	<c:forEach begin="1" end="3" step="1" var="i">
		<p>반복 ${ i }입니다</p>
	</c:forEach>
	
	<h4>varStatus 속성 살펴보기</h4>
	<table border="1">
	<!-- 
	일반 for문에서의 varStatus속성
		: 반복과 관련된 정보를 추상화한 클래스를 통해 정보를 반환
		count : 실제 반복 횟수를 반환 ( 1부터 시작 )
		index : 변수 i의 변화하는 값을 반환
		first : 루프의 처음일 때 true 반환
		last  : 루프의 마지막일 때 true 반환
		current : 현재 loop의 변수값을 반환 ( var속성에 지정된 변수 )
		※ 즉 일반 for문에서는 index와 current는 동일한 값을 출력
	 -->
	<c:forEach begin="3" end="5" var="i" varStatus="loop">
		<tr>
			<td>count : ${ loop.count }</td> 
			<td>index : ${ loop.index }</td> 
			<td>current : ${ loop.current }</td> 
			<td>first : ${ loop.first }</td> 
			<td>last : ${ loop.last }</td>
		</tr> 
	</c:forEach>
	</table>
	
	<h4>1에서 100까지 정수 중 홀수의 합</h4>
	<c:forEach begin="1" end="100" var="j">
		<!-- if(j%2!=0)와 같은 조건  -->
		<c:if test="${ j mod 2 ne 0 }">
			<c:set var="sum" value="${ sum + j }" />
		</c:if>
	</c:forEach>
	1~100사이의 정수 중 홀수의 합은? ${ sum }
	
	<!-- 
	연습문제] 아래 모양을 출력하시오. 단 JSTL의 forEach문과 if문을 
	활용하시오.
	1 0 0 0 0
	0 1 0 0 0
	0 0 1 0 0
	0 0 0 1 0
	0 0 0 0 1
	-->
	<h4>연습문제01</h4>
	<c:forEach begin="1" end="5" step="1" var="i">
		<c:forEach begin="1" end="5" var="j">
			<c:if test="${ i eq j }" var="result">
				1&nbsp;
			</c:if>
			<c:if test="${ not result }">
				0&nbsp;
			</c:if>
		</c:forEach>
		<br />
	</c:forEach>
	
	<h4>연습문제02</h4>
	<!-- 앞의 문제를 choose-when-otherwise문으로 변경 -->
	<c:forEach begin="1" end="5" step="1" var="i">
		<c:forEach begin="1" end="5" var="j">
			<c:choose>
				<c:when test="${ i eq j }">
					1&nbsp;
				</c:when>
				<c:otherwise>
					0&nbsp;
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<br />
	</c:forEach>
</body>
</html>