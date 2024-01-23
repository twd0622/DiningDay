package com.diningday.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.diningday.sql.SqlMapClient;

public class CustomerDAO {
	private SqlSessionFactory sqlSessionFactory = SqlMapClient.getSqlSessionFactory();
	SqlSession session;
	
	public boolean insertCustomer(Map<String, String> customerDTO) {
		session = sqlSessionFactory.openSession();
		int insertCustomer = session.insert("Customer.insert", customerDTO); // namespace.id
		session.commit();
		session.close();
		return insertCustomer > 0 ? true : false;
	}
	
	public Map<String, String> searchId(Map<String, String> customerDTO) {
		session = sqlSessionFactory.openSession();
		Map<String, String> searchId = session.selectOne("Customer.searchId", customerDTO);
		session.close();
		return searchId;
	}

	public Map<String, String> getCustomer(String CUS_NO) {
		session = sqlSessionFactory.openSession();
		Map<String, String> customerInfo = session.selectOne("Customer.getCustomer", CUS_NO);
		session.close();
		return customerInfo;
	}

	public boolean customerEdit(Map<String, String> customerDTO) {
		session = sqlSessionFactory.openSession();
		int customerEdit = session.update("Customer.customerEdit", customerDTO);
		session.commit();
		session.close();
		return customerEdit > 0 ? true : false;
	}

	public void resetImage(String CUS_NO) {
		session = sqlSessionFactory.openSession();
		session.update("Customer.resetImage", CUS_NO);
		session.commit();
		session.close();
	}
	
	public Map<String, String> customerCheck(Map<String, String> customerDTO) {
		session = sqlSessionFactory.openSession();
		Map<String, String> customerCheck = session.selectOne("Customer.customerCheck", customerDTO);
		session.close();
		return customerCheck;
	}
	
	public void deleteCustomer(Map<String, String> customerCheck) {
		session = sqlSessionFactory.openSession();
		session.delete("Customer.deleteCustomer", customerCheck);
		session.commit();
		session.close();
	}
	
	// 01/08_준우 + 찜 목록 이동 기능
	public List<Map<String, String>> getLikeList(String CUS_NO) {
		session = sqlSessionFactory.openSession();
		List<Map<String, String>> LikeList = session.selectList("Customer.getLikeList", CUS_NO);
		session.close();
		
		return LikeList;
	}

	public List<Map<String, String>> getReservation(String CUS_NO) {
		session = sqlSessionFactory.openSession();
		List<Map<String, String>> reservationInfo = session.selectList("Customer.getReservation", CUS_NO);
		session.close();
		
		return reservationInfo;
	}
	
	public Map<String, String> reservationModal(String RES_NO) {
		session = sqlSessionFactory.openSession();
		Map<String, String> reservationModal = session.selectOne("Customer.reservationModal", RES_NO);
		session.close();
		
		return reservationModal;
	}
	
	public List<Map<String, String>> menuModal(String RES_NO) {
		session = sqlSessionFactory.openSession();
		List<Map<String, String>> menuModal = session.selectList("Customer.menuModal", RES_NO);
		session.close();
		
		return menuModal;
	}

	public boolean insertEx(Map<String, String> customerCheck) {
		session = sqlSessionFactory.openSession();
		int result = session.delete("Customer.insertEx", customerCheck);
		session.commit();
		session.close();
		return result > 0 ? true : false;
	}
	
	// 01/22_준우 + 자기가 쓴 리뷰 리스트 보기
	public List<Map<String, String>> cus_review(String CUS_NO) {
		session = sqlSessionFactory.openSession();
		List<Map<String, String>> reviewList = session.selectList("Customer.cus_review", CUS_NO);
		session.close();
		
		return reviewList;
	}

	public List<Map<String, String>> checkReviewLike(String cus_no) {
		session = sqlSessionFactory.openSession();
		List<Map<String, String>> reviewLikeCheckList = session.selectList("Customer.checkReviewLike", cus_no);
		session.close();
		
		return reviewLikeCheckList;
		
	}

	
	
	
	
	
	
	
}
