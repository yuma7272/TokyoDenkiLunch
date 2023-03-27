<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/confirmSignUp.css">
<title>登録確認</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="content">
        <div id="signUp">
            <div class="signUp-confirm">
                <h2>登録内容確認</h2>
                <div class="warning">
                    <h4>Error</h4>
                    <!-- 内容に応じて記述 -->
                    <p>＊ユーザー名が重複しています</p>
                    <p>＊パスワードが正しくありません</p>
                    <p>＊存在しない学年、学科？</p>
                </div>
            </div>
            <form action="">
                <div class="parent-reg">
                    <div class="inputInfo">
                        <h3>学年</h3>
                        <p>3</p>
                    </div>
                    <div class="inputInfo">
                        <h3>学科</h3>
                        <p>FI</p>
                    </div>
                </div>
                
                <div class="signUpElement">
                	<h3>ユーザー名</h3>
                    <p>dendaiTarou</p>
                </div>
                <div class="signUpElement">
                	<h3>パスワード</h3>
                    <p>*********</p>
                </div>
                
                <input class="button signUpButton" type="submit" value="登録">
            </form>
        </div>
    </div>
	<%@ include file="footer.jsp"%>
</body>
</html>