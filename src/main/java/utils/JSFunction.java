package utils;

import javax.servlet.jsp.JspWriter;

public class JSFunction {
	/*
	메소드 생성시 static을 통해 정적메소드로 정의되었으므로
	객체 생성없이 클래스명으로 즉시 메소드를 호출 가능
	 */
	public static void alertLocation(String msg, String url, JspWriter out) {
		/*
		JAva클래스에서 JSP의 내장객체를 사용 불가
		( 반드시 매개변수로 전달받아 사용해야함 )
		화면에 문자열을 출력하기 위해 out 내장객체를
		JspWriter타입으로 받은 후 사용
		 */
		try {
			//Javascript를 하나의 문자열로 정의
			String script = ""
					+ "<script>"
					+ "	alert('"+msg+"');"
					+ "	location.href='"+url+"';"
					+ "</script>";
			out.println(script);
		}catch(Exception e) {
			
		}
	}
	
	public static void alertBack(String msg, JspWriter out) {
		try {
			String script = ""
					+ "<script>"
					+ "	alert('"+msg+"');"
					+ "	history.back();"
					+ "</script>";
			out.println(script);
		}catch(Exception e) {
			
		}
	}
}
