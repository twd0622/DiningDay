package com.diningday.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.diningday.sql.SqlMapClient;

public class MainDAO {
	
	private SqlSessionFactory sqlSessionFactory = SqlMapClient.getSqlSessionFactory();
	SqlSession session = sqlSessionFactory.openSession();
	
	public List<Map<String, String>> searchResult(Map<String, String> searchDTO) {
		session = sqlSessionFactory.openSession();
		
		List<Map<String, String>> searchList = session.selectList("Main.searchList", searchDTO);
		
		session.close();
		
		return searchList;
	}

	public int searchCount(Map<String, String> searchDTO) {
		session = sqlSessionFactory.openSession();
		
		int searchCount = session.selectOne("Main.searchCount", searchDTO);
		
		session.close();
		
		return searchCount;
	}

}
