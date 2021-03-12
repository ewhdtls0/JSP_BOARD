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
			<span class="menu"><a href="">�Խ���</a></span>
			<span class="menu"><a href="">����������</a></span>
			<span id="isLogin" class="menu">
				<c:if test="${sessionID != null }">
					<span style="color: red">${sessionID }</span> �� ȯ���մϴ�
				</c:if>
				<button id="logoutBtn" onClick="logout.do">�α׾ƿ�</button>
				&nbsp;&nbsp;&nbsp;
			</span>
		</div>
		<div id="bodyFrame">
			<div id="body">
				<table style="text-align: center; width: 100%">
					<tr>
						<td class="boardNumber">��ȣ</td>
						<td class="boardTitle">����</td>
						<td class="boardWriter">�ۼ���</td>
					</tr>
					<tr>
						<td class="boardNumber">1</td>
						<td class="boardTitle">TEST</td>
						<td class="boardWriter">test</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>