package com.diningday.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.diningday.sql.SqlMapClient;

public class StoreDAO {
	private SqlSessionFactory sqlSessionFactory = SqlMapClient.getSqlSessionFactory();
	SqlSession session = sqlSessionFactory.openSession();

	public List<Map<String, String>> getLocation2(Map<String, String> locationDTO) {
		session = sqlSessionFactory.openSession();
		
		List<Map<String, String>> locatonList = session.selectList("Location.selectList", locationDTO);
		
		session.close();
		
		return locatonList;
		
	}

}
