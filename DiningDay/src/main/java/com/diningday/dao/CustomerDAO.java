package com.diningday.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.diningday.sql.SqlMapClient;

public class CustomerDAO {
	private SqlSessionFactory sqlSessionFactory = SqlMapClient.getSqlSessionFactory();
	
	public Boolean insertCustomer(Map<String, String> customerDTO) {
		SqlSession session = sqlSessionFactory.openSession();
		int insertCustomer = session.insert("Customer.insert", customerDTO); // namespace.id
		session.commit();
		session.close();
		return insertCustomer > 0 ? true : false;
	}
	
	public Map<String, String> searchId(Map<String, String> customerDTO) {
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, String> searchId =  session.selectOne("Customer.searchId", customerDTO);
		session.commit();
		return searchId;
	}
	
	
	
	
	
	
	
}
