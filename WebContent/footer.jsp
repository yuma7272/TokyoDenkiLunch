<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<title>Insert title here</title>
</head>
<body>
<!-- 	<div class="empty"></div> -->
	<div class="footer-empty"></div>
	<div class="menu">

		<a id = "searchLunch" class ="menu-item" href="ShopSearchController">
			<span class="material-symbols-outlined">search</span>店検索
		</a>


		<a id = "roomButton" class="menu-item" href="ClassRoomController"> 
			<span class="material-symbols-outlined">school</span>空き教室
		</a> 
		
		<form method="post" name="groupForm" action="Group"> 
			<input type="hidden" name="group" value="redirect"> 
		</form>
		
		<a id="groupButton" class ="menu-item" href="javascript:groupForm.submit()">
			<span class="material-symbols-outlined">groups_2</span>グループ
		</a>
		
		<a id="mypageButton" class="menu-item" href="MyPage"> 
			<span class="material-symbols-outlined">person</span>マイページ
		</a>

	</div>
</body>
	<script>
	const title = document.title;
	switch(title){
	 case "店検索画面":
		document.getElementById('searchLunch').style.color = "#e00";
		document.getElementById('searchLunch').style.opacity = "0.7";
		break;
	 case "空き教室一覧":
	 document.getElementById('roomButton').style.color = "#e00";
		document.getElementById('roomButton').style.opacity = "0.7";
		break;
	 case "グループ":
	 document.getElementById('groupButton').style.color = "#e00";
		document.getElementById('groupButton').style.opacity = "0.7";
		break;
	 case "マイページ":
		 document.getElementById('mypageButton').style.color = "#e00";
			document.getElementById('mypageButton').style.opacity = "0.7";
	break;
	}
	</script>
</html>