package com.diningday.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.diningday.dao.StoreDAO;
import com.diningday.util.TeamUtil;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

public class StoreService {

	StoreDAO storeDAO = new StoreDAO();
	
//	--- 메뉴 시작 ---	
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
	
	public JsonObject menuSelect(Map<String, String> map) {
		return TeamUtil.mapToJSON(storeDAO.menuSelect(map));
	}
	
	public JsonObject menuMax(String req) {
		Map<String, String> dto = new HashMap<String, String>();
		dto.put("STORE_NO", req);
		
		return TeamUtil.mapToJSON(storeDAO.menuMax(dto));
	}
	
	public boolean menuDelete(Map<String, String[]> dto) {
		return storeDAO.deleteMenu(dto);
	}
	
//	--- 메뉴 끝 ---
	
//	--- 식당 정보 시작 ---
	
	public JsonObject storeSelect(HttpServletRequest req) {
		return TeamUtil.mapToJSON(storeDAO.storeSelect(TeamUtil.fileRequestToMap(req)));
	}
	
	public Map<String, String> storeSelect(Map<String, String> storeDTO) {
		return storeDAO.storeSelect(storeDTO);
	}
	
	public Map<String, String> ownerSelect(Map<String, String> storeDTO) {
		return storeDAO.ownerSelect(storeDTO);
	}
	
	public Map<String, String> ownerSelect(HttpServletRequest req) {
		return storeDAO.ownerSelect(TeamUtil.requestToMap(req));
	}
	
	public boolean storeInsert(Map<String, String> storeDTO) {
		return storeDAO.storeInsert(storeDTO);
	}
	
	public boolean firstInsertStore_OwnerUpdate(Map<String, String> storeDTO) {
		return storeDAO.firstInsertStore_OwnerUpdate(storeDTO);
	}

//	--- 식당 정보 끝 ---
	
//	--- 좌석 시작 ---	
	
	public boolean seatInsert(HttpServletRequest req) {
		return storeDAO.seatInsert(TeamUtil.fileRequestToMap(req));
	}
	
	public JsonArray seatSelectList(Map<String, String> dto) {
		return TeamUtil.mapListToJSONList(storeDAO.seatSelectList(dto));
	}
	
	public List<Map<String, String>> stableResCheck(Map<String, String> dto) {
		return storeDAO.stableResCheck(dto);
	}
	
	public boolean seatDelete(Map<String, String> dto) {
		return storeDAO.seatDelete(dto);
	}
	
	public boolean seatUpdate(Map<String, String> dto) {
		return storeDAO.seatUpdate(dto);
	}
	
//	--- 좌석 끝 ---	
	
//	--- 예약 시작 ---
	
	public JsonArray resSelectList(HttpServletRequest req, Map<String, String> dto) {
		return TeamUtil.mapListToJSONList(storeDAO.resSelectList(TeamUtil.requestToMap(req, dto)));
	}
	
	public boolean resUpdate(Map<String, String> dto) {
		return storeDAO.resUpdate(dto);
	}
	
	public Map<String, String> resSelect(Map<String, String> dto) {
		return storeDAO.resSelect(dto);
	}
	
	public JsonArray resMonthSelect(Map<String, String> dto) {
		return TeamUtil.mapListToJSONList(storeDAO.resMonthSelect(dto));
	}
	
	public JsonArray resWeekSelect(Map<String, String> dto) {
		return TeamUtil.mapListToJSONList(storeDAO.resWeekSelect(dto));
	}
	
	
//	--- 예약 끝 ---
	
	// ----------------- 01/17 준우 작성 건들 ㄴㄴ -------------------------------------------------
	public List<Map<String, String>> getReviewList(Map<String, String> reviewDTO) {
		return storeDAO.getReviewList(reviewDTO);
		
	}

	public Map<String, String> answerInsert(Map<String, String> answerDTO) {
		return storeDAO.answerInsert(answerDTO);
	}
	
	// -------------------여기 까지 s_review-------------------------------------------------------

	
	//	01/17_강현아 + 점주 정보 저장 및 수정

	public Map<String, String> getOwner(String OWN_NO) {
		return storeDAO.getOwner(OWN_NO);
	}

	public boolean ownerEdit(HttpServletRequest req, Map<String, String> param) {
		Map<String, String> ownerDTO = TeamUtil.requestToMap(req, param);
		return storeDAO.ownerEdit(ownerDTO);
	}

	
}
