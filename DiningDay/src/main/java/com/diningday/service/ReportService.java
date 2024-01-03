package com.diningday.service;

import javax.servlet.http.HttpServletRequest;

import com.diningday.dao.ReportDAO;
import com.diningday.util.TeamUtil;

public class ReportService {
	ReportDAO reportDAO = null;
	public void insertReport(HttpServletRequest req) {
		System.out.println("insertReport()");
		// DAO 객체생성
		reportDAO = new ReportDAO(); 
		// request 파라미터값 가져오기
		
		reportDAO.insertReport(TeamUtil.fileRequestToMap(req));
		
	}

}
