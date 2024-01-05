package com.diningday.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.diningday.dao.CustomerDAO;
import com.diningday.util.TeamUtil;

public class CustomerService {
	CustomerDAO customerDAO = new CustomerDAO();
	
	public boolean insertCustomer(HttpServletRequest req) {
		Map<String, String> customerDTO = TeamUtil.requestToMap(req);
		boolean result = customerDAO.insertCustomer(customerDTO);
		return result;
	}
	
	
	
	public Map<String, String> searchId(HttpServletRequest req) {
		Map<String, String> customerDTO = TeamUtil.requestToMap(req);
		return customerDAO.searchId(customerDTO);
	}



	public Map<String, String> getCustomer(String CUS_NO) {
		return customerDAO.getCustomer(CUS_NO);
	}



	public boolean customerEdit(HttpServletRequest req, Map<String, String> param) {
		Map<String, String> customerDTO = TeamUtil.requestToMap(req, param);
		return customerDAO.customerEdit(customerDTO);
	}

	
	
	public Map<String, String> customerCheck(HttpServletRequest req, Map<String, String> param) {
		Map<String, String> customerDTO = TeamUtil.requestToMap(req, param);
		return customerDAO.customerCheck(customerDTO);
	}


	public void deleteCustomer(Map<String, String> customerCheck) {
		customerDAO.deleteCustomer(customerCheck);
	}





	
}
