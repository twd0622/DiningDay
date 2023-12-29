package com.diningday.service;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.diningday.dao.StoreDAO;
import com.diningday.util.TeamUtil;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

public class StoreService {

	StoreDAO storeDAO = new StoreDAO();
	
	public boolean insertMenu(HttpServletRequest req) {
		return storeDAO.insertMenu(TeamUtil.fileRequestToMap(req));
	}
	
	public JsonArray menuList(HttpServletRequest req) {
		return TeamUtil.mapListToJSONList(storeDAO.menuList(TeamUtil.requestToMap(req)));
	}
	
	public boolean menuUpdate(HttpServletRequest req) {
		return storeDAO.menuUpdate(TeamUtil.fileRequestToMap(req));
	}
	
	public JsonObject menuSelect(HttpServletRequest req) {
		return TeamUtil.mapToJSON(storeDAO.menuSelect(TeamUtil.requestToMap(req)));
	}
	
}
