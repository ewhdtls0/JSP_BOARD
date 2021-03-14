<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<span class="menu"><a href="">게시판</a></span>
			<span class="menu"><a href="">마이페이지</a></span>
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
				<table id="table" >
					<tr id="boardHeader">
						<td class="boardNumber">번호</td>
						<td class="boardTitle">제목</td>
						<td class="boardWriter">작성자</td>
					</tr>
					<%
						int count = 0;
						for(bbsDTO b : list)
						{ %>
							<tr>
								<td class="boardNumber"><%= b.getBbsId() %></td>
								<td class="boardTitle"><a href="" class="tableAtag"><%= b.getTitle() %></a></td>
								<td class="boardWriter"><%= b.getWriter() %></td>
							</tr>
							<%
								count++;
						}
						if (count == 0) {
							%>
								<tr><td>게시물이 없습니다.</td></tr>
							<%
						}
					%>
				</table>
				<br>
				<a href="write.do"><button id="writeBtn">게시글 작성</button></a>
			</div>
		</div>
	</div>
</body>
</html>