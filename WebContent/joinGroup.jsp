<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="model.Group"%>
<%@ page import="java.util.ArrayList" %>

<% ArrayList<Group> groupList = (ArrayList<Group>)session.getAttribute("groupList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/joinGroup.css">
<title>グループ参加</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="content">
        <div id="joinGroup">
            <form method ="get" action="Group">
                <div class="parent-join">
                    <input type="text" name="searchName">
                    <input type="hidden" name="group" value="search">
                    <input id="submit" class="button" type="submit" value="検索">
                </div>
            </form>

            <div class="resultGroup">
                    <h3>検索結果:<%=groupList.size()%>件</h3>
               
                <% 
				for(int i = 0; i < groupList.size(); i++){ %>
				 <form method="post" action="Group">
					<div class="result-item">
					    <p><b><%=groupList.get(i).getName() %></b><br>　メンバー：<%=groupList.get(i).getMemberNum() %>名
					       <input type="hidden" name="group" value = "join">
					       <input type="hidden" name="groupID" value = <%=groupList.get(i).getId()%>>
					       <input id="submit" class="button" type="submit" value="参加">
					     </p>
					</div>
				</form>
					<% }
				%>
            </div>

        </div>
    </div>
	<%@ include file="footer.jsp"%>
</body>
</html>