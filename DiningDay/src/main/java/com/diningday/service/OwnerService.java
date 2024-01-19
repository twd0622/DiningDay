package com.diningday.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.diningday.dao.OwnerDAO;
import com.diningday.util.TeamUtil;

public class OwnerService {
	OwnerDAO ownerDAO = new OwnerDAO();
	
	public boolean idCheck(HttpServletRequest req) {
		Map<String, String> ownerDTO = TeamUtil.requestToMap(req);
		boolean result = ownerDAO.idCheck(ownerDTO);
		return result;
	}
	
	public Map<String, String> joinCheck(HttpServletRequest req) {
		Map<String, String> ownerDTO = TeamUtil.requestToMap(req);
		return ownerDAO.joinCheck(ownerDTO);
	}

	public boolean insertOwner(HttpServletRequest req) {
		Map<String, String> ownerDTO = TeamUtil.requestToMap(req);
		boolean result = ownerDAO.insertOwner(ownerDTO);
		return result;
	}

	public Map<String, String> ownerCheck(HttpServletRequest req) {
		Map<String, String> ownerDTO = TeamUtil.requestToMap(req);
		
		return ownerDAO.ownerCheck(ownerDTO);
	}

	public Map<String, String> authCheck(HttpServletRequest req) {
		Map<String, String> ownerDTO = TeamUtil.requestToMap(req);
		return ownerDAO.authCheck(ownerDTO);
	}

	public Map<String, String> authPwCheck(HttpServletRequest req) {
		Map<String, String> ownerDTO = TeamUtil.requestToMap(req);
		return ownerDAO.authPwCheck(ownerDTO);
	}
	
	public boolean newPw(HttpServletRequest req, Map<String, String> param) {
		Map<String, String> ownerDTO = TeamUtil.requestToMap(req, param);
		return ownerDAO.newPw(ownerDTO);
	}

}
