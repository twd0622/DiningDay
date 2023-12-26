package com.diningday.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.diningday.sql.SqlMapClient;

public class ExCustomerDAO {
	private SqlSessionFactory sqlSessionFactory = SqlMapClient.getSqlSessionFactory();
	SqlSession session = sqlSessionFactory.openSession();
	
	
	public Boolean insertExCustomer(Map<String, String> dto) {
		session = sqlSessionFactory.openSession();
		
		int insertExCustomer = session.insert("ExCustomer.insert", dto); // namespace.id
		
		session.commit();
		session.close();
		
		return insertExCustomer > 0 ? true : false;
	}
}
