package com.diningday.service;

import java.util.List;
import java.util.Map;

import com.diningday.dao.PaymentDAO;

public class PaymentService {
	
	PaymentDAO paymentDAO = new PaymentDAO();
	
	public Map<String, String> getCustomerInfo(String CUS_NO) {
		return paymentDAO.getCustomerInfo(CUS_NO);
	}

	public List<Map<String, String>> getMenuInfo(Map<String, String> reservationDTO) {
		return paymentDAO.getMenuInfo(reservationDTO);
	}

	public Map<String, String> getStoreInfo(Map<String, String> reservationDTO) {
		return paymentDAO.getStoreInfo(reservationDTO);
	}
	
}
