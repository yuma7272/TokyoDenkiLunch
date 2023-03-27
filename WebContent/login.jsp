<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/login.css">
    <title>Login</title>
</head>

<body>
<%@ include file="header.jsp" %>
	<div class="content">
	        <div id="login">  	
        
            <form method="post" action="Login">
                <input type="hidden" name="login" value="signin"> 
                <div class="input-info">
                
                    <% if(session.getAttribute("loginMessage") != null){%>
						<%String loginMessage = (String) session.getAttribute("loginMessage"); %>
        				<h5><%= loginMessage%></h5>
        				<br>
       				 <%} %>
      				 <%session.setAttribute("loginMessage" , null);%>
        
                    <h5>ユーザー名</h5>
                    <!-- nameはサーブレットファイルに対応する変数と同じものを入れる -->
                    <input type="text" name="userName" required>
                    <h5>パスワード</h5>
                    <input type="password" name="password" required>
                </div>
                <div class="loginButton">
                    <input type="submit" value="ログイン" name="login" required>
                </div>
            </form>
            <div class="newRegister">
                <form method="post" name="signUpForm" action="Login"> 
				<input type="hidden" name="login" value="signup"> 
			    </form>
               <a class="button" href="javascript:signUpForm.submit()">新規登録</a>
            </div>
        </div>
    </div>
    
	<%@ include file="footer.jsp" %>
</body>

</html>