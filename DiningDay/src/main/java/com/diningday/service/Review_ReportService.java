package com.diningday.service;

import java.util.List;
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


	public String getNick(String CUS_NO) {
		review_ReportDAO = new Review_ReportDAO();
		
		return(review_ReportDAO.getNick(CUS_NO));
		
	}

	public List<Map<String,String>> getStore_review(HttpServletRequest req) {
		String STORE_NO = req.getParameter("STORE_NO");
		review_ReportDAO = new Review_ReportDAO();
		
		
		return review_ReportDAO.getSTORE_review(STORE_NO);
		
	}

	public Map<String,String> getStoreInfo(HttpServletRequest req) {
		String STORE_NO = req.getParameter("STORE_NO");
		review_ReportDAO = new Review_ReportDAO();
		
		
		return review_ReportDAO.getStoreInfo(STORE_NO);
	}

	public int reviewLikeUP(Map<String, String> reviewLikeDTO) {
		return review_ReportDAO.reviewLikeUP(reviewLikeDTO);
	}

	public int reviewLikeDOWN(Map<String, String> reviewLikeDTO) {
		return review_ReportDAO.reviewLikeDOWN(reviewLikeDTO);
	}

	public List<Map<String,String>> checkReviewLike(Map<String, String> reviewLikeDTO) {
		return review_ReportDAO.checkReviewLike(reviewLikeDTO);
		
	}


}
