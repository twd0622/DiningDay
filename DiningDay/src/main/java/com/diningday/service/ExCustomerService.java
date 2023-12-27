package com.diningday.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.diningday.dao.ExCustomerDAO;
import com.diningday.util.TeamUtil;

public class ExCustomerService {
	ExCustomerDAO exCustomerDAO = new ExCustomerDAO();
	
	public boolean insertCustomer(HttpServletRequest req) {
		Map<String, String> exCustomerDTO = TeamUtil.requestToMap(req);
		
		boolean result = exCustomerDAO.insertExCustomer(exCustomerDTO);
		
		return result;
	}
}