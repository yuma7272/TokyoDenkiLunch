package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Student;
import model.StudentManager;

@WebServlet("/Login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private StudentManager studentManager = new StudentManager();
       
    public LoginController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	this.doPost(request, response);
    	getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		Student student;
		Object login =  session.getAttribute("login");
		
		switch(request.getParameter("login")) {
		
		case "signup":
			if(login != null) {
				session.setAttribute("login", null);
			}
			getServletContext().getRequestDispatcher("/signUp.jsp").forward(request, response);
			break;
			
		case "signin":
			String userName = request.getParameter("userName");
			String password = request.getParameter("password");
			student = studentManager.login(userName, password);
			
			if(student != null) {
				login = true;
				session.setAttribute("login", login); 
			}
			
			if(login != null) {
				// ログインに成功している場合は
				session.setAttribute("student", student);
				getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
			}
			else {
				// ログインに失敗している場合は login.jsp へ
				String loginMessage = "ユーザ名またはパスワードが間違っています";
				session.setAttribute("loginMessage", loginMessage);
				getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
			}
			break;
			
		case "logout":
			session.setAttribute("login", null);
			session.setAttribute("student", null);
			getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
			break;
			
		case "loginPage":
			getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
			break;
		}
	}
}