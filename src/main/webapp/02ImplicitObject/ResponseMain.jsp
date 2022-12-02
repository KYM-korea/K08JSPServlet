<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체 - response</title>
</head>
<body>
	<h2>1. 로그인 폼</h2>
    <%
    // get방식으로 전달된 loginErr파라미터가 있는 경우 '로그인실패' 출력
    String loginErr = request.getParameter("loginErr");
    // 첫 실행시에는 파라미터가 없는 상태이므로 메세지는 출력되지 않음
    if (loginErr != null) out.print("로그인 실패");
    %>
    <!-- 
    	로그인을 위해 post방식으로 폼값을 전송
    	get방식으로 전송하면 로그인 정보가 쿼리스트링으로 주소줄에 남기 때문에
    	개인정보유출의 위험이 존재
    	로그인 정보와 같이 보안이 필요시 post를 사용
    -->
    <form action="./ResponseLogin.jsp" method="post">
        아이디 : <input type="text" name="user_id" /><br />
        패스워드 : <input type="text" name="user_pwd" /><br />
        <input type="submit" value="로그인" />
    </form>

    <h2>2. HTTP 응답 헤더 설정하기</h2>
    <form action="./ResponseHeader.jsp" method="get">
        날짜 형식 : <input type="text" name="add_date" value="2021-12-01 09:00" /><br />  
        숫자 형식 : <input type="text" name="add_int" value="8282" /><br />
        문자 형식 : <input type="text" name="add_str" value="홍길동" /><br />
        <input type="submit" value="응답 헤더 설정 & 출력" />
    </form>
	
</body>
</html>