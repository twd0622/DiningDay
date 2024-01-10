package com.diningday.service;

import java.util.HashMap;
import java.util.List;
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


	// 01/08_준우 + 찜 목록 이동 기능
	public List<Map<String, String>> getLikeList(String CUS_NO) {
		return customerDAO.getLikeList(CUS_NO);
	}



	public List<Map<String, String>> getReservation(String CUS_NO) {
		return customerDAO.getReservation(CUS_NO);
	}
	
	
	public Map<String, String> reservationModal(String RES_NO) {
		System.out.println("customerDAO.reservationModal(RES_NO): " + customerDAO.reservationModal(RES_NO));
		return customerDAO.reservationModal(RES_NO);
	}





	
}
