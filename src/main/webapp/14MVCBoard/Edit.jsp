<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 첨부형게시판</title>
<script type="text/javascript">
/*
패스워드 검증을 통해 수정페이지로 진입하므로 해당 페이지에서는
추가로 패스워드를 입력하지 않음
*/
function validateForm(form) {
    if (form.name.value == "") {
        alert("작성자를 입력하세요.");
        form.name.focus();
        return false;
    }
    if (form.title.value == "") {
        alert("제목을 입력하세요.");
        form.title.focus();
        return false;
    }
    if (form.content.value == "") {
        alert("내용을 입력하세요.");
        form.content.focus();
        return false;
    }
}
</script>
</head>
<body>
<h2>파일 첨부형 게시판 - 수정하기(Edit)</h2>
<!-- 글쓰기 페이지를 그대로 사용하되 action 부분 수정
수정시에도 파일첨부가 있을 수 있기에 enctype속성은 추가 -->
<form name="writeFrm" method="post" action="../mvcboard/edit.do"
	enctype="multipart/form-data" onsubmit="return validateForm(this);">
	<!-- 게시물 수정을 위한 일련번호 -->
	<input type="hid den" name="idx" value="${dto.idx }" />
	<!-- 기존의 원본파일명 -->
	<input type="hid den" name="prevOfile" value="${dto.ofile }" />
	<!-- 기존의 서버에 저장된 파일명 -->
	<input type="hi dden" name="prevSfile" value="${dto.sfile }" />
	<!-- 해당 hidden값은 게시물 수정시 첨부파일이 없는 경우 사용될 예정 -->
	
	검증된 패스워드 : ${pass }
    <table border="1" width="90%">
        <tr>
            <td>작성자</td>
            <td>
                <input type="text" name="name" style="width: 150px;" value="${dto.name }" />
            </td>
        </tr>
        <tr>
            <td>제목</td>
            <td>
                <input type="text" name="title" style="width: 90%;" value="${dto.title }" />
            </td>
        </tr>
        <tr>
            <td>내용</td>
            <td>
                <textarea name="content" style="width: 90%; height: 100px;">${dto.content }</textarea>
            </td>
        </tr>
        <tr>
            <td>첨부 파일</td>
            <td>
                <input type="file" name="ofile" />
            </td>
        </tr>
        <!-- 패스워드 부분은 삭제 -->
        <tr>
            <td colspan="2" align="center">
                <button type="submit">작성 완료</button>
                <button type="reset">RESET</button>
                <button type="button" onclick="location.href='../mvcboard/list.do';">
                    목록 보기</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
