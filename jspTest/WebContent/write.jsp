<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>�Խñ� �ۼ�</title>
		<link rel="stylesheet" type="text/css" href="css/write.css">
	</head>
<body>
	<div id="frame">
		<div id="header">
			&nbsp;&nbsp;&nbsp;
			<a href="main.jsp"><img src="img/homelogo.png" width="5%" height="30px"></a>
			<span class="menu"><a href="main.jsp">�Խ���</a></span>
			<span id="isLogin" class="menu">
				<c:if test="${sessionID != null }">
					<span style="color: red">${sessionID }</span> �� ȯ���մϴ�
				</c:if>
				<a href="logout.do"><button id="logoutBtn">�α׾ƿ�</button></a>
				&nbsp;&nbsp;&nbsp;
			</span>
		</div>
		<div id="bodyFrame">
			<div id="body">
				<form action="write.do" method="post">
					<div id="writeForm">
						<div id="titleLabel"><label>����</label></div>
						<input id="title" style="width: 100%" type="text" name="title">
						<div id="contentLabel"><label>����</label></div>
						<textarea id="content" name="content" style="width: 100%; height: 300px; resize: none; overflow: hidden;" cols="50" rows="10"></textarea>
						<span><button id="writeBtn" type="submit" class="btns">�ۼ�</button></span>
						<span><a href="login.do"><button id="cancleBtn" type="button" class="btns">���</button></a></span>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>