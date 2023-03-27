<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="model.Student"%>
<%@ page import="model.Group"%>
<%@ page import="model.GroupManager"%>
<%@ page import="model.StudentManager"%>
<%@ page import="java.util.ArrayList" %>
<% Student student = (Student)session.getAttribute("student"); %>
<% int groupID = student.getGroupID(); %>

<% StudentManager studentManager = new StudentManager(); %>
<% GroupManager groupManager = new GroupManager(); %>
<% Group group = groupManager.getGroup(groupID); %>
<% ArrayList<Student> studentList = studentManager.getGroupMember(groupID);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/group.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>グループ</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="content">
        <div id="group">
            
            <div class="members">
            	<h2 class="groupName "><%= group.getName() %></h2>
                <div class="member">
                        <h3>メンバー</h3>
                        <h3>予定</h3>
                </div>
                <%for(int i = 0 ; i < studentList.size(); i++){ %>
	                <div class="member">
	                	<p><%= studentList.get(i).getUserName()%></p>
	                    <p><%= studentList.get(i).getPlan()%></p>
	                </div>
                 <%} %>
            </div>

            <div class="mySchedule">
                <h3>自分の予定</h3>
                <form method ="post" action="Group">
                     <input type="hidden" name="group" value="plan">
                    <input type="text" name ="plan" placeholder="（例）学食" required>
                    <input class="button groupButton" type="submit" value="更新">
                </form>
            </div>
            
            <div class="leave">
                <form method ="post" action="Group">
                    <input type="hidden" value="leave" name ="group">
                    <input class="button leaveButton" type="submit" value="退室">
                </form>
            </div>
        </div>
    </div>
	<%@ include file="footer.jsp"%>
</body>

</html>