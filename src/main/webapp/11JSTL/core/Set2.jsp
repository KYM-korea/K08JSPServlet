<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="common.Person"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - set 2</title>
</head>
<body>
	<h4>List 컬렉션 이용하기</h4>
	<%
	//Person객체를 저장할 수 있는 List계열의 컬렉션 생성
	ArrayList<Person> pList = new ArrayList<Person>();
	//List컬렉션에 객체를 추가
	pList.add(new Person("성삼문",55));
	pList.add(new Person("박팽년",60));
	%>
	<!-- List컬렉션을 request영역에 저장 -->
	<c:set var="personList" value="<%=pList %>" scope="request"/>
	<!--
	2개의 객체 중 0번 인덱스를 출력
	List이므로 인덱스로 접근 가능
	foreach 태그를 사용하면 2개의 객체 전부를 반복해서 출력 가능	
	 -->
	<ul>
		<li>이름 : ${requetsScope.personList[0].name }</li>
		<li>나이 : ${personList[0].age }</li>
	</ul>
	
	<h4>Map 컬렉션 이용하기</h4>
	<%
	/* 
	Map의 key는 String타입, Value는 Person타입으로 정의한 후
	2개의 Person객체를 저장
	*/
	Map<String, Person> pMap = new HashMap<String, Person>();
	pMap.put("personArgs1", new Person("하위지", 65));
	pMap.put("personArgs2", new Person("이개", 67));
	%>
	<!-- request영역에 Map 컬렉션을 저장 -->
	<c:set var="personMap" value="<%=pMap %>" scope="request" />
	<!-- Map컬렉션이므로 key를 통해 접근하여 출력 -->
	<ul>
		<li>아이디 : ${requestScope.personMap.personArgs2.name }</li>
		<li>비번 : ${personMap.personArgs2.age }</li>
	</ul>
</body>
</html>