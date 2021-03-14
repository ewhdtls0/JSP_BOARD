<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="com.exam.dto.bbsDTO" %>
<%@page import="com.exam.dao.bbsDAO" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>BOARD</title>
		<link rel="stylesheet" type="text/css" href="css/main.css">
	</head>
<body>
<%
	bbsDAO bDAO = bbsDAO.getInstance();
	List<bbsDTO> list = bDAO.selectList();
%>
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
				<a href="logout.do"><button id="logoutBtn">�α׾ƿ�</button></a>
				&nbsp;&nbsp;&nbsp;
			</span>
		</div>
		<div id="bodyFrame">
			<div id="body">
				<table id="table" >
					<tr id="boardHeader">
						<td class="boardNumber">��ȣ</td>
						<td class="boardTitle">����</td>
						<td class="boardWriter">�ۼ���</td>
					</tr>
					<tr>
						<td class="boardNumber">1</td>
						<td class="boardTitle"><a href="" class="tableAtag">TEST</a></td>
						<td class="boardWriter">test</td>
					</tr>
				</table>
				<br>
				<a href="write.do"><button id="writeBtn">�Խñ� �ۼ�</button></a>
			</div>
		</div>
	</div>
</body>
</html>