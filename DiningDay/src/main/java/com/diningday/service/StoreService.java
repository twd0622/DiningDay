package com.diningday.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.diningday.dao.StoreDAO;
import com.diningday.dao.UserDAO;
import com.diningday.util.TeamUtil;
import com.google.gson.JsonArray;

public class StoreService {

	StoreDAO storeDAO = new StoreDAO();
	
	public boolean insertMenu(HttpServletRequest req) {
		Map<String, String> menuDTO = TeamUtil.requestToMap(req);
		
		boolean result = storeDAO.insertMenu(menuDTO);
		
		return result;
	}
	
	public JsonArray menuList(HttpServletRequest req) {
		Map<String, String> menuDTO = TeamUtil.requestToMap(req);
		return TeamUtil.mapListToJSON(storeDAO.menuList(menuDTO));
	}

}
