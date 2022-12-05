package utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieManager {
	/*
	 쿠키생성 : 생성시 response내장객체가 필요하므로 매개변수를 통해 JSP에서 전달이 필수
	 ( 나머지 쿠키명, 쿠키값, 유효시간 설정을 위한 값 )
	 */
	public static void makeCookie(HttpServletResponse response, String cName,
			String cValue, int cTime) {
		// 쿠키를 생성자를 통해 생성
		Cookie cookie = new Cookie(cName, cValue);
		// 경로를 설정
		cookie.setPath("/");
		// 시간을 설정
		cookie.setMaxAge(cTime);
		// 응답헤더에 추가하여 클라이언트측으로 전송
		response.addCookie(cookie);
		/*
		클라이언트의 웹브라우저에는 하나의 쿠키가 저장
		 */
	}
	
	// 쿠키값 읽기 : request내장객체가 필요하므로 매개변수로 기술
	public static String readCooke(HttpServletRequest request, String cName) {
		String cookieValue = "";
		//생성된 쿠키를 배열로 획득
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			//읽어온 쿠키의 개수만큼 반복
			for(Cookie c : cookies) {
				//쿠키명을 획득
				String cookieName = c.getName();
				//내가 찾는 쿠키명이 있는지 확인
				if(cookieName.equals(cName)) {
					//쿠키명이 일치하면 쿠키값을 읽어 저장
					cookieValue = c.getValue();
				}
			}
		}
		return cookieValue;
	}
	/*
	쿠키삭제 : 쿠키는 삭제를 위한 별도의 메소드가 없음
		빈값과 유지시간을 0으로 설정하면 바로 삭제
		( 앞에서 정의한 makeCookie() 메소드를 재활용 )
	 */
	public static void deleteCookie(HttpServletResponse response, String cName) {
		makeCookie(response, cName, "", 0);
	}
}
