package utils;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
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
	
	/*
	앞의 2개의 메소드는 JSP에서 out내장객체를 받은 후 Javascript함수를 실행
	but, 서블릿에서는 JSP의 내장객체를 매개변수로 받을 수 없으므로 out내장객체 대신
	response내장객체를 통해 컨텐츠 타입을 설정한 후 JS코드를 실행
	 */
	public static void alertLocation(HttpServletResponse resp, String msg, String url) {
		try {
			//컨텐츠 타입을 설정
			resp.setContentType("text/html;charset=UTF-8");
			//PrintWriter 객체를 통해 스크립트를 서블렛에서 직접 출력
			PrintWriter writer = resp.getWriter();

			String script = ""
					+ "<script>"
					+ "	alert('"+msg+"');"
					+ "	location.href='"+url+"';"
					+ "</script>";
			writer.println(script);
		}catch(Exception e) {}
	}
	
	public static void alertBack(HttpServletResponse resp, String msg) {
		try {
			resp.setContentType("text/html;charset=UTF-8");
			PrintWriter writer = resp.getWriter();
			String script = ""
					+ "<script>"
					+ "	alert('"+msg+"');"
					+ "	history.back();"
					+ "</script>";
			writer.println(script);
		}catch(Exception e) {}
	}
}