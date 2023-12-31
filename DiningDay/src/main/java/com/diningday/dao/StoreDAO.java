package com.diningday.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.diningday.sql.SqlMapClient;


public class StoreDAO {

	private SqlSessionFactory sqlSessionFactory = SqlMapClient.getSqlSessionFactory();
	SqlSession session;
	
	
	public Boolean insertMenu(Map<String, String> dto) {
		session = sqlSessionFactory.openSession();
		
		int insertMenu = session.insert("Menu.menuInsert", dto); 
		
		session.commit();
		session.close();
		
		return insertMenu > 0 ? true : false;
	}
	
	public Boolean deleteMenu(Map<String, String[]> dto) {
		session = sqlSessionFactory.openSession();
		
		int deleteMenu = session.delete("Menu.menuDelete", dto); 
		
		session.commit();
		session.close();
		
		return deleteMenu > 0 ? true : false;
	}
	
	public List<Map<String, String>> menuList(Map<String, String> dto) {
		session = sqlSessionFactory.openSession();
		
		List<Map<String, String>> menuList = session.selectList("Menu.menuList", dto); 
		
		session.close();
		
		return menuList;
	}
	
	public boolean menuUpdate(Map<String, String> dto) {
		session = sqlSessionFactory.openSession();
		
		int updateMenu = session.update("Menu.menuUpdate", dto); 
		
		session.commit();
		session.close();
		
		return updateMenu > 0 ? true : false;
	}
	
	public Map<String, String> menuSelect(Map<String, String> dto) {
		session = sqlSessionFactory.openSession();
		
		Map<String, String> select = session.selectOne("Menu.menuSelect", dto); 

		session.close();
		
		return select;
	}
	
	public Map<String, String> menuMax(Map<String, String> dto) {
		session = sqlSessionFactory.openSession();
		
		Map<String, String> select = session.selectOne("Menu.menuMax", dto); 
		
		session.close();
		
		return select;
	}
}
