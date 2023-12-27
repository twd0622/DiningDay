package com.diningday.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.diningday.sql.SqlMapClient;

public class AdminDAO {

	private SqlSessionFactory sqlSessionFactory = SqlMapClient.getSqlSessionFactory();
	SqlSession session = sqlSessionFactory.openSession();
	
	public boolean insertBoard(Map<String, String> boardDTO) {
		session = sqlSessionFactory.openSession();
		
		int insertBoard = session.insert("Admin.insert", boardDTO); // namespace.id
		
		session.commit();
		session.close();
		
		return insertBoard > 0 ? true : false;
	}

	
}
