package servlet; 

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.StudentManager;

@WebServlet("/Register")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	private StudentManager studentManager = new StudentManager();
       
    public RegisterController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	this.doPost(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		String userName = request.getParameter("userName");
		int grade = Integer.parseInt(request.getParameter("grade"));
		String subject = request.getParameter("department"); 
		String password = request.getParameter("password");
		String password2 = request.getParameter("confirmPassword");
		
		boolean isRegister = studentManager.register(userName, grade, subject, password);
		if(password.equals(password2) && isRegister) {
			getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
		}
		else if(!password.equals(password2)) {
			session.setAttribute("signUpMessage", "パスワードが一致しません");
			getServletContext().getRequestDispatcher("/signUp.jsp").forward(request, response);
		}
		else if(!isRegister){
			session.setAttribute("signUpMessage", "このユーザ名は既に使用されています");
			getServletContext().getRequestDispatcher("/signUp.jsp").forward(request, response);
		}
		else {
			session.setAttribute("inputName" , userName);
			getServletContext().getRequestDispatcher("/signUp.jsp").forward(request, response);
		}
	}
}