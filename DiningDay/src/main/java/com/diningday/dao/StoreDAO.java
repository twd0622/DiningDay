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
		
		int insert = session.insert("Store.menuInsert", dto); 
		
		session.commit();
		session.close();
		
		return insert > 0 ? true : false;
	}
	
	public Boolean deleteMenu(Map<String, String[]> dto) {
		session = sqlSessionFactory.openSession();
		
		int delete = session.delete("Store.menuDelete", dto); 
		
		session.commit();
		session.close();
		
		return delete > 0 ? true : false;
	}
	
	public List<Map<String, String>> menuList(Map<String, String> dto) {
		session = sqlSessionFactory.openSession();
		
		List<Map<String, String>> menuList = session.selectList("Store.menuList", dto); 
		
		session.close();
		
		return menuList;
	}
	
	public boolean menuUpdate(Map<String, String> dto) {
		session = sqlSessionFactory.openSession();
		
		int update = session.update("Store.menuUpdate", dto); 
		
		session.commit();
		session.close();
		
		return update > 0 ? true : false;
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
		
		int insert = session.insert("Store.storeInsert", dto); 
		
		session.commit();
		session.close();
		
		return insert > 0 ? true : false;
	}
	
	public Boolean firstInsertStore_OwnerUpdate(Map<String, String> dto) {
		session = sqlSessionFactory.openSession();
		
		int update = session.update("Store.firstInsertStore_OwnerUpdate", dto); 
		
		session.commit();
		session.close();
		
		return update > 0 ? true : false;
	}
	
//	---	좌석 시작 ----	
	
	public Boolean seatInsert(Map<String, String> dto) {
		session = sqlSessionFactory.openSession();
		
		int insert = session.insert("Store.seatInsert", dto); 
		
		session.commit();
		session.close();
		
		return insert > 0 ? true : false;
	}
	
	public List<Map<String, String>> seatSelectList(Map<String, String> dto) {
		session = sqlSessionFactory.openSession();
		
		List<Map<String, String>> select = session.selectList("Store.seatSelectList", dto); 
		
		session.close();
		
		return select;
	}
	
	public List<Map<String, String>> stableResCheck(Map<String, String> dto) {
		session = sqlSessionFactory.openSession();
		
		List<Map<String, String>> select = session.selectList("Store.stableResCheck", dto); 
		Map<String, String> dtotoList = new HashMap<String, String>();
		
		dtotoList.put("REQ_STATE", "false");
		
		session.close();
		
		if(select.size() < 1) {
			select.add(dtotoList);
		}
		
		return select;
	}
	
	public boolean seatDelete(Map<String, String> dto) {
		session = sqlSessionFactory.openSession();
		
		int delete = session.delete("Store.seatDelete", dto); 
		
		session.commit();
		session.close();
		
		return delete > 0 ? true : false;
	}
	
	public boolean seatUpdate(Map<String, String> dto) {
		session = sqlSessionFactory.openSession();
		
		int update = session.update("Store.seatUpdate", dto); 
		
		session.commit();
		session.close();
		
		return update > 0 ? true : false;
	}

//	---	좌석 끝 ----	
	
//	--- 예약 시작 ---
	
	public List<Map<String, String>> resSelectList(Map<String, String> dto) {
		session = sqlSessionFactory.openSession();
		
		List<Map<String, String>> select = session.selectList("Store.resSelectList", dto); 
		
		session.close();
		
		return select;
	}
	
	public boolean resUpdate(Map<String, String> dto) {
		session = sqlSessionFactory.openSession();
		
		int update = session.update("Store.resUpdate", dto); 
		
		session.commit();
		session.close();
		
		return update > 0 ? true : false;
	}
	
	public Map<String, String> resSelect(Map<String, String> dto) {
		session = sqlSessionFactory.openSession();
		
		Map<String, String> select = session.selectOne("Store.resSelect", dto); 
		
		session.close();
		
		return select;
	}
	
	public List<Map<String, String>> resMonthSelect(Map<String, String> dto) {
		session = sqlSessionFactory.openSession();
		
		List<Map<String, String>> select = session.selectList("Store.resMonthSelect", dto); 
		
		session.close();
		
		return select;
	}

	public List<Map<String, String>> resWeekSelect(Map<String, String> dto) {
		session = sqlSessionFactory.openSession();

		List<Map<String, String>> select = session.selectList("Store.resWeekSelect", dto); 
		
		session.close();
		
		return select;
	}
	
//	--- 예약 끝 ---	
	
	// ----------------- 01/17 준우 작성 건들 ㄴㄴ -------------------------------------------------
	public List<Map<String, String>> getReviewList(Map<String, String> reviewDTO) {
		session = sqlSessionFactory.openSession();
		List<Map<String, String>> reviewLists = session.selectList("Store.getReviewList", reviewDTO);
		
		session.close();
		
		return reviewLists;
	}

	public Map<String, String> answerInsert(Map<String, String> answerDTO) {
		session = sqlSessionFactory.openSession();
		
		session.insert("Store.answerInsert", answerDTO); 
		session.commit();
		
		Map<String, String> answer = session.selectOne("Store.getAnswer", answerDTO);
		
		session.close();
		
		return answer;
		
	}
	
	public Map<String, String> answerUpdate(Map<String, String> answerDTO) {
		session = sqlSessionFactory.openSession();
		
		session.update("Store.answerUpdate", answerDTO); 
		session.commit();
		
		Map<String, String> answer = session.selectOne("Store.getAnswer", answerDTO);
		
		session.close();
		
		return answer;
		
	}
	
	public Map<String, String> getReviewInfo(String STORE_NO) {
		session = sqlSessionFactory.openSession();
		
		Map<String, String> reviewInfo = session.selectOne("Store.getReviewInfo", STORE_NO);
		
		session.close();
		
		return reviewInfo;
	}
	
	public int insertReviewReport(Map<String, String> reportDTO) {
		session = sqlSessionFactory.openSession();
		
		int result = session.insert("Store.insertReviewReport", reportDTO); 
		session.commit();
		session.close();
		
		return result;
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
		session.commit();
		session.close();
		return ownerEdit > 0 ? true : false;
	}

}
