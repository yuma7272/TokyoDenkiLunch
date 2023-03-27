<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/signUp.css">
<title>新規登録</title>
<style>
.inputInfo>label{
    width: 100px;
    vertical-align: top;
    display: inline-block;
    padding: 5px;
    cursor: pointer;
}
.inputInfo>label:hover{
    color: red;
}
.inputInfo>label>input{
    margin-right: 1px;
    cursor: pointer;
}
</style>

</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="content">
        <div id="signUp">
            <h2>新規登録</h2>
            <% if(session.getAttribute("signUpMessage") != null){%>
				<%String signUpMessage = (String) session.getAttribute("signUpMessage"); %>
        	<h3><%= signUpMessage%></h3>
        	<br>
       		<%} %>
      		<%session.setAttribute("signUpMessage" , null);%>
            <form action="Register">
                <div class="parent-reg">
                    <div class="inputInfo">
                    	
      				 
                        <h3>学年</h3>
                            <label><input type="radio" name="grade" value="1" required>１年</label>
							<label><input type="radio" name="grade" value="2">2年</label>
							<label><input type="radio" name="grade" value="3">3年</label>
							<label><input type="radio" name="grade" value="4">4年</label>
				
                   
                        <h3>学科</h3>
                        <label>
						  <select name="department" required>
						  <option value="" selected disabled>--選択--</option>
						  <option value="EJ">電気電子工学科(EJ)</option>
						  <option value="EH">電子システム工学科(EH)</option>
						  <option value="ES">応用化学科(ES)</option>
						  <option value="EK">機械工学科(EK)</option>
						  <option value="EF">先端機械工学科(EF)</option>
						  <option value="EC">情報通信工学科(EC)</option>
						  <option value="RU">理学系(RU))</option>
						  <option value="RB">生命科学系(RD)</option>
						  <option value="RD">情報システムデザイン学系(RD)</option>
						  <option value="RM">機械工学系(RM)</option>
						  <option value="RE">電子工学系(RE)</option>
						  <option value="RG">建築・都市環境学系(RG)</option>
						  <option value="RL">共通教育学群(RL)</option>
						  <option value="FA">建築学科(FA)</option>
						  <option value="FI">情報メディア学科(FI)</option>
						  <option value="FR">ロボット・メカトロニクス学科(FR)</option>
						  <option value="AJ">情報システム工学科(AJ)</option>
						  <option value="AD">デザイン工学科(AD)</option>
						  </select>
						</label>
                    </div>
                </div>
                
                    <div class="signUpElement">
                        <h3>ユーザー名</h3>
                        <%String inputName = (String)session.getAttribute("inputName"); %>
                        <%if(inputName != null){ %>
                        <input type="text" name="userName" value ="<%=inputName%>" required>
                        <%session.setAttribute("inputName" , null); %>
                        <%} 
                        else{%>
                        <input type="text" name="userName" placeholder="ユーザ名を入力" minlength="2" maxlength="20" required>
                        <%} %>
                    </div>
                    <div class="signUpElement">
                        <h3>パスワード</h3>
                        <input type="password" name="password" minlength="8" required>
                    </div>
                    <div class="signUpElement">
                        <h3>パスワード（確認）</h3>
                        <input type="password" name="confirmPassword" required>
                    </div>
                
                <input class="button signUpButton" type="submit" value="登録">
            </form>
        </div>
    </div>
	<%@ include file="footer.jsp"%>
</body>
</html>