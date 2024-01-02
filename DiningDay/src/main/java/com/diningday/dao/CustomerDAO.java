package com.diningday.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.diningday.sql.SqlMapClient;

public class CustomerDAO {
	private SqlSessionFactory sqlSessionFactory = SqlMapClient.getSqlSessionFactory();
	SqlSession session;
	
	public Boolean insertCustomer(Map<String, String> customerDTO) {
		session = sqlSessionFactory.openSession();
		int insertCustomer = session.insert("Customer.insert", customerDTO); // namespace.id
		session.commit();
		session.close();
		return insertCustomer > 0 ? true : false;
	}
	
	public Map<String, String> searchId(Map<String, String> customerDTO) {
		session = sqlSessionFactory.openSession();
		Map<String, String> searchId = session.selectOne("Customer.searchId", customerDTO);
		session.commit();
		return searchId;
	}

	public Map<String, String> getCustomer(String CUS_NO) {
		session = sqlSessionFactory.openSession();
		Map<String, String> customerInfo = session.selectOne("Customer.getCustomer", CUS_NO);
		session.commit();
		session.close();
		return customerInfo;
	}

	public Map<String, String> customerEdit(Map<String, String> customerDTO) {
		session = sqlSessionFactory.openSession();
		Map<String, String> customerEdit = session.selectOne("Customer.customerEdit", customerDTO);
		session.commit();
		session.close();
		return customerEdit;
	}


	
	
	
	
	
	
	
}
