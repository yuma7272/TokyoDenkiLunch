<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/top.css">
<title>電大お昼システム</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<div class="top-empty"></div>
	<div class="topBody">
</div>
 <div class="body">

	<div id="filter-head">
		<h3>お昼情報</h3>
	</div>
	<div class = "advice">
		<div class="advice-img" width ="64" height="64">
		<img src="<%= session.getAttribute("weatherIcon") %>" alt="天気アイコン" align="middle" width = "64" height ="64">
		</div>
		<div class= "advice-text">
			<%= session.getAttribute("advice") %>
		</div>
	</div>
	
	<div id="filter-head">
		<h3>店舗を探す</h3>
	</div>
	
	<div class="filter-wrapper">
		<div class="exit">
			<form method="POST" action="ShopSearchController" class="searchForExit">
			<button class="exitButton eastButton" type="checkbox" name="exit" value="east">東口側の店舗</button>
			<button class="exitButton westButton" type="checkbox" name="exit" value="west">西口側の店舗</button>
			</form>
		</div>
	</div>
	<div class="price">
		<h5>ジャンルから検索</h5>
		<form method="POST" action="ShopSearchController" class="search">
			<input class = "searchText" type="text" name="keyword" value=""><input class = "searchImage" type="image" src="images/icon/magnify.png">
		</form>
	</div>
	
 </div>
	<%@ include file="footer.jsp" %>
</body>
</html>