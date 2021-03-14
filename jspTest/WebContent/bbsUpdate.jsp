<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.exam.dto.bbsDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.exam.dao.bbsDAO"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>${bbsView.title}</title>
		<link rel="stylesheet" type="text/css" href="css/write.css">
	</head>
<body>
	<div id="frame">
		<div id="header">
			&nbsp;&nbsp;&nbsp;
			<a href="main.jsp"><img src="img/homelogo.png" width="5%" height="30px"></a>
			<span class="menu"><a href="main.jsp">게시판</a></span>
			<span id="isLogin" class="menu">
				<c:if test="${sessionID != null }">
					<span style="color: red">${sessionID }</span> 님 환영합니다
				</c:if>
				<a href="logout.do"><button id="logoutBtn">로그아웃</button></a>
				&nbsp;&nbsp;&nbsp;
			</span>
		</div>
		<div id="bodyFrame">
			<div id="body">
				<form action="bbsUpdate.do" method="post">
					<div id="writeForm">
						<input style="display: none" name="bbsId" value="${bbsUpdate.bbsId }">
						<div id="titleLabel"><label>제목</label></div>
						<input id="title" name="title" style="width: 100%" value="${bbsUpdate.title }">
						<div id="contentLabel"><label>내용</label></div>
						<textarea id="content"  name="content" style="width: 100%; height: 300px; resize: none; overflow: hidden;">${bbsUpdate.content}</textarea>
						<span><a href="main.jsp"><button id="cancleBtn" type="button" class="btns">목록</button></a></span>
						<span><button id="updateBtn" type="submit" class="btns">수정</button></span>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>