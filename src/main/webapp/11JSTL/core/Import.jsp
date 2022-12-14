<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL = import</title>
</head>
<body>
<!-- 
import태그
: 외부의 문서를 현재 문서에 포함
include 지시어 처럼 외부 문서를 컴파일하는 형식이 아니라
include 액션태그와 같은 기능으로 컴파일이 먼저 진행된 후 결과를 포함
서로 다른 페이지이므로 page영역은 공유하지 않으며, request영역만 공유
 
 url속성에 절대경로로 지정할 경우 컨텍스트 루트명은 포함하지 않음
 -->
	<!-- request영역에 변수를 생성 -->
	<c:set var="requestVar" value="MustHave" scope="request" />
	<!-- 
	var 속성을
		미사용시 : include 액션태그와 동일하게 현재 위치에 즉시
			외부문서를 포함
		사용시 : var에 지정한 변수를 EL로 출력하는 곳에 포함
			선언과 출력을 별도로 할 수 있으므로 코드의 가독성 증가
	 -->
	<c:import url="/11JSTL/inc/OtherPage.jsp" var="contents">
		<c:param name="user_param1" value="JSP" />
		<c:param name="user_param2" value="기본서" />
	</c:import>
	
	<!-- 
	import태그의 하위태그로 param을 사용 가능
	지정된 페이지로 파라미터 전달
	
	아래와 같이 이미지를 삽입할 경우 주로 상대경로를 사용하는 것을 권장
	if. 절대경로를 사용해야한다면 하드코딩을 하는 것 보다는 request 내장객체에서 제공하는
	메소드를 사용하는것을 권장
	
	웹프로그래밍은 웹서버에 배포하는 것이 목적이므로 서버의 환경이 달라지면
	경로도 수정되야하므로 이를 최소화 할 수 있도록 개발하는 것이 용이
	
	특히 JSTL에서 url 지정시 컨텍스트루트 경로는 명시하지 않아도 되므로
	일반적인 방식보다 작성에 유리한점이 존재
	 -->
	<div>
		<h4>이미지 삽입하기</h4>
		<h5>상대경로 지정</h5>
		<img src="../../images/Error.jpg" width="150px"/>
		<h5>절대경로 지정(경로명 하드코딩)</h5>
		<img src="/K08JSPServlet/images/Error.jpg" width="150px"/>
		<h5>절대경로 지정(request 내장객체 사용)</h5>
		<img src="<%=request.getContextPath() %>/images/Error.jpg" width="150px"/>
	</div>
	
	<!-- 앞에서 선언한 import 태그의 var속성의 변수를 통해 문서의 내용을 출력 -->
	<h4>다른 문서 삽입하기</h4>
	${contents }
	
	<!-- http로 시작하는 외부 URL도 import태그를 통해 삽입 가능 -->
	<h4>외부자원 삽입하기</h4>
	<iframe src="../inc/GoldPage.jsp" style="width:100%; height:600px;">
	</iframe>
</body>
</html>