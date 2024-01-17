package com.diningday.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.diningday.dao.CustomerDAO;
import com.diningday.util.TeamUtil;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
		try {
			String uploadPath = req.getRealPath("/Customer/profile");
			int maxSize = 10 * 1024 * 1024;
			MultipartRequest multi = 
					new MultipartRequest(req, uploadPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
			/*
			 * String CUS_NAME = multi.getParameter("CUS_NAME"); String CUS_NICK =
			 * multi.getParameter("CUS_NICK"); String CUS_TEL =
			 * multi.getParameter("CUS_TEL"); String CUS_EMAIL =
			 * multi.getParameter("CUS_EMAIL"); String CUS_BIRTH =
			 * multi.getParameter("CUS_BIRTH");
			 */
			String CUS_IMAGE = multi.getFilesystemName("CUS_IMAGE");
			
			customerDTO.put("CUS_IMAGE", CUS_IMAGE);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return customerDAO.customerEdit(customerDTO);
	}

	
	
	public Map<String, String> customerCheck(HttpServletRequest req, Map<String, String> param) {
		Map<String, String> customerDTO = TeamUtil.requestToMap(req, param);
		return customerDAO.customerCheck(customerDTO);
	}


	public void deleteCustomer(Map<String, String> customerCheck) {
		customerDAO.deleteCustomer(customerCheck);
	}


	public List<Map<String, String>> getLikeList(String CUS_NO) {
		return customerDAO.getLikeList(CUS_NO);
	}


	public List<Map<String, String>> getReservation(String CUS_NO) {
		return customerDAO.getReservation(CUS_NO);
	}
	
	
	public Map<String, String> reservationModal(String RES_NO) {
		return customerDAO.reservationModal(RES_NO);
	}

	
	public List<Map<String, String>> menuModal(String RES_NO) {
		return customerDAO.menuModal(RES_NO);
	}



	public boolean insertEx(Map<String, String> customerCheck) {
		boolean result = customerDAO.insertEx(customerCheck);
		return result;
	}




	
}
