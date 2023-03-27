package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/MyPage")
public class MyPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyPageController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	this.doPost(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	HttpSession session = request.getSession();
		
		Object login =  session.getAttribute("login");
		
		if(login != null) {
			getServletContext().getRequestDispatcher("/myPage.jsp").forward(request, response);
		}
		//ログインしてない場合はログイン画面へ
		else {
    		getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
		}
		
    }
}