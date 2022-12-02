<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- HTML주석
보통의 경우 Include되는 JSP파일은 HTML태그 없이 순수한 JSP코드만
작성하는 것을 권장
-->
<%-- JSP주석
포함되는 페이지를 작성 때에도 반드시 page지시어는 존재
page 지시어가 없는 JSP파일은 오류 발생
--%>
<%
/* Java주석 */
LocalDate today = LocalDate.now(); //오늘날짜
LocalDateTime tomorrow = LocalDateTime.now().plusDays(1); //내일 날짜
%>