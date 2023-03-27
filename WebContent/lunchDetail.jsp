<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="model.ShopInformation"%>
    <%@ page import="model.ShopManager" %>
    <%@ page import="model.Kuchikomi" %>
    <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/lunchDetail.css">
<title>お店詳細</title>
<% 
	//店情報取得
	ArrayList<ShopInformation> shopList = (ArrayList<ShopInformation>)session.getAttribute("shopList");
	ShopInformation shopDetail = (ShopInformation)session.getAttribute("shopDetail");
		System.out.println(shopDetail);
	//口コミ情報取得
		ArrayList<Kuchikomi> kList = (ArrayList<Kuchikomi>)session.getAttribute("kList");
		System.out.println(kList);
		String message;
		String evaluateStar = "";
		int n = 0;
		
		
	//studentID取得
	Object studentID = null;
	Student student = (Student)session.getAttribute("student");
	if(student != null){
		studentID = (Object)student.getStudentID();
	}
	
	%>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="content">
        <div id="lunchDetail">
            <div class="detail">

                <h3><%= shopDetail.getShopName() %></h3>
                <img alt="" src="<%= shopDetail.getShopImage() %>">
                <h4>住所</h4>
                <p><%= shopDetail.getShopAddress() %></p>
                <h4>Open&Closed</h4>
                <p><%= shopDetail.getShopOpen() %></p>
                <h4>定休日</h4>
                <p><%= shopDetail.getShopClose() %></p>
                
            </div>
            
            <div class="reviewArea">
            <form method="POST" name="createKuchikomi" action="KuchikomiController">
            <input type="hidden" name="shopDetail" value=<%= shopDetail%>>
            <input type="hidden" name="reviewConfirm" value="reviewConfirm"> 
                <div class="parentReview">
                    <h3>口コミ</h3>
                    <a class="button" href="javascript:createKuchikomi.submit()">投稿</a>
                </div>
               </form>
               <%if(kList.size()==0){
       			message = (String)session.getAttribute("message");
    			System.out.println(message);
               %>
                    <h5><%=message %></h5>
                    <%} else {%>
               <%for(int i = 0; i < kList.size() ; i++){ %>
                <div class="reviewItem">
                    <div class="parentReview">
                    
                        <p><%= kList.get(i).getStudentName() %></p>
                        <%if(studentID != null) {%>
                        	<%if(studentID.equals((Object)kList.get(i).getStudentID())) {%>
                            	<a class="button deleteButton" href="KuchikomiController?id=<%=kList.get(i).getKuchikomiID()%>">削除</a>
                            <%}
                        }%>
                     
                    </div>
                    <div class="reviewContent">
                        <!-- <p>＜口コミの内容が表示されるエリア＞</p> -->
                        <% for(int x = 0; x < kList.get(i).getEvaluate(); x++){
	                        	evaluateStar += "★";
	                        	n++;
                        	}
                        	for(int y = n; y < 5; y++){
                        		evaluateStar += "☆";
                        	} %>
                        <h3><%= kList.get(i).getTitle() %></h3>
                        <h4>評価点：<span class = "star"><%= evaluateStar %></span></h4>
                        <% evaluateStar = "";
                           n = 0; %>
                        <p><%= kList.get(i).getKuchikomiPara() %></p>
                    </div>
                </div>
                <%}
                } %>

            </div>
        </div>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>