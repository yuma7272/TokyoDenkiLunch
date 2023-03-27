<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="model.Student"%>
<%@ page import="model.Group"%>
<%@ page import="model.GroupManager"%>
<%@ page import="model.StudentManager"%>
<% Student student = (Student)session.getAttribute("student"); %>
<% int groupID = student.getGroupID(); %>
<% StudentManager studentManager = new StudentManager(); %>
<% GroupManager groupManager = new GroupManager(); %>
<% Group group = groupManager.getGroup(groupID); %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>マイページ</title>
</head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/others.css">
<body>
<%@ include file="header.jsp" %>
	<div class="content">
		<div id = "mypage" >
	        <div class = "profile">
		        <h2>登録情報</h2>
		        <div class = "status">
			        <div class = "statusElement">
			        <h3>ユーザー名：</h3>
			        <p><%= student.getUserName() %></p>
			        </div>
			        <div class = "statusElement">
			        <h3>学年：</h3>
			        <p><%= student.getGrade() %>年</p>
			        </div>
			        <div class = "statusElement">
			        <h3>学科：</h3>
			        <p><%= student.getSubject() %>科</p>
			        </div>
			        
			        <div class = "statusElement">
			       　 <h3>所属グループ：</h3>
			        <%if(groupID == 0){ %>
			        <p>未所属</p>
			        <%}else{%>
			         <p><%= group.getName() %></p>
			         <%}%>
			        </div>
		        </div>
	        </div>
	        
	        <div class = "contact">
	        	<h2>お問い合わせ</h2>
	        	<div class = "status">
	        		<h3>20fi999@ms.dendai.ac.jp</h3>
	        	</div>
	        </div>
		</div>
    </div>
<%@ include file="footer.jsp" %>
</body>
</html>