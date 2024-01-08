package com.diningday.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.diningday.dao.AdminDAO;
import com.diningday.util.TeamUtil;

public class AdminService {
	
	AdminDAO adminDAO = new AdminDAO();

	public Map<String, String> admin() {
		Map<String, String> admin = adminDAO.admin();
		
		return admin;
		
	}
	
	public boolean insertBoard(HttpServletRequest req) {
		// request 파라미터값 가져오기
		Map<String, String> adminDTO = TeamUtil.requestToMap(req);
//		boardDTO.put("NOT_DATE", LocalDateTime.now().toString());
		
		return adminDAO.insertBoard(adminDTO);
		
	}
	
	public boolean noticeUpdate(HttpServletRequest req) {
//		boolean noticeUpdate = adminDAO.noticeUpdate(TeamUtil.requestToMap(req));
//		
//		return adminDAO.noticeUpdate(TeamUtil.fileRequestToMap(req));
		Map<String, String> adminDTO = TeamUtil.requestToMap(req);
		
		return adminDAO.noticeUpdate(adminDTO);
	}
	
	public int noticeDelete(HttpServletRequest req) {
		int noticeDelete = adminDAO.noticeDelete(TeamUtil.requestToMap(req));
		
		return noticeDelete;
	}


	public List<Map<String, String>> getNoticeList() {
		List<Map<String, String>> noticeList = adminDAO.getNoticeList();
		
		return noticeList;
		
	}

	public Map<String, String> getNoticeDetail(HttpServletRequest req) {
		
		return adminDAO.getNoticeDetail(TeamUtil.requestToMap(req));
	}
	
	public List<Map<String, String>> getStoreList() {
		List<Map<String, String>> storeList = adminDAO.getStoreList();
		return storeList;
	}
	
	public int storeDelete(HttpServletRequest req) {
		int storeDelete = adminDAO.storeDelete(TeamUtil.requestToMap(req));
		
		return storeDelete;
	}
	
	public Map<String, String> getStoreDetail(HttpServletRequest req) {
		
		return adminDAO.getStoreDtail(TeamUtil.requestToMap(req));
	}
	

	public List<Map<String, String>> getUserList() {
		List<Map<String, String>> userList = adminDAO.getUserList();
		return userList;
	}

	public int userDelete(HttpServletRequest req) {
		int userDelete = adminDAO.userDelete(TeamUtil.requestToMap(req));
		
		return userDelete;
	}
	
	public List<Map<String, String>> getStoreReport() {
		List<Map<String, String>> storeReport = adminDAO.getStoreReport();
		return storeReport;
	}
	
	public int sRepReport(HttpServletRequest req) {
		int sRepReport = adminDAO.sRepReport(TeamUtil.requestToMap(req));
		
		return sRepReport;
	}
	
	public Map<String, String> getSRepDetail(HttpServletRequest req) {
		
		return adminDAO.getSRepDetail(TeamUtil.requestToMap(req));
	}
	
	public List<Map<String, String>> getReviewReport() {
		List<Map<String, String>> reviewReport = adminDAO.getReviewReport();
		return reviewReport;
	}
	
	public int cRepDelete(HttpServletRequest req) {
		int cRepDelete = adminDAO.cRepDelete(TeamUtil.requestToMap(req));
		
		return cRepDelete;
	}
	
	public Map<String, String> getCRepDetail(HttpServletRequest req) {
		
		return adminDAO.getCRepDetail(TeamUtil.requestToMap(req));
	}
	
}
