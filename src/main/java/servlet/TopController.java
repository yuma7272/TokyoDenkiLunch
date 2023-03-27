package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.AdviceManager;


@WebServlet("/TopController")
public class TopController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private AdviceManager adviceManager = new AdviceManager();

    public TopController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		session.setAttribute("advice", adviceManager.createAdvice());
		session.setAttribute("isSun", adviceManager.isSun());
		session.setAttribute("weatherIcon", adviceManager.getWeatherIcon());
		getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
	}

}
