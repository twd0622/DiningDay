package com.diningday.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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

	public void paymentInsert(Map<String, String> paymentDTO) {
		paymentDAO.paymentInsert(paymentDTO);
	}

	public void reservationMenuInsert(List<Map<String, String>> menuDTOList) {
		paymentDAO.reservationMenuInsert(menuDTOList);
		
	}

	public Map<String, String> getRES_NO(Map<String, String> paymentDTO) {
		return paymentDAO.getRES_NO(paymentDTO);
	}

	public Map<String, String> getResInfo(Map<String, String> dto) {
		return paymentDAO.getResInfo(dto);
		
	}

	public void payment_cancel(String MERCHANT_UID) {
		paymentDAO.payment_cancel(MERCHANT_UID);
		
	}

	public boolean checkResDate(String MERCHANT_UID) {
		boolean result = paymentDAO.checkResDate(MERCHANT_UID);
		System.out.println(result);
		return result;
	}

	
}
