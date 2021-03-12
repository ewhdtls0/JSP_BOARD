<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>BOARD</title>
		<link rel="stylesheet" type="text/css" href="css/main.css">
	</head>
<body>
	<div id="frame">
		<div id="header">
			&nbsp;&nbsp;&nbsp;
			<a href=""><img src="img/homelogo.png" width="5%" height="30px"></a>
			<span class="menu"><a href="">게시판</a></span>
			<span class="menu"><a href="">마이페이지</a></span>
			<span id="isLogin" class="menu">
				<c:if test="${sessionID != null }">
					<span style="color: red">${sessionID }</span> 님 환영합니다
				</c:if>
				<button id="logoutBtn" onClick="logout.do">로그아웃</button>
				&nbsp;&nbsp;&nbsp;
			</span>
		</div>
		<div id="bodyFrame">
			<div id="body">
				<table>
					<tr>
						<td></td>
					
					</tr>
				
				</table>
			</div>
		</div>
	</div>
</body>
</html>