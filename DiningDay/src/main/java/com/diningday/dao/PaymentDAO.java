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

}
