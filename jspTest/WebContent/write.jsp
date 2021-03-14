<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>게시글 작성</title>
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
				<form action="write.do" method="post">
					<div id="writeForm">
						<div id="titleLabel"><label>제목</label></div>
						<input id="title" style="width: 100%" type="text" name="title">
						<div id="contentLabel"><label>내용</label></div>
						<textarea id="content" name="content" style="width: 100%; height: 300px; resize: none; overflow: hidden;" cols="50" rows="10"></textarea>
						<span><button id="writeBtn" type="submit" class="btns">작성</button></span>
						<span><a href="login.do"><button id="cancleBtn" type="button" class="btns">취소</button></a></span>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>