<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체 - application</title>
</head>
<body>
	<h2>web.xml에 설정한 내용 읽어오기</h2>ㅌ
	<!-- 
	web.xml에 <context-param>으로 설정한 값을 내장객체를 통해
	읽어오기 가능
	 -->
	초기화 매개변수 : <%=application.getInitParameter("INIT_PARAM") %>
	
	<!-- 
	이클리스에서는 우리가 직접 작성항 파일을 실행하지않고 .metadata
	디렉토리 하위의 프로젝트와 동일한 톰캣 환경을 구성하여 복사본 파일을 실행
	( 물리적 경로는 .metadata 하위의 경로가 출력 )
	 -->
	<h2>서버의 물리적 경로 얻어오기</h2>
	application 내장 객체 : <%=application.getRealPath("/02ImplicitObject") %>
	
	<h2>선언부에서 application 내장 객체 사용하기</h2>
	<%!
	/* 
	선언부에서 내장객체를 바로 사용하는 것은 불가
	내장 객체는 _jspService() 메소드 내에서 생성된 지역변수이므로
	더 넓은 지역인 선언부에서 사용하려면 매개변수로 전달 받아야 가능
	*/
	public String useImplicitObject(){
		/* 
		방법1] getServletContext() 메소드를 통해 선언부에서 application
			내장객체를 획득 가능
		*/
		return this.getServletContext().getRealPath("/02ImplicitObject");
	}
	public String useImplicitobject(ServletContext app){
		/* 
		방법2] 스트립트렛에서 메소드를 호출할 때 application 내장객체를
		매개변수로 전달해서 사용
		*/
		return app.getRealPath("/02ImplicitObject");
	}
	%>
	<ul>
		<li>this 사용 : <%=useImplicitObject() %></li>
		<li>내장 객체를 인수로 전달 : <%=useImplicitobject(application) %></li>
	</ul>
</body>
</html>