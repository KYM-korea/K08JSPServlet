<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="contents subNews">
                <ul id="newslist">
                <c:forEach items="${list}" var="li">
                    <li>
                        <h2>${li.create_dt}</h2>
                        <h3>${li.title}</h3>
                        <a href="/mobile/newsview.do?seq_no=${li.seq_no}"></a>
                    </li>
               	</c:forEach>
                </ul>
                	<a id="moreView">더보기</a>
            </div>
</body>
</html>