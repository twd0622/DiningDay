package com.diningday.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.diningday.sql.SqlMapClient;


public class StoreDAO {

	private SqlSessionFactory sqlSessionFactory = SqlMapClient.getSqlSessionFactory();
	SqlSession session = sqlSessionFactory.openSession();
	
	
	public Boolean insertMenu(Map<String, String> dto) {
		session = sqlSessionFactory.openSession();
		
		int insertMenu = session.insert("Menu.insert", dto); 
		
		session.commit();
		session.close();
		
		return insertMenu > 0 ? true : false;
	}
	
	public List menuList(Map<String, String> dto) {
		session = sqlSessionFactory.openSession();
		
		List<Object> menuList = session.selectList("Menu.select", dto); 
		
		session.commit();
		session.close();
		
		return menuList;
	}
}
