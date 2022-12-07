<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
pageContext.setAttribute("pAttr", "김유신");
request.setAttribute("rAttr", "계백");
%>
<html>
<head>
<meta charset="UTF-8">
<title>액션 태그 - forward</title>
</head>
<body>
	<h3>sendRedirect를 통한 페이지 이동</h3>
	<!-- 
	페이지 이동의 경우 새로운 페이지에 대한 요청이 발생하게 되므로 완전히
	서로 다른 페이지를 의미
	( page영역, request영역 모두 공유하지 않음 )
	-->
	<%
		/* response.sendRedirect("ForwardSub.jsp"); */
	%>

	<!--
	포워드 된 페이지에서는 request영역이 공유
	주소표시줄에는 최초 요청한 페이지의 경로가 보여지지만, 사용자는 포워드된 페이지의 내용을 보게됨
	( 하나의 요청을 2개의 페이지가 공유하는 개념 )
	-->
	<h2>액션 태그를 이용한 포워딩</h2>
	<jsp:forward page = "ForwardSub.jsp" />
	<%
	/* 액션태그를 사용하면 JSP코드보다 훨씬 간결하게 코드를 표현 가능 */
	request.getRequestDispatcher("ForwardSub.jsp").forward(request, response);
	%>
</body>
</html>