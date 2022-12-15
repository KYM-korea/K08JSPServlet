<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
파일 업로드를 위한 디렉토리의 물리적 경로(절대 경로)를 획득
물리적 경로가 필요한 이유는 운영체제에 따라 경로를 표현하는
방식이 다르기 때문
*/
String saveDirectory = application.getRealPath("/Uploads");
//업로드할 파일의 최대용량 제한 (1mb로 지정)
int maxPostSize = 1024 * 1000;
//인코딩 방식 지정
String encoding = "UTF-8";
/* 
파일명이 중복되었을때 파일명에 자동으로 인덱스를 부여하는 파일명이 
중복되지 않게 해주는 기능을 제공
 ex) "겨울.jpg"가 이미 존재할 경우 "겨울1.jps"로 파일명을 변경하여 업로드
*/
FileRenamePolicy policy = new DefaultFileRenamePolicy();

try{
	/*
	위 객체 생성만으로 파일명이 중복되는 부분까지 모두 처리 가능
	but, 파일명이 한글인 경우 서버에서 인코딩 처리 등의 문제가 깨짐현상이
	발생할 수 있으므로 파일명은 영문과 숫자를 조합하여 사용을 권장
	*/
	MultipartRequest mr = new MultipartRequest(request, saveDirectory,
			maxPostSize, encoding, policy);
			
	
}catch(Exception e){
	e.printStackTrace();
}
%>