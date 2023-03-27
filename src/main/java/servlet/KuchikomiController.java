package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Kuchikomi;
import model.KuchikomiManager;
import model.ShopInformation;
import model.Student;

/**
 * Servlet implementation class KuchikomiController
 */
@WebServlet("/KuchikomiController")
public class KuchikomiController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private KuchikomiManager kuchikomiManager = new KuchikomiManager();
	private ShopInformation shopInformation;
	
    public KuchikomiController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		String reviewConfirm = request.getParameter("reviewConfirm");
		String review = request.getParameter("review");
		String deleteString = request.getParameter("id");
		
		Student student = (Student) session.getAttribute("student");
		
		shopInformation = (ShopInformation)session.getAttribute("shopDetail");
		String shopName = shopInformation.getShopName();
		String shopID = shopInformation.getShopId();
		
		String kuchikomiPara = request.getParameter("kuchikomiPara");
		Object login = session.getAttribute("login");
		
		if(login != null) {
						
			if(deleteString == null) {
				if(reviewConfirm != null) {
					//投稿画面に遷移
					session.setAttribute("shopName", shopName);
					getServletContext().getRequestDispatcher("/postReview.jsp").forward(request, response);
				} else if(review != null) {
					//投稿
					String title = request.getParameter("title");
					int evaluate = Integer.parseInt(request.getParameter("evaluate"));
					int sID = student.getStudentID();
					String sName = student.getUserName();
					
					//まったく同じ投稿ないか
					boolean isDuplicate = kuchikomiManager.isDouplication(shopID , sID , kuchikomiPara , title , evaluate , sName);
					if(!isDuplicate) {
						kuchikomiManager.registerKuchikomi(shopID, sID, kuchikomiPara, title, evaluate, sName);
					}
				
					ArrayList<Kuchikomi> kList = kuchikomiManager.searchKuchikomi(shopID);
					session.setAttribute("kList", kList);
					
					getServletContext().getRequestDispatcher("/lunchDetail.jsp").forward(request, response);
				} else {
					ArrayList<Kuchikomi> kList = kuchikomiManager.searchKuchikomi(shopID);
					session.setAttribute("kList", kList);
					getServletContext().getRequestDispatcher("/lunchDetail.jsp").forward(request, response);
				}
			} else {
				//投稿削除
				int kuchikomiID = Integer.parseInt(deleteString);
				kuchikomiManager.removeKuchikomi(kuchikomiID);
				ArrayList<Kuchikomi> kList = kuchikomiManager.searchKuchikomi(shopID);
				if(kList.size()==0) {
					session.setAttribute("message", "投稿された口コミはありません");
				}
				session.setAttribute("kList", kList);
				
				getServletContext().getRequestDispatcher("/lunchDetail.jsp").forward(request, response);
			} 
		
		} else {
			// ログインしていない場合は login.jsp へ
			getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
		}
		
	}

}
