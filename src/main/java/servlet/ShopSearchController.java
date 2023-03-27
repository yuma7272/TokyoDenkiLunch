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
import model.ShopManager;

/**
 * Servlet implementation class ShopSearchController
 */
@WebServlet("/ShopSearchController")
public class ShopSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private KuchikomiManager kuchikomiManager = new KuchikomiManager();
	private ShopManager shopManager = new ShopManager();
	private ArrayList<ShopInformation> shopList;
       
    public ShopSearchController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

			
		//指定されたジャンルからリストを取得
		String keyword = (String)request.getParameter("keyword");
		String price = request.getParameter("price");
		String distance = request.getParameter("distance");
		String[] checkbox = request.getParameterValues("exit");
			
		String numString = request.getParameter("id");
			
		if(numString == null){
			if(keyword != null || price != null || distance != null || checkbox != null) {
				String exit = null;
				if(checkbox != null && checkbox.length == 1) {
					exit = checkbox[0];
				}
				shopList = shopManager.searchShopInformation(keyword, price, distance, exit);
			}else {
				shopList = shopManager.searchShopInformation();
			}
		}
			
		if(numString == null) {
			
			if(shopList.size() != 0) {
				//検索結果がある場合。リストをセットし、お店検索画面へ遷移
				session.setAttribute("shopList", shopList);
				session.setAttribute("keyword", keyword);
				getServletContext().getRequestDispatcher("/searchLunch.jsp").forward(request, response);
			}
			else {
				request.setAttribute("message", "検索されたジャンルのお店は見つかりませんでした。");
				session.setAttribute("keyword", keyword);
				getServletContext().getRequestDispatcher("/searchLunch.jsp").forward(request, response);
			}
				
		} else {
			System.out.println("詳細画面遷移先ページへ移動");
			//お店が選択された場合、lunchDetailへ飛ぶ
			int num = Integer.parseInt(numString);
			session.setAttribute("id", num);
			ShopInformation shopDetail = shopList.get(num);
			session.setAttribute("shopDetail", shopDetail);
			
			String shopID = shopDetail.getShopId();
			ArrayList<Kuchikomi> kList = kuchikomiManager.searchKuchikomi(shopID);
			if(kList.size()==0) {
				session.setAttribute("message", "投稿された口コミはありません");
			} 
			session.setAttribute("kList", kList);
				
			getServletContext().getRequestDispatcher("/lunchDetail.jsp").forward(request, response);
			
		}
	}
}
