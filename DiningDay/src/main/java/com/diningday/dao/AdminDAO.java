package com.diningday.dao;

import java.util.List;
import java.util.Map;

import org.apache.coyote.Request;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.diningday.sql.SqlMapClient;

public class AdminDAO {

	private SqlSessionFactory sqlSessionFactory = SqlMapClient.getSqlSessionFactory();
	SqlSession session = sqlSessionFactory.openSession();
	
	public boolean insertBoard(Map<String, String> adminDTO) {
		
		int insertBoard = session.insert("Admin.noticeInsert", adminDTO); // namespace.id
		
		session.commit();
		session.close();
		
		return insertBoard > 0 ? true : false;
	}
	
	public boolean updateBoard(Map<String, String> adminDTO) {
		session = sqlSessionFactory.openSession();
		int updateBoard = session.update("Admin.noticeUpdate", adminDTO); // namespace.id
		
		session.commit();
		session.close();
		
		return updateBoard > 0 ? true : false;
	}

	public List<Map<String, String>> getNoticeList() {
		
		List<Map<String, String>> noticeList = session.selectList("Admin.selectNoticeList"); // namespace.id
		
		session.close();
		
		return noticeList;
		
	}
	
	public Map<String, String> getNoticeDetail(Map<String, String> adminDTO) {
		session = sqlSessionFactory.openSession();
		Map<String, String> noticeDetail = session.selectOne("Admin.selectNoticeDetail", adminDTO); // namespace.id
		
		session.commit();
		session.close();
		
		return noticeDetail;
		
	}

	public List<Map<String, String>> getStoreList() {
		
		List<Map<String, String>> storeList = session.selectList("Admin.selectStoreList"); // namespace.id
		
		session.close();
		
		return storeList;
		
	}

	public List<Map<String, String>> getUserList() {
		
		List<Map<String, String>> userList = session.selectList("Admin.selectUserList"); // namespace.id
		
		session.close();
		
		return userList;
		
	}

	public List<Map<String, String>> getStoreReport() {

		List<Map<String, String>> storeReport = session.selectList("Admin.selectStoreReport"); // namespace.id
		
		return storeReport;
	}

	public List<Map<String, String>> getReviewReport() {
		
		List<Map<String, String>> reviewReport = session.selectList("Admin.selectReviewReport"); // namespace.id
		
		return reviewReport;
	}

	
}
