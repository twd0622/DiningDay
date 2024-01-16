package com.diningday.dao;

import java.util.List;
import java.util.Map;

import org.apache.coyote.Request;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.diningday.sql.SqlMapClient;

public class AdminDAO {

	private SqlSessionFactory sqlSessionFactory = SqlMapClient.getSqlSessionFactory();
	SqlSession session;
	
	public Map<String, String> admin() {
		session = sqlSessionFactory.openSession();
		
		Map<String, String> admin = session.selectOne("Admin.admin"); // namespace.id
		
		
		session.close();
		
		return admin;
	}
	
	public boolean insertBoard(Map<String, String> adminDTO) {
		session = sqlSessionFactory.openSession();
		int insertBoard = session.insert("Admin.noticeInsert", adminDTO); // namespace.id
		
		session.commit();
		session.close();
		
		return insertBoard > 0 ? true : false;
	}
	
	public boolean noticeUpdate(Map<String, String> adminDTO) {
		session = sqlSessionFactory.openSession();
		int updateNotice = session.update("Admin.noticeUpdate", adminDTO); // namespace.id
		System.out.println("updateNotice: " + updateNotice);
		
		session.commit();
		session.close();
		
		return updateNotice > 0 ? true : false;
		
	}
	
	public int noticeDelete(Map<String, String> adminDTO) {
		session = sqlSessionFactory.openSession();
		
		int noticeDelete = session.delete("Admin.noticeDelete", adminDTO); // namespace.id
		
		session.commit();
		session.close();
		
		return noticeDelete;
	}

	public List<Map<String, String>> getNoticeList() {
		session = sqlSessionFactory.openSession();
		
		List<Map<String, String>> noticeList = session.selectList("Admin.selectNoticeList"); // namespace.id
		
		
		session.close();
		
		return noticeList;
	}
	
	public List<Map<String, String>> getNoticeList(Map<String, String> requestToMap) {
		session = sqlSessionFactory.openSession();
		List<Map<String, String>> noticeList = session.selectList("Admin.selectNoticeList", requestToMap); // namespace.id
		
		session.close();
		
		return noticeList;
	}
	
	public Map<String, String> getNoticeDetail(Map<String, String> adminDTO) {
		session = sqlSessionFactory.openSession();
		Map<String, String> noticeDetail = session.selectOne("Admin.selectNoticeDetail", adminDTO); // namespace.id
		
		session.close();
		
		return noticeDetail;
	}

	public List<Map<String, String>> getStoreList() {
		session = sqlSessionFactory.openSession();
		List<Map<String, String>> storeList = session.selectList("Admin.selectStoreList"); // namespace.id
		
		session.close();
		
		return storeList;
	}
	
	public List<Map<String, String>> getStoreList(Map<String, String> requestToMap) {
		session = sqlSessionFactory.openSession();
		List<Map<String, String>> storeList = session.selectList("Admin.selectStoreList", requestToMap); // namespace.id
		
		session.close();
		
		return storeList;
	}
	
	public int storeDelete(Map<String, String> adminDTO) {
		session = sqlSessionFactory.openSession();
		
		int storeDelete = session.delete("Admin.storeDelete", adminDTO); // namespace.id
		
		session.commit();
		session.close();
		
		return storeDelete;
	}
	
	public Map<String, String> getStoreDtail(Map<String, String> adminDTO) {
		session = sqlSessionFactory.openSession();
		Map<String, String> storeDetail = session.selectOne("Admin.selectStoreDetail", adminDTO); // namespace.id
		
		session.close();
		
		return storeDetail;
	}

	public List<Map<String, String>> getUserList() {
		session = sqlSessionFactory.openSession();
		List<Map<String, String>> userList = session.selectList("Admin.selectUserList"); // namespace.id
		
		session.close();
		
		return userList;
	}
	
	public List<Map<String, String>> getUserList(Map<String, String> requestToMap) {
		session = sqlSessionFactory.openSession();
		List<Map<String, String>> userList = session.selectList("Admin.selectUserList", requestToMap); // namespace.id
		
		session.close();
		
		return userList;
	}
	
	public int userDelete(Map<String, String> adminDTO) {
		session = sqlSessionFactory.openSession();
		
		int userDelete = session.delete("Admin.userDelete", adminDTO); // namespace.id
		
		session.commit();
		session.close();
		
		return userDelete;
	}

	public List<Map<String, String>> getStoreReport() {
		session = sqlSessionFactory.openSession();
		List<Map<String, String>> storeReport = session.selectList("Admin.selectStoreReport"); // namespace.id
		
		session.close();
		
		return storeReport;
	}
	
	public List<Map<String, String>> getStoreReport(Map<String, String> requestToMap) {
		session = sqlSessionFactory.openSession();
		List<Map<String, String>> storeReport = session.selectList("Admin.selectStoreReport", requestToMap); // namespace.id
		
		session.close();
		
		return storeReport;
	}
	
	public int sRepReport(Map<String, String> adminDTO) {
		session = sqlSessionFactory.openSession();
		
		int sRepReport = session.delete("Admin.sRepReport", adminDTO); // namespace.id
		
		session.commit();
		session.close();
		
		return sRepReport;
	}
	
	public Map<String, String> getSRepDetail(Map<String, String> adminDTO) {
		session = sqlSessionFactory.openSession();
		Map<String, String> sRepDetail = session.selectOne("Admin.selectSRepDetail", adminDTO); // namespace.id
		
		session.close();
		
		return sRepDetail;
	}

	public List<Map<String, String>> getReviewReport() {
		session = sqlSessionFactory.openSession();
		List<Map<String, String>> reviewReport = session.selectList("Admin.selectReviewReport"); // namespace.id
		
		session.close();
		
		return reviewReport;
	}
	
	public List<Map<String, String>> getReviewReport(Map<String, String> requestToMap) {
		session = sqlSessionFactory.openSession();
		List<Map<String, String>> reviewReport = session.selectList("Admin.selectReviewReport", requestToMap); // namespace.id
		
		session.close();
		
		return reviewReport;
	}
	
	public int cRepDelete(Map<String, String> adminDTO) {
		session = sqlSessionFactory.openSession();
		
		int cRepDelete = session.delete("Admin.cRepDelete", adminDTO); // namespace.id
		
		session.commit();
		session.close();
		
		return cRepDelete;
	}

	public Map<String, String> getCRepDetail(Map<String, String> adminDTO) {
		session = sqlSessionFactory.openSession();
		Map<String, String> cRepDetail = session.selectOne("Admin.selectCRepDetail", adminDTO); // namespace.id
		
		session.close();
		
		return cRepDetail;
	}
	
	public List<Map<String, String>> reviewList() {
		session = sqlSessionFactory.openSession();
		
		List<Map<String, String>> reviewList = session.selectList("Admin.reviewList"); // namespace.id
		
		session.close();
		
		return reviewList;
	}
	
	public List<Map<String, String>> reviewComment() {
		session = sqlSessionFactory.openSession();
		
		List<Map<String, String>> reviewComment = session.selectList("Admin.reviewComment"); // namespace.id
		
		session.close();
		
		return reviewComment;
	}
	
}
