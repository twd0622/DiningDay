package com.diningday.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.diningday.sql.SqlMapClient;

public class MainDAO {
	
	private SqlSessionFactory sqlSessionFactory = SqlMapClient.getSqlSessionFactory();
	SqlSession session;
	
	public List<Map<String, String>> searchResult(Map<String, String> searchDTO) {
		session = sqlSessionFactory.openSession();
		List<Map<String, String>> searchList = session.selectList("Main.getMainInfo", searchDTO);
		
		session.close();
		
		return searchList;
	}

	public int searchCount(Map<String, String> searchDTO) {
		session = sqlSessionFactory.openSession();
		
		int searchCount = session.selectOne("Main.searchCount", searchDTO);
		
		session.close();
		
		return searchCount;
	}

	public Map<String, String> getStore(Map<String, String> storeDTO) {
		session = sqlSessionFactory.openSession();
		
		Map<String, String> storeInfo = session.selectOne("Main.getStore", storeDTO);
		System.out.println(storeInfo);
		session.close();
		
		return storeInfo;
	}

	public List<Map<String, String>> getMenuList(Map<String, String> storeDTO) {
		session = sqlSessionFactory.openSession();
		
		List<Map<String, String>> menuList = session.selectList("Main.getMenuList", storeDTO);
		session.close();
		
		return menuList;
	}

	public List<Map<String, String>> getTableList(Map<String, String> storeDTO) {
		session = sqlSessionFactory.openSession();
		
		List<Map<String, String>> tableList = session.selectList("Main.getTableList", storeDTO);
		
		session.close();
		
		return tableList;
	}

	public Map<String, String> getTable(Map<String, String> storeDTO) {
		session = sqlSessionFactory.openSession();
		
		Map<String, String> table = session.selectOne("Main.getTable", storeDTO);
		
		session.close();
		
		return table;
	}

	public Map<String, String> getLike(Map<String, String> dto) {
		session = sqlSessionFactory.openSession();
		
		Map<String, String> Like = session.selectOne("Main.getLike", dto);
		
		session.close();
		
		return Like;
	}

	public int insertLike(Map<String, String> dto) {
		session = sqlSessionFactory.openSession();
		
		int result = session.insert("Main.insertLike", dto);
		
		session.commit();
		session.close();
		
		return result;
	}

	public int deleteLike(Map<String, String> dto) {
		session = sqlSessionFactory.openSession();
		
		int result = session.delete("Main.deleteLike", dto);
		
		session.commit();
		session.close();
		
		return result;
	}

	public List<Map<String, String>> getResTime(Map<String, String> storeDTO) {
		session = sqlSessionFactory.openSession();
		
		List<Map<String, String>> resTime = session.selectList("Main.getResTime", storeDTO);
		
		
		session.close();
		
		return resTime;
	}
	
	public List<Map<String, String>> getMainInfo(Map<String, String> requestToMap) {
		session = sqlSessionFactory.openSession();
		List<Map<String, String>> mainInfo = session.selectList("Main.getMainInfo", requestToMap);
		session.close();
		
		return mainInfo;
	}
	
	

}
