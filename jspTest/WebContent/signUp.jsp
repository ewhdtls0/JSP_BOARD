<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <title>JSP BOARD</title>
        <link rel="stylesheet" type="text/css" href="./css/index.css">
    </head>
    <body>
    <c:if test="${ joinResult == 0 }">
    	<script>
    		alert("아이디 중복");
    	</script>
    </c:if>
        <div id="frame">
            <div id="loginBox">
                <h1>회원가입</h1>
                <form action="join.do" method="post">
                    <div id="id_wrap">
                        <table>
                            <tr>
                                <td><label class="labels">ID</label></td>
                                <td><input id="id" type="text" name="id" class="inputs" placeholder="ID"></td>
                            </tr>
                            <tr>
                                <td><label class="labels">PW</label></td>
                                <td><input id="pw" type="password" name="pw" class="inputs" placeholder="*****"></td>
                            </tr>
                        </table>
                    </div>
                    <div><button type="submit" id="loginBtn">회원가입</button></div>
                </form>
                <div style="margin-bottom: 10%;"><a href="home.do" id="signUp">로그인</a></div>
                
            </div>
        </div>
    </body>
</html>