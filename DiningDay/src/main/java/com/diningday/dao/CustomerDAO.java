package com.diningday.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.diningday.sql.SqlMapClient;

public class CustomerDAO {
	private SqlSessionFactory sqlSessionFactory = SqlMapClient.getSqlSessionFactory();
	SqlSession session = sqlSessionFactory.openSession();
	
	
	public Boolean insertCustomer(Map<String, String> dto) {
		session = sqlSessionFactory.openSession();
		
		int insertCustomer = session.insert("Customer.insert", dto); // namespace.id
		
		session.commit();
		session.close();
		
		return insertCustomer > 0 ? true : false;
	}
}
