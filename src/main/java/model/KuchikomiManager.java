package model;

import java.util.ArrayList;

public class KuchikomiManager {
	public void registerKuchikomi(String shopID, int studentID, String kuchikomiPara, 
			String title, int evaluate, String studentName ) { //データベースに登録
		KuchikomiDAO kDao = new KuchikomiDAO();
		kDao.addKuchikomi(shopID, studentID, kuchikomiPara, title, evaluate, studentName);
	}
	
	
	
	public void removeKuchikomi(int kuchikomiID) { //データベースから削除
		KuchikomiDAO kDao = new KuchikomiDAO();
		kDao.deleteKuchikomi(kuchikomiID);
	}
	
	public ArrayList<Kuchikomi> searchKuchikomi(String shopID) { //データベースから口コミ情報取得
		KuchikomiDAO kDao = new KuchikomiDAO();
		return kDao.getKuchikomi(shopID);
	}
	
	public boolean isDouplication(String shopID, int studentID, String kuchikomiPara, 
			String title, int evaluate, String studentName ) {
		KuchikomiDAO kDao = new KuchikomiDAO();
		return kDao.isDouplicateKuchikomi(shopID , studentID , kuchikomiPara , title , evaluate , studentName);
	}
}
