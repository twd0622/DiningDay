package com.diningday.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.diningday.dao.UserDAO;
import com.diningday.util.TeamUtil;

public class UserService {

	UserDAO userDAO = new UserDAO();
	
	public boolean insertUser(HttpServletRequest req) {
		Map<String, String> userDTO = TeamUtil.requestToMap(req);
		
		boolean result = userDAO.insertUser(userDTO);
		
		return result;
	}

}
