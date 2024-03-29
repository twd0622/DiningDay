package com.diningday.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.diningday.dao.MainDAO;
import com.diningday.util.TeamUtil;
import com.google.gson.JsonObject;

public class MainService {
	MainDAO mainDAO = new MainDAO();
	
	public List<Map<String, String>> searchResult(Map<String, String> searchDTO) {
		return mainDAO.searchResult(searchDTO);
	}

	public int searchCount(Map<String, String> searchDTO) {
		return mainDAO.searchCount(searchDTO);
	}

	public Map<String, String> getStore(HttpServletRequest req) {
		 return mainDAO.getStore(TeamUtil.requestToMap(req));
	}

	public List<Map<String, String>> getMenuList(HttpServletRequest req) {
		return mainDAO.getMenuList(TeamUtil.requestToMap(req));
	}

	public List<Map<String, String>> getTableList(HttpServletRequest req) {
		return mainDAO.getTableList(TeamUtil.requestToMap(req));
	}
	
	public List<Map<String, String>> getTableList(HttpServletRequest req, Map<String, String>param) {
		return mainDAO.getTableList(TeamUtil.requestToMap(req, param));
	}

	public JsonObject getTable(HttpServletRequest req) {
		return TeamUtil.mapToJSON(mainDAO.getTable(TeamUtil.requestToMap(req)));
	}

	public Map<String, String> getLike(HttpServletRequest req) {
		return mainDAO.getLike(TeamUtil.requestToMap(req));
	}

	public int insertLike(HttpServletRequest req) {
		return mainDAO.insertLike(TeamUtil.requestToMap(req));
	}

	public int deleteLike(HttpServletRequest req) {
		return mainDAO.deleteLike(TeamUtil.requestToMap(req));
	}

	public List<Map<String, String>> getResTime(Map<String, String> storeDTO) {
		return mainDAO.getResTime(storeDTO);
	}

	public List<Map<String, String>> getMainInfo(Map<String, String> storeDTO) {
		return mainDAO.getMainInfo(storeDTO);
		
	}

	public List<Map<String, String>> getBestReview(Map<String, String> reviewDTO) {
		return mainDAO.getBestReview(reviewDTO);
	}

	public List<Map<String, String>> getReviewHighStore(Map<String, String> storeDTO) {
		return mainDAO.getReviewHighStore(storeDTO);
		
	}

	public List<Map<String, String>> getLikeHighStore(Map<String, String> storeDTO) {
		return mainDAO.getLikeHighStore(storeDTO);
		
	}

}
