package com.diningday.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.diningday.dao.StoreDAO;
import com.diningday.util.TeamUtil;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

public class StoreService {

	StoreDAO storeDAO = new StoreDAO();
	
	public boolean insertMenu(HttpServletRequest req) {
		Map<String, String> menuDTO = TeamUtil.requestToMap(req);
		
		boolean result = storeDAO.insertMenu(menuDTO);
		
		return result;
	}
	
	public List<Map<String, String>> menuList(HttpServletRequest req) {
		return storeDAO.menuList(TeamUtil.requestToMap(req));
	}
	
	public JsonObject menuUpdate(HttpServletRequest req) {
		boolean isTrue = storeDAO.menuUpdate(TeamUtil.requestToMap(req));
		JsonObject jo = null;
		if(isTrue) {
			jo = TeamUtil.mapToJSON(storeDAO.menuSelect(TeamUtil.requestToMap(req)));
		}

		return jo;
	}
	
}
