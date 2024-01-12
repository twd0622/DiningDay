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
	
	public boolean insertMenu(Map<String, String> map) {
		return storeDAO.insertMenu(map);
	}
	
	public JsonArray menuList(HttpServletRequest req) {
		return TeamUtil.mapListToJSONList(storeDAO.menuList(TeamUtil.requestToMap(req)));
	}
	
	public boolean menuUpdate(HttpServletRequest req) {
		return storeDAO.menuUpdate(TeamUtil.fileRequestToMap(req));
	}
	
	public boolean menuUpdate(Map<String, String> map) {
		return storeDAO.menuUpdate(map);
	}
	
	public JsonObject menuSelect(HttpServletRequest req) {
		JsonObject a = null;
		return a;
	}
	
	public JsonObject menuSelect(Map<String, String> map) {
		return TeamUtil.mapToJSON(storeDAO.menuSelect(map));
	}
	
	public JsonObject menuMax(HttpServletRequest req) {
		return TeamUtil.mapToJSON(storeDAO.menuMax(TeamUtil.fileRequestToMap(req)));
	}
	
	public boolean menuDelete(HttpServletRequest req) {
		return storeDAO.deleteMenu(TeamUtil.fileRequestToArrayMap(req));
	}
	
	public JsonObject storeSelect(HttpServletRequest req) {
		return TeamUtil.mapToJSON(storeDAO.storeSelect(TeamUtil.fileRequestToMap(req)));
	}
	
	public Map<String, String> storeSelect(Map<String, String> storeDTO) {
		return storeDAO.storeSelect(storeDTO);
	}
	
	public boolean storeInsert(Map<String, String> storeDTO) {
		return storeDAO.storeInsert(storeDTO);
	}
	
	public boolean firstInsertStore_OwnerUpdate(Map<String, String> storeDTO) {
		return storeDAO.firstInsertStore_OwnerUpdate(storeDTO);
	}
}
