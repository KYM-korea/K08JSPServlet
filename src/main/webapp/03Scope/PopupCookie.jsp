<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
/*
	trimDirectiveWhitespaces : 지시어 속성 중 상단의 불필요한 공백을 삭제
		콜백데이터는 해당 페이지에 출력되는 모든 소스코드를 반환하게되는데,
		공백도 하나의 문자이므로 필요없는경우 제거하는 것을 권장
*/
//하루동안 열지않음 체크박스를 체크한 후 닫기 버튼을 누르면 값 1이 파라미터로 전달
String chkVal = request.getParameter("inactiveToday");

//파라미터의 값이 null이 아닌 동시에 1이라면 쿠키를 아래와 같이 생성
if(chkVal != null && chkVal.equals("1")){
	// 쿠키는 생성자를 통해서만 생성 가능
	// PopupClose라는 쿠키를 생성
	Cookie cookie = new Cookie("PopupClose", "off");
	// 쿠키가 사용될 경로를 지정
	cookie.setPath(request.getContextPath());
	// 쿠키의 유지시간 설정 ( 1일=> 86400 )
	cookie.setMaxAge(60*60*24);
	// 응답헤더에 쿠키를 실어서 클라이언트로 전송
	response.addCookie(cookie);
	// 콜백데이터를 출력
	out.println("쿠키 : 하루 동안 열지 않음");
}
%>