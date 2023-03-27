package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ClassRoom;
import model.ClassRoomManager;

/**
 * Servlet implementation class ClassRoomController
 */
@WebServlet("/ClassRoomController")
public class ClassRoomController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ClassRoomManager classRoomManager = new ClassRoomManager();
       
    public ClassRoomController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		boolean administLogin = false;
		
		String administ = request.getParameter("administ");
		
		if(administ != null) {
			administLogin = true;
		}
		
		
		if(administLogin) {
			//管理者メソッド
			boolean isWeather = true;
			boolean isEat = true;
			String roomNumber = request.getParameter("roomNumber");
			String youbi = request.getParameter("youbi");
			String isWeatherString = request.getParameter("isWeather");
			String isEatString = request.getParameter("isEat");
			
			if(isWeatherString.equals("true")) {
				isWeather = true;
			} else {
				isWeather = false;
			}
			if(isEatString.equals("true")) {
				isEat = true;
			} else {
				isEat = false;
			}
			
			boolean addBoolean = false;
			boolean removeBoolean = false;
			String add = request.getParameter("addRoom");
			String remove = request.getParameter("remove");
			
			if(add != null) {
				addBoolean = true;
			} else if(remove != null) {
				removeBoolean = true;
			}
			
			if(addBoolean) {
				classRoomManager.registerClassRoom(roomNumber, youbi, isWeather, isEat);
				add = null;
				session.setAttribute("message", "登録しました");
			} else if(removeBoolean) {
				classRoomManager.removeClassRoom(roomNumber);
				remove = null;
				session.setAttribute("message", "削除しました");
			}
			
			getServletContext().getRequestDispatcher("/kanri.jsp").forward(request, response);
			
		} else {
			//空き教室画面へ遷移
			ClassRoomManager crm = new ClassRoomManager();
			ArrayList<ClassRoom> classList = crm.getRoomList();
			session.setAttribute("classList", classList);
			
			getServletContext().getRequestDispatcher("/room.jsp").forward(request, response);
		}
		
	}

}
