<%@page import="model1.board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
// DB연결 및 CRUD작업을 위한 DAO객체를 생성
BoardDAO dao = new BoardDAO(application);

/*
검색어가 있는 경우 클라이언트가 선택한 필드명과 검색어를 저장할
Map컬렉션을 생성
*/
Map<String, Object> param = new HashMap<String,Object>();
/*
검색폼에서 입력한 검색어와 필드명을 파라미터로 획득
해당 <form>의 전송방식은 get, action속성은 없는 상태이므로
현재 페이지로 폼값이 전송
*/
String searchField = request.getParameter("searchField");
String searchWord= request.getParameter("searchWord");
//사용자가 입력한 검색어가 존재할 경우
if(searchWord!=null){
	/*
	Map컬렉션에 컬럼명과 검색어를 추가
	*/
	param.put("searchField", searchField);
	param.put("searchWord", searchWord);
}
//Map컬렉션을 인수로 게시물의 개수를 카운트
int totalCount = dao.selectCount(param);
//목록에 출력할 게시물을 추출하여 반환 받기
List<BoardDTO> boardLists = dao.selectList(param);
//자원 해제
dao.close();
%>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>
<body>
	<!-- 공통링크 -->
    <jsp:include page="../Common/Link.jsp" />  

    <h2>목록 보기(List)</h2>
    <!-- 검색폼 -->
    <form method="get">  
    <table border="1" width="90%">
    <tr>
        <td align="center">
            <select name="searchField"> 
                <option value="title">제목</option> 
                <option value="content">내용</option>
            </select>
            <input type="text" name="searchWord" />
            <input type="submit" value="검색하기" />
        </td>
    </tr>   
    </table>
    </form>
    <!-- 게시물 목록 테이블(표) -->
    <table border="1" width="90%">
    	<!-- 각 컬럼의 이름 -->
        <tr>
            <th width="10%">번호</th>
            <th width="50%">제목</th>
            <th width="15%">작성자</th>
            <th width="10%">조회수</th>
            <th width="15%">작성일</th>
        </tr>
<%
/* 컬렉션이 입력된 데이터가 없는지 확인 */
if (boardLists.isEmpty()) {
%>
        <tr>
            <td colspan="5" align="center">
                등록된 게시물이 없습니다^^*
            </td>
        </tr>
<%
}
else {
	//출력할 게시물이 있는 경우에는 확장 for문으로 List컬렉션에
	//저장된 데이터의 갯수만큼 반복하여 출력
    int virtualNum = 0; 
    for (BoardDTO dto : boardLists)
    {
    	//현재 출력할 게시물의 갯수에 따라 출력번호는 달라지므로
    	//totalCount를 사용하여 가성번호를 부여
        virtualNum = totalCount--;   
%>
        <tr align="center">
        	<!-- 게시물의 가상번호 -->
            <td><%= virtualNum %></td>
            <!-- 제목 -->  
            <td align="left"> 
                <a href="View.jsp?num=<%= dto.getNum() %>"><%= dto.getTitle() %></a> 
            </td>
            <!-- 작성자 아이디 -->
            <td align="center"><%= dto.getId() %></td>
            <!-- 조회수 -->           
            <td align="center"><%= dto.getVisitcount() %></td>
            <!-- 작성일 -->   
            <td align="center"><%= dto.getPostdate() %></td>    
        </tr>
<%
    }
}
%>
    </table>
   
    <table border="1" width="90%">
        <tr align="right">
            <td><button type="button" onclick="location.href='Write.jsp';">글쓰기
                </button></td>
        </tr>
    </table>
</body>
</html>