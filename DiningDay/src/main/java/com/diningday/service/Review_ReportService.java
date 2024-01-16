package com.diningday.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.diningday.dao.Review_ReportDAO;
import com.diningday.util.TeamUtil;

public class Review_ReportService {
	Review_ReportDAO review_ReportDAO = null;
	public void insertReport(HttpServletRequest req) {
		System.out.println("insertReport()");
		// DAO 객체생성
		review_ReportDAO = new Review_ReportDAO(); 
		// request 파라미터값 가져오기
		
		review_ReportDAO.insertReport(TeamUtil.fileRequestToMap(req));
		
	}
	
	public void insertReview(Map<String, String> review_ReportDTO) {
		System.out.println("insertReview()");
		
		review_ReportDAO = new Review_ReportDAO();
		
		review_ReportDAO.insertReview(review_ReportDTO);
		
	}

}
