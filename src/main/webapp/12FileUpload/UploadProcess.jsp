<%@page import="fileupload.MyfileDAO"%>
<%@page import="fileupload.MyfileDTO"%>
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

try{
	/*
	앞에서 준비한 3개의 인수와 request 내장객체까지를 이용해서 MultipartRequest객체를 생성
	객체가 정상적으로 생성되면 파일 업로드 완료
	*/
	MultipartRequest mr = new MultipartRequest(request, saveDirectory,
			maxPostSize, encoding);
	
	//mr객체를 통해 서버에 저장된 파일명을 획득
	String fileName = mr.getFilesystemName("attachedFile");
	/*
	파일명에서 확장자 앞에 .(닷)을 찾아 인덱스를 확인한 후 확장자를 잘라냄
	( 확장자는 파일의 용도를 나타내는 부분이므로 중요 )
	
	파일명에 .(닷)을 여러개 사용할 수 있으므로 끝에서부터 서치
	*/
	String ext = fileName.substring(fileName.lastIndexOf("."));
	// 현재 날짜와 시간 및 밀리세컨즈까지 이용해서 파일명으로 사용할 문자열 생성
	String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
	// 확장자와 파일명을 합쳐서 서버에 저장할 파일명을 생성
	String newFileName = now + ext;
	
	/*
	서버에 저장된 파일의 파일명을 새로운 파일명으로 변경
	여기서 사용도니 separaor는 경로를 표시할 경우 사용하는 구분기호로
	윈도우의 경우 \(역슬래쉬), 리눅스의 경우 /(슬러쉬)를 자동으로 부여
	File객체를 각각 생성한 후 renameTo()메소드를 통해 변경
	*/
	File oldFile = new File(saveDirectory + File.separator + fileName);
	File newFile = new File(saveDirectory + File.separator + newFileName);
	oldFile.renameTo(newFile);
	
	/* 
	파일을 제외한 나머지 폼값을 수령
	( request내장객체를 통해서가 아닌 mr객체를 통해 받아야하므로 주의 필요
	객체는 다르지만 폼값을 받기위한 메소드명은 동일 )
	*/
	String name = mr.getParameter("name");
	String title = mr.getParameter("title");
	String[] cateArray = mr.getParameterValues("cate");
	StringBuffer cateBuf = new StringBuffer();
	
	if(cateArray == null){
		cateBuf.append("선택 없음");
	}else{
		/* 
		체크한 항목의 갯수만큼 반복하여 StringBuffer에 추가
		*/
		for(String s : cateArray){
			cateBuf.append(s + ", ");
		}
	}
	
	//DTO 생성 및 폼값 세팅
	MyfileDTO dto = new MyfileDTO();
	dto.setName(name);
	dto.setTitle(title);
	//입력전 StringBuffer객체를 String으로 변환
	dto.setCate(cateBuf.toString());
	dto.setOfile(fileName);
	dto.setSfile(newFileName);

	//DAO를 통해 데이터베이스에 입력
	MyfileDAO dao = new MyfileDAO();
	dao.insertFile(dto);
	//자원 반납(커넥션풀에 Connection객체를 반납)
	dao.close();
	
	//파일업로드에 성공한 경우 파일 목록으로 이동
	response.sendRedirect("FileList.jsp");
	
}catch(Exception e){
	/*
	파일업로드에 실패한 경우에는 request영역에 에러메세지를 저장한 후
	업로드 폼으로 포워드
	*/
	e.printStackTrace();
	request.setAttribute("errorMessage", "파일 업로드 오류");
	request.getRequestDispatcher("FileUploadMain.jsp").forward(request, response);
}
%>