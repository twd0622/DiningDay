package com.diningday.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.diningday.sql.SqlMapClient;

public class PaymentDAO {
	
	private SqlSessionFactory sqlSessionFactory = SqlMapClient.getSqlSessionFactory();
	SqlSession session;
	
	public Map<String, String> getCustomerInfo(String CUS_NO) {
		session = sqlSessionFactory.openSession();
		
		Map<String, String> customerInfo = session.selectOne("Payment.getCustomerInfo", CUS_NO);
		
		session.close();
		
		return customerInfo;
		
	}

	public List<Map<String, String>> getMenuInfo(Map<String, String> reservationDTO) {
		session = sqlSessionFactory.openSession();
		
		List<Map<String, String>> menuInfoList = session.selectList("Payment.getMenuInfo", reservationDTO);
		
		session.close();
		
		return menuInfoList;
		
	}

	public Map<String, String> getStoreInfo(Map<String, String> reservationDTO) {
		session = sqlSessionFactory.openSession();
		Map<String, String> storeInfo = session.selectOne("Payment.getStoreInfo", reservationDTO);
		
		session.close();
		
		return storeInfo;
	}

	public void paymentInsert(Map<String, String> paymentDTO) {
		session = sqlSessionFactory.openSession();
		session.insert("Payment.paymentInsert", paymentDTO);
		
		session.commit();
		session.close();
		
	}

	public void reservationMenuInsert(List<Map<String, String>> menuDTOList) {
		session = sqlSessionFactory.openSession();
		session.insert("Payment.reservationMenuInsert", menuDTOList);
		
		session.commit();
		session.close();
	}
	
	public Map<String, String> getRES_NO(Map<String, String> paymentDTO) {
		session = sqlSessionFactory.openSession();
		Map<String, String> RES_NO = session.selectOne("Payment.getRES_NO", paymentDTO);
		session.close();
		
		return RES_NO;
	}

	public Map<String, String> getResInfo(Map<String, String> dto) {
		session = sqlSessionFactory.openSession();
		Map<String, String> resInfo = session.selectOne("Payment.getResInfo", dto);
		session.close();
		
		return resInfo;
		
	}

	public void payment_cancel(String MERCHANT_UID) {
		session = sqlSessionFactory.openSession();
		session.update("Payment.payment_cancel", MERCHANT_UID);
		session.commit();
		session.close();
		
	}

	public boolean checkResDate(String MERCHANT_UID) {
		session = sqlSessionFactory.openSession();
		Map<String, String> result = session.selectOne("Payment.checkResDate", MERCHANT_UID);
		
		session.close();
		
		return result.get("result") == "1" ? true : false;
	}

}
