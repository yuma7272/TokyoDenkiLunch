<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="model.ShopInformation"%>
<%@ page import="model.ShopManager"%>
<%@ page import="java.util.ArrayList"%>


<%
ArrayList<ShopInformation> shopList = (ArrayList<ShopInformation>) session.getAttribute("shopList");
String keyword = (String)session.getAttribute("keyword");
if(keyword == null){
	keyword = "";
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/searchLunch.css">
<title class= "title">店検索画面</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="content">
		<div id="searchView">

			<div class="search">
				<div class="input">
					<form method="POST" action="ShopSearchController">
						<input class = "searchText" type="text" name="keyword" value="">
						<input class = "searchImage" type="image" src="images/icon/magnify.png">
					</form>
				</div>
				<div class="filter">
					<div id="open">絞り込み</div>
				</div>
			</div>

			<form method="POST" action="ShopSearchController">
			<div id="mask" class="hidden"></div>
			<section id="modal" class="hidden">
				<div id="filter-head">
					<h3>絞り込み</h3>
					<div id="close"><p>×</p></div>
				</div>
				
				<div class="filter-wrapper">
				<div class="price">
					<h5>ジャンル</h5>
					<input type="text" name="keyword">
				</div>
				<div class="price">
					<h5>値段</h5>
					<!-- <input type="text" name="price"> -->
					   <label>
						  <select name="price">
						  <option value="" selected disabled>--選択--</option>
						  <option value="500">～500円</option>
						  <option value="1000">501～1000円</option>
						  <option value="1500">1001～1500円</option>
						  <option value="2000">1501～2000円</option>
						  <option value="3000">2001～3000円</option>
						  <option value="4000">3001～4000円</option>
						  <option value="5000">4001～5000円</option>
						  </select>
						</label>
						
				</div>
				<div class="distance">
					<h5>距離</h5>
					<input type="radio" name="distance" value="1">エリア大 <input
						type="radio" name="distance" value="2">エリア中 <input
						type="radio" name="distance" value="3">エリア小
				</div>
				<div class="exit">
					<h5>駅出口</h5>
					<input type="checkbox" name="exit" value="east">東口 <input
						type="checkbox" name="exit" value="west">西口
				</div>
				<!-- <div id="filterButton">絞り込み</div> -->
				<button id="filterButton">絞り込み</button>
				</div>

			</section>
			</form>

			<div class="result">

				<h3>検索結果:<%= keyword %></h3>
				<%
				if(request.getAttribute("message") != null){
				%>
					<p>
						<%= request.getAttribute("message") %>
					</p>
				<%
				}
				for (int i = 0; i < shopList.size(); i++) {
				%>

				<div class="result-item">
					
					<a class ="parent" href="ShopSearchController?id=<%=i%>"><img alt="" src="<%=shopList.get(i).getShopLogoImage()%>"> <h3><%=shopList.get(i).getShopName()%></h3></a>
				
				</div>
						<%}%>
			</div>
		</div>
	</div>

			<%@ include file="footer.jsp"%>
			<script>
				const open = document.getElementById('open');
				const close = document.getElementById('close');
				const modal = document.getElementById('modal');
				const mask = document.getElementById('mask');

				open.addEventListener('click', function() {
					modal.classList.remove('hidden');
					mask.classList.remove('hidden');
				});
				close.addEventListener('click', function() {
					modal.classList.add('hidden');
					mask.classList.add('hidden');
				});
				mask.addEventListener('click', function() {
					modal.classList.add('hidden');
					mask.classList.add('hidden');
				});
			</script>
</body>
</html>