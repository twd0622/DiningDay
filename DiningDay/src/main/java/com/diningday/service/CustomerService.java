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



	public Map<String, String> customerEdit(HttpServletRequest req, Map<String, String> param) {
		Map<String, String> customerDTO = TeamUtil.requestToMap(req, param);
		return customerDAO.customerEdit(customerDTO);
	}

	
	
	public Map<String, String> customerCheck(HttpServletRequest req) {
		Map<String, String> customerDTO = TeamUtil.requestToMap(req);
		return customerDAO.customerCheck(customerDTO);
	}


	public void deleteCustomer(HttpServletRequest req) {
//		String email = req.getParameter("CUS_EMAIL");
//		String[] emailArr = email.split("@");
//		System.out.println(emailArr);
//		Map<String, String> customerDTO = new HashMap<String, String>();
//		customerDTO.put("email_1", emailArr[0]);
//		customerDTO.put("email_2", emailArr[1]);
//		System.out.println("email용 customerDTO:" + customerDTO);
		
		String customerDTO = req.getParameter("CUS_EMAIL");
		
		customerDAO.deleteCustomer(customerDTO);
	}





	
}
