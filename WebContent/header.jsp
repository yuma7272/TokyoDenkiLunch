<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Student"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"  type="text/css" href="css/common.css">
<title>Insert title here</title>
</head>
<body>
	<div class="header-empty">
    </div>
    <div class="header">
        
        <div class="title topIcon leftArea">
             <a href="TopController" style="text-decoration:none;"><img src="images/icon/TokyoDenkiLunchロゴ.png" width="" height="" alt=""></a>
        </div>
        <% if(session.getAttribute("login") != null){ %>
        <div class = "rightArea">
	        <div class="login-button-area">
	             <form method="post" name="logoutForm" action="Login"> 
					<input type="hidden" name="login" value="logout"> 
				 </form>
				<% Student loginUser = (Student)session.getAttribute("student"); %>
	            <p class = "username"><%= loginUser.getUserName()%> さん</p>
	            <a class="button" href="javascript:logoutForm.submit()">ログアウト</a>
	        </div>
	        <% } 
	        else{ %>
	        <div class="login-button-area">
	             <form method="post" name="loginForm" action="Login"> 
					<input type="hidden" name="login" value="loginPage"> 
				 </form>
				 
				 <p class = "username"></p>
	            <a class="button" href="javascript:loginForm.submit()">ログイン</a>
	        </div>
	        <% } %>
        </div>
    </div>
</body>

</html>