<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/createGroup.css">
<title>グループ作成</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="content">
        <div id="createGroup" >
            <form method ="post" action="Group">
                <h4>グループ名</h4>
                <input class="groupName" type="text" name="groupName">
                <input class="button" type="submit" value="create" name ="group">
            </form>
        </div>
    </div>
	<%@ include file="footer.jsp"%>
</body>
</html>