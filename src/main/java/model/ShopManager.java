package model;

import java.util.ArrayList;

public class ShopManager {
	ShopInformationAPI shopInfoApi = new ShopInformationAPI();
	
	public ArrayList<ShopInformation> searchShopInformation(){
		ArrayList<ShopInformation> shopList = shopInfoApi.getShopInformation();
		return shopList;
	}
	public ArrayList<ShopInformation> searchShopInformation(String keyword){
		ArrayList<ShopInformation> shopList = shopInfoApi.getShopInformation(keyword);
		return shopList;
	}
	public ArrayList<ShopInformation> searchShopInformation(String query, String price, String range, String exit){
		ArrayList<ShopInformation> shopList = shopInfoApi.getShopInformation(query, price, range, exit);
		return shopList;
	}
}
