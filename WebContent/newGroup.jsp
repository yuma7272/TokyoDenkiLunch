<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/newGroup.css">
<title>新規グループ作成</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="content">
		<div id="newGroup">
			<a class="button" href="createGroup.jsp">新規作成</a> 
			
			<form method="post" name="joinGroupForm" action="Group"> 
			<input type="hidden" name="group" value="select"> 
		    </form>

			<a class="button" href="javascript:joinGroupForm.submit()">参加する</a>
		</div>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>