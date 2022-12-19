package fileupload;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

public class FileUtil {
	//파일 업로드 처리
	public static MultipartRequest uploadFile(HttpServletRequest req,
			String saveDirectory, int maxPostSize) {
		try {
			/*
			 MultipartRequest(request내장객체, 디렉토리의 물리적경로,
			 	업로드 제한용량, 인코딩 방식);
			 위와같은 형태로 객체를 생성함과 동시에 파일 업로드
			 
			 업로드를 성공시 객체의 참조값을 반환
			 실패시 디렉토리 경로나 파일용량 체크
			 */
			return new MultipartRequest(req, saveDirectory, maxPostSize, "UTF-8");
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static void download(HttpServletRequest req, HttpServletResponse resp,
			String directory, String sfileName, String ofileName) {
		String sDirectory = req.getServletContext().getRealPath(directory);
		try {
			File file = new File(sDirectory, sfileName);
		    InputStream inStream = new FileInputStream(file);
		    
		    //한글깨짐 방지
		    String client = req.getHeader("User-Agent");
		    if (client.indexOf("WOW64") == -1) {
		        ofileName = new String(ofileName.getBytes("UTF-8"), "ISO-8859-1");
		    }
		    else {
		        ofileName= new String(ofileName.getBytes("KSC5601"), "ISO-8859-1");
		    }
		    resp.reset();
		    resp.setContentType("application/octet-stream");
		    resp.setHeader("Content-Disposition", 
	                       "attachment; filename=\"" + ofileName + "\"");
		    resp.setHeader("Content-Length", "" + file.length() );
		       
		    OutputStream outStream = resp.getOutputStream();
		    
		    byte b[] = new byte[(int)file.length()];
		    int readBuffer = 0;    
		    while ( (readBuffer = inStream.read(b)) > 0 ) {
		        outStream.write(b, 0, readBuffer);
		    }
		    inStream.close(); 
		    outStream.close();
		}catch(FileNotFoundException e) {
			System.out.println("파일을 찾을 수 없습니다.");
			e.printStackTrace();
		}catch(Exception e) {
			System.out.println("예외 발생하였습니다.");
			e.printStackTrace();
		}
	}
	
	//파일 삭제를 위한 메소드 
	public static void deleteFile(HttpServletRequest req, String directory, String filename) {
		//물리적 경로와 파일명을 통해 File객체를 생성
		String sDirectory = req.getServletContext().getRealPath(directory);
		File file = new File(sDirectory+File.separator + filename);
		//해당 경로에 파일 존재 여부 판단
		if(file.exists()) {
			file.delete();
		}
	}
}