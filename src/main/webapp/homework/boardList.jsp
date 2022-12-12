<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="homework.BoardDAO"%>
<%@page import="homework.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	<%
	BoardDAO dao = new BoardDAO(application);
	
	Map<String, Object> param = new HashMap<String, Object>();
	
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	
	if(searchWord != null){
		param.put("searchField", searchField);
		param.put("searchWord", searchWord);
	}
	
	int totalCount = dao.selectCount(param);
	List<BoardDTO> BoardList = dao.selectList(param);
	dao.close();
	%>        
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-12">
            <jsp:include page="include/top.jsp" />
        </div>
    </div>
    <div class="row">
        <div class="col-3">
            <jsp:include page="include/left.jsp" />
        </div>
        <div class="col-9 pt-3">
            <h3>게시판 목록 - <small>자유게시판</small></h3>

            <div class="row ">
                <!-- 검색부분 -->
                <form>
                    <div class="input-group ms-auto" style="width: 400px;">
                        <select name="keyField" class="form-control">
                            <option value="">제목</option>
                            <option value="">작성자</option>
                            <option value="">내용</option>
                        </select>
                        <input type="text" name="keyString" class="form-control" style="width: 150px;"/>
                        <div class="input-group-btn">
                            <button type="submit" class="btn btn-secondary">
                                <i class="bi bi-search" style='font-size:20px'></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="row mt-3 mx-1">
                <!-- 게시판리스트부분 -->
                <table class="table table-bordered table-hover table-striped">
                    <colgroup>
                        <col width="60px" />
                        <col width="*" />
                        <col width="120px" />
                        <col width="120px" />
                        <col width="80px" />
                        <col width="60px" />
                    </colgroup>
                    <thead>
                        <tr style="background-color: rgb(133, 133, 133); " class="text-center text-white">
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>조회수</th>
                            <th>첨부</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        if(BoardList.isEmpty()){
                       	%>
                       		<tr>
                       			<td colspan="5" align="center">
                					등록된 게시물이 없습니다^^*
                       			</td>
                       		</tr>
                       	<%
                        }else{
                        	int virtualNum = 0;
                        	
                        	for(BoardDTO dto : BoardList){
								virtualNum = totalCount--;                        		
                        %>
                        	<tr align="center">
					            <td><%= virtualNum %></td>
					            <td align="left"> 
					                <a href="boardView.jsp?num=<%= dto.getNum() %>"><%= dto.getTitle() %></a> 
					            </td>
					            <td align="center"><%= dto.getId() %></td>
					            <td align="center"><%= dto.getVisitcount() %></td>
					            <td align="center"><%= dto.getPostdate() %></td>    
					        </tr>
                        <%
                        	}
                        }
                        %>
                    </tbody>
                </table>
                <div class="row">
                    <div class="col text-right mb-4">
                        <!-- 각종 버튼 부분 -->
                        <button type="button" class="btn">Basic</button>
                        <button type="button" class="btn btn-primary" onclick="location.href='boardWrite.jsp';">글쓰기</button>
                        <button type="button" class="btn btn-secondary">수정하기</button>
                        <button type="button" class="btn btn-success">삭제하기</button>
                        <button type="button" class="btn btn-info">답글쓰기</button>
                        <button type="button" class="btn btn-warning" onclick="location.href='boardList.jsp';">리스트보기</button>
                        <button type="button" class="btn btn-danger">전송하기</button>
                        <button type="button" class="btn btn-dark">Reset</button>
                        <button type="button" class="btn btn-light">Light</button>
                        <button type="button" class="btn btn-link">Link</button>
                    </div>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col">
                    <!-- 페이지번호 부분 -->
                    <ul class="pagination justify-content-center">
                        <li class="page-item">
                            <a href="#" class="page-link"><i class='bi bi-skip-backward-fill'></i></a>
                        </li>
                        <li class="page-item">
                            <a href="#" class="page-link"><i class='bi bi-skip-start-fill'></i></a>
                        </li>
                        <li class="page-item"><a href="#" class="page-link">1</a></li>
                        <li class="page-item active"><a href="#" class="page-link">2</a></li>
                        <li class="page-item"><a href="#" class="page-link">3</a></li>
                        <li class="page-item"><a href="#" class="page-link">4</a></li>
                        <li class="page-item"><a href="#" class="page-link">5</a></li>
                        <li class="page-item">
                            <a href="#" class="page-link"><i class='bi bi-skip-end-fill'></i></a>
                        </li>
                        <li class="page-item">
                            <a href="#" class="page-link"><i class='bi bi-skip-forward-fill'></i></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
    <div class="row mb-5 mt-3">
        <jsp:include page="include/bot.jsp" />
    </div>
</div>
</body>
</html>