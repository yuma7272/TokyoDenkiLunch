package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.GroupManager;
import model.Student;
import model.StudentManager;

@WebServlet("/Group")
public class GroupController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private GroupManager groupManager= new GroupManager();
	private StudentManager studentManager = new StudentManager();
	
	public GroupController() {
        super();
    }
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	HttpSession session = request.getSession();
    	
    	String searchName = request.getParameter("searchName");
    	session.setAttribute("groupList", groupManager.getGroupList(searchName));
    	getServletContext().getRequestDispatcher("/joinGroup.jsp").forward(request, response); 	
     }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	HttpSession session = request.getSession();
    	Student student = (Student) session.getAttribute("student");
    	Student updateStudent ; //情報更新後の学生
    	String userName ;
    	int groupID;
    	boolean isSuccessfull;
    	
        Object login =  session.getAttribute("login");
        
    	
    	switch(request.getParameter("group")) {
    	
	    	//グループ作成
	    	case "create":
	    		String groupName = request.getParameter("groupName");
	    		userName = student.getUserName();
	    		
	    		isSuccessfull = groupManager.createGroup(groupName, userName);
	    		
	    		if(isSuccessfull) {
	    			updateStudent = studentManager.updateStudent(userName);
	    			session.setAttribute("student", updateStudent);
					getServletContext().getRequestDispatcher("/group.jsp").forward(request, response);
					break;
	    		}
	    		else {
	    			student = (Student) session.getAttribute("student");
	    			student.setGroupID(0);
	    			session.setAttribute("student", student);
	    			getServletContext().getRequestDispatcher("/createGroup.jsp").forward(request, response);
	    			
	    			break;
	    		}
	    		
	    	//グループ退会
	    	case "leave":
	    		userName = student.getUserName();
	    		groupID = student.getGroupID();
	    		isSuccessfull = studentManager.withDrawGroup(userName);
	    		
	    		if(isSuccessfull) {
	    		    groupManager.updateMemberNum(groupID);
	    		    updateStudent = studentManager.updateStudent(userName);
	    			session.setAttribute("student", updateStudent);
	    			groupManager.deleteGroup();
	    			getServletContext().getRequestDispatcher("/newGroup.jsp").forward(request, response);
	    			break;
	    		}
	    		else {
	    			getServletContext().getRequestDispatcher("/groupResult.jsp").forward(request, response);
	    			break;
	    		}
	    		//グループ参加
	    		case "join":
	    		userName = student.getUserName();
	    		groupID = Integer.parseInt(request.getParameter("groupID"));
	    		System.out.println(groupID);
	    		isSuccessfull = studentManager.joinGroup(userName, groupID);
	    		
	    		if(isSuccessfull) {
	    			updateStudent = studentManager.updateStudent(userName);
	    			session.setAttribute("student" , updateStudent);
	    			groupManager.updateMemberNum(groupID);
	    			getServletContext().getRequestDispatcher("/group.jsp").forward(request, response);
	    			break;
	    		}
	    		else {
	    			student = (Student) session.getAttribute("student");
	    			student.setGroupID(0);
	    			session.setAttribute("student", student);
	    			getServletContext().getRequestDispatcher("/group.jsp").forward(request, response);
	    			break;
	    			}
	    	
	    	//画面遷移
	    	case "redirect":
	    		
	    		if(login != null) {
		    		//グループに所属してない場合
		    		if(student.getGroupID() == 0) {
		    			getServletContext().getRequestDispatcher("/newGroup.jsp").forward(request, response);
		    		}
		    		else {
		    			groupID = student.getGroupID();
		    			session.setAttribute("memberList", studentManager.getGroupMember(groupID));
		    			getServletContext().getRequestDispatcher("/group.jsp").forward(request, response);
		    		}
	    		}
	    		//ログインしてない場合はログイン画面へ
	    		else {
		    		getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
	    		}
	    		
	    		break;
	    	
	    	//グループ選択画面へ
	    	case "select":
	    		session.setAttribute("groupList", groupManager.getAllGroup());
	    		getServletContext().getRequestDispatcher("/joinGroup.jsp").forward(request, response);
	    		break;
	    	
	    	//予定
	    	case "plan":
	    		userName = student.getUserName();
	    		String plan = request.getParameter("plan");
	    		isSuccessfull = studentManager.changePlan(userName, plan);
	    		
	    		if(isSuccessfull) {
	    			updateStudent = studentManager.updateStudent(userName);
	    			session.setAttribute("student" , updateStudent);
	    			getServletContext().getRequestDispatcher("/group.jsp").forward(request, response);
	    			break;
	    		}
	    		else {
	    			getServletContext().getRequestDispatcher("/group.jsp").forward(request, response);
	    			break;
	    			}
    	}
		
	}
}