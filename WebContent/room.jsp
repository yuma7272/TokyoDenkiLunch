<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.ClassRoom" %>
<%@ page import="model.ClassRoomManager" %>
<%@ page import="model.AdviceManager" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/room.css">
    <title>空き教室一覧</title>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="content">
        <div id="room">
            <div class="title">
                <h3>空き教室一覧</h3>
            </div>
            
            <% ArrayList<ClassRoom> classList = (ArrayList<ClassRoom>)session.getAttribute("classList"); %>
            
            <p><img src="images/icon/food_16px.png" alt="">･･･飲食可能教室　
	           	<%if((boolean)session.getAttribute("isSun")){%>
	            	<img src="images/icon/sun_16px.png" alt="">･･･おすすめ
                <%} %>
            </p>
            <div class="roomElement">
                <h5>2号館</h5>
                <table>
                
                	<% for(int i = 0; i < classList.size(); i++){ %>
	                    <td>
		                    <p style="text-align:left; margin-left:40%;"><%= classList.get(i).getRoomNumber() %>
		                    <%if(classList.get(i).getIsWeather() && classList.get(i).getIsEat()){%>
		                    <img src="images/icon/food_16px.png" alt="">
		                    <%}%>
					
	                    	<%if(!classList.get(i).getIsWeather()){ %>
		                    	<%if((boolean)session.getAttribute("isSun")){%>
			                    <img src="images/icon/food_16px.png" alt="">
			                    <img src="images/icon/sun_16px.png" alt="">
			                    <%} %>
			                <%} %>
			                </p>
			              </td>
                    <% } %>
	               
                </table>
            </div>

            <div class="roomElement">
                <h5>3号館</h5>
                <table>
                    <td><p style="text-align:left; margin-left:40%;">1階<img src="images/icon/food_16px.png" alt=""></p></td>
                    <td><p style="text-align:left; margin-left:40%;">1.5階<img src="images/icon/food_16px.png" alt=""></p></td>
                    <td><p style="text-align:left; margin-left:40%;">2階<img src="images/icon/food_16px.png" alt=""></p></td>
                </table>
            </div>
        </div>
    </div>
<%@ include file="footer.jsp" %>
</body>
</html>