package model;

public class Kuchikomi {
	private String shopID;
	private int studentID;
	private int kuchikomiID;
	private String kuchikomiPara;
	private String title;
	private int evaluate;
	private String studentName;
	

	public void setShopID(String shopID) {
		this.shopID = shopID;
	}
	public String getShopID() {
		return shopID;
	}
	
	public void setStudentID(int studentID) {
		this.studentID = studentID;
	}
	public int getStudentID() {
		return studentID;
	}
	
	public void setKuchikomiID(int kuchikomiID) {
		this.kuchikomiID = kuchikomiID;
	}
	public int getKuchikomiID() {
		return kuchikomiID;
	}
	
	public void setKuchikomiPara(String kuchikomiPara) {
		this.kuchikomiPara = kuchikomiPara;
	}
	public String getKuchikomiPara() {
		return kuchikomiPara;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTitle() {
		return title;
	}
	
	public void setEvaluate(int evaluate) {
		this.evaluate = evaluate;
	}
	public int getEvaluate() {
		return evaluate;
	}
	
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getStudentName() {
		return studentName;
	}
	
	public String toString() {
		return "shopID : " + shopID + "\r\n"
				+ "studentID : " + studentID + "\r\n"
				+ "kuchikomiID : " + kuchikomiID + "\r\n"
				+ "kuchikomiPara : " + kuchikomiPara + "\r\n"
				+ "kuchikomititle : " + title + "\r\n"
				+ "evaluate : " + evaluate + "\r\n"
				+ "studentName : " + studentName + "\r\n";
		
	}
	
//	public String confirmation() {
//		return "shopID : " + shopID + "\r\n"
//				+ "studentID : " + studentID + "\r\n"
//				+ "kuchikomiID : " + kuchikomiID + "\r\n"
//				+ "kuchikomiPara : " + kuchikomiPara + "\r\n";
//	}
	
}
