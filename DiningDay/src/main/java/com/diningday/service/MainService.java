package com.diningday.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.diningday.dao.MainDAO;
import com.diningday.util.TeamUtil;

public class MainService {
	MainDAO mainDAO = new MainDAO();
	
	public List<Map<String, String>> searchResult(HttpServletRequest req) {
		return mainDAO.searchResult(TeamUtil.requestToMap(req));
	}

	public int searchCount(HttpServletRequest req) {
		return mainDAO.searchCount(TeamUtil.requestToMap(req));
	}

	public Map<String, String> getStore(HttpServletRequest req) {
		 return mainDAO.getStore(TeamUtil.requestToMap(req));
		
	}

	public List<Map<String, String>> getMenu(HttpServletRequest req) {
		return mainDAO.getMenu(TeamUtil.requestToMap(req));
	}

	public List<Map<String, String>> getTable(HttpServletRequest req) {
		return mainDAO.getTable(TeamUtil.requestToMap(req));
	}

}
