package com.diningday.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.diningday.dao.AdminDAO;
import com.diningday.util.TeamUtil;

public class AdminService {
	
	AdminDAO adminDAO = new AdminDAO();

	public boolean insertBoard(HttpServletRequest req) {
		// request 파라미터값 가져오기
		Map<String, String> boardDTO = TeamUtil.requestToMap(req);
//		boardDTO.put("NOT_DATE", LocalDateTime.now().toString());
		
		
		
		return adminDAO.insertBoard(boardDTO);
		
	}
	
	public boolean updateBoard(HttpServletRequest req) {
		// request 파라미터값 가져오기
		Map<String, String> boardDTO = TeamUtil.requestToMap(req);
//		boardDTO.put("NOT_DATE", LocalDateTime.now().toString());
		
		
		
		return adminDAO.updateBoard(boardDTO);
		
	}

	public List<Map<String, String>> getNoticeList() {
		List<Map<String, String>> noticeList = adminDAO.getNoticeList();
		
		return noticeList;
		
	}

	public Map<String, String> getNoticeDetail(HttpServletRequest req) {
		Map<String, String> noticeDetail = TeamUtil.requestToMap(req);
		
		return adminDAO.getNoticeDetail(noticeDetail);
		
	}
	
	public List<Map<String, String>> getStoreList() {
		List<Map<String, String>> storeList = adminDAO.getStoreList();
		return storeList;
	}

	public List<Map<String, String>> getUserList() {
		List<Map<String, String>> userList = adminDAO.getUserList();
		return userList;
	}

	public List<Map<String, String>> getStoreReport() {
		List<Map<String, String>> storeReport = adminDAO.getStoreReport();
		return storeReport;
	}
	
	public List<Map<String, String>> getReviewReport() {
		List<Map<String, String>> reviewReport = adminDAO.getReviewReport();
		return reviewReport;
	}
	
	
}
