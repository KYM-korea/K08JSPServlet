<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="common.Person"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현 언어(EL) - 컬렉션</title>
</head>
<body>
	<h2>List 컬렉션</h2>
	
	<%
	//List컬렉션을 Objectt 기반으로 생성
	List<Object> aList = new ArrayList<Object>();
	//아래와 같이 타입 매개변수를 생략해도 Object 기반의 컬렉션으로 정의
	//List aList2 = new ArrayList();
	
	//String객체 추가
	aList.add("청해진");
	//Person 객체 추가
	aList.add(new Person("장보고",28));
	/* EL은 영역에서 저장된 값을 대상으로 하므로 page영역에 속성을 저장 */
	pageContext.setAttribute("Ocean", aList);
	%>
	
	<ul>
		<!-- String객체가 출력
		ArrayList는 배열의 특성을 가지고 있으므로 인덱스 접근 가능 -->
		<li>0번째 요소 : ${Ocean[0] }</li>
		<!-- Person객체가 출력
		멤버변수명을 통해 getter()를 호출하여 출력
		만약 Person클래스에 getter()가 정의되지 않으면 PropertyNotFoundException 발생 -->
		<li>1번째 요소 : ${Ocean[1].name }, ${Ocean[1].age }</li>
		<!-- null값이므로 아무것도 출력되지 않음 -->
		<li>2번째 요소 : ${Ocean[2] }</li>
	</ul>
	
	<h2>Map 컬렉션</h2>
	<%
	Map<String, String> map = new HashMap<String, String>();
	//한글을 key로 설정하여 값을 지정
	map.put("한글", "훈민정음");
	//영문을 key로 사용
	map.put("Eng", "English");
	//페이지 영역에 저장
	pageContext.setAttribute("King", map);
	%>
	<ul>
		<!-- key값이 영문인 경우 아래 3가지 방법 모두 사용 가능
		but 한글인 경우 .(닷)으로 출력 불가 -->
		<li>영문 Key : ${King["Eng"] }, ${King['Eng'] }, ${King.Eng }</li>
		<li>한글 Key : ${King["한글"] }, ${King['한글'] }, \${King.한글 }</li>
		<!-- EL식 앞에 \(역슬러쉬)를 붙이면 주석으로 변환
		코드가 숨겨지는 것은 아니고 코드가 그대로 화면에 출력 -->
	</ul>
</body>
</html>