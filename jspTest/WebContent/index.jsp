<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
    <head>
        <title>JSP BOARD</title>
        <link rel="stylesheet" type="text/css" href="css/index.css">
    </head>
    <body>
        <c:if test="${loginResult == -1 || loginResult == 0 }">
    		<script>
    			alert("아이디 혹은 비밀번호가 틀렸습니다.");
    		</script>
    	</c:if>
        <div id="frame">
            <div id="loginBox">
                <h1>로그인</h1>
                <form action="login.do" method="post">
                    <div id="id_wrap">
                        <table>
                            <tr>
                                <td><label class="labels">ID</label></td>
                                <td><input name="id" type="text" class="inputs" placeholder="ID"></td>
                            </tr>
                            <tr>
                                <td><label class="labels">PW</label></td>
                                <td><input name="pw" type="password" class="inputs" placeholder="*****"></td>
                            </tr>
                        </table>
                    </div>
                    <div><button type="submit" id="loginBtn">로그인</button></div>
                </form>
                <div style="margin-bottom: 10%;"><a href="join.do" id="signUp">회원가입</a></div>
                
            </div>
        </div>
    </body>
</html>