<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/postReview.css">
<title>口コミ投稿</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="content">
        <div id="postReview">
            <form method="POST" name="reviewForm" action="KuchikomiController">
                <h3>口コミ投稿対象</h3>
                    <div class="parent-review">
                        <h4>タイトル</h4>
                        <input type="text" name="title" required>
                    </div>
                    <div class="parent-review">
                        <h4>総合</h4>
                        <label>
	                        <select name="evaluate" required>
	                            <option value="" selected disabled>選択してください</option>
	                            <option value="1">★☆☆☆☆</option>
	                            <option value="2">★★☆☆☆</option>
	                            <option value="3">★★★☆☆</option>
	                            <option value="4">★★★★☆</option>
	                            <option value="5">★★★★★</option>
	                        </select>
                        </label>
                    </div>
                    <div class="parent-review">
                        <h4>コメント</h4>
                        <textarea name="kuchikomiPara" id="" cols="24" rows="10" required></textarea>
                    </div>
                    <input id="submit" class="button" type="submit" name="review" value="投稿">
            </form>
        </div>
    </div>
	<%@ include file="footer.jsp"%>
</body>
</html>