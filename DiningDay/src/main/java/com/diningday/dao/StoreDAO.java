package com.diningday.dao;

import java.util.HashMap;
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
		
		int insertMenu = session.insert("Store.menuInsert", dto); 
		
		session.commit();
		session.close();
		
		return insertMenu > 0 ? true : false;
	}
	
	public Boolean deleteMenu(Map<String, String[]> dto) {
		session = sqlSessionFactory.openSession();
		
		int deleteMenu = session.delete("Store.menuDelete", dto); 
		
		session.commit();
		session.close();
		
		return deleteMenu > 0 ? true : false;
	}
	
	public List<Map<String, String>> menuList(Map<String, String> dto) {
		session = sqlSessionFactory.openSession();
		
		List<Map<String, String>> menuList = session.selectList("Store.menuList", dto); 
		
		session.close();
		
		return menuList;
	}
	
	public boolean menuUpdate(Map<String, String> dto) {
		session = sqlSessionFactory.openSession();
		
		int updateMenu = session.update("Store.menuUpdate", dto); 
		
		session.commit();
		session.close();
		
		return updateMenu > 0 ? true : false;
	}
	
	public Map<String, String> menuSelect(Map<String, String> dto) {
		session = sqlSessionFactory.openSession();
		
		Map<String, String> select = session.selectOne("Store.menuSelect", dto); 

		session.close();
		
		return select;
	}
	
	public Map<String, String> menuMax(Map<String, String> dto) {
		session = sqlSessionFactory.openSession();
		
		Map<String, String> select = session.selectOne("Store.menuMax", dto); 
		
		session.close();
		
		return select;
	}
	
	public Map<String, String> ownerSelect(Map<String, String> dto) {
		session = sqlSessionFactory.openSession();
		
		Map<String, String> select = session.selectOne("Store.ownerSelect", dto); 
		
		session.close();
		
		return select;
	}
	
	public Map<String, String> storeSelect(Map<String, String> dto) {
		session = sqlSessionFactory.openSession();
		
		Map<String, String> select = session.selectOne("Store.storeSelect", dto); 
		
		session.close();
		
		return select;
	}
	
	public Boolean storeInsert(Map<String, String> dto) {
		session = sqlSessionFactory.openSession();
		
		int insertMenu = session.insert("Store.storeInsert", dto); 
		
		session.commit();
		session.close();
		
		return insertMenu > 0 ? true : false;
	}
	
	public Boolean firstInsertStore_OwnerUpdate(Map<String, String> dto) {
		session = sqlSessionFactory.openSession();
		
		int insertMenu = session.update("Store.firstInsertStore_OwnerUpdate", dto); 
		
		session.commit();
		session.close();
		
		return insertMenu > 0 ? true : false;
	}
	
	// ----------------- 01/17 준우 작성 건들 ㄴㄴ -------------------------------------------------
	public List<Map<String, String>> getReviewList(Map<String, String> reviewDTO) {
		session = sqlSessionFactory.openSession();
		System.out.println(reviewDTO);
		List<Map<String, String>> reviewLists = session.selectList("Store.getReviewList", reviewDTO);
		System.out.println(reviewLists);
		
		session.close();
		
		return reviewLists;
	}

	public Map<String, String> answerInsert(Map<String, String> answerDTO) {
		session = sqlSessionFactory.openSession();
		
		int insertMenu = session.insert("Store.answerInsert", answerDTO); 
		session.commit();
		
		Map<String, String> answer = session.selectOne("Store.getAnswer", answerDTO);
		
		session.close();
		
		return answer;
		
	}

	// -------------------여기 까지 s_review-------------------------------------------------------

	// 01/17_강현아 + 점주 정보 저장 및 수정

	public Map<String, String> getOwner(String OWN_NO) {
		session = sqlSessionFactory.openSession();
		Map<String, String> getOwner = session.selectOne("Store.getOwner", OWN_NO);
		session.close();
		return getOwner;
	}

	public boolean ownerEdit(Map<String, String> ownerDTO) {
		session = sqlSessionFactory.openSession();
		int ownerEdit = session.update("Store.ownerEdit", ownerDTO);
		System.out.println("ownerEdit: " + ownerEdit);
		session.commit();
		session.close();
		return ownerEdit > 0 ? true : false;
	}
}
