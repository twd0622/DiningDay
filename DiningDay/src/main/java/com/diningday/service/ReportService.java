package com.diningday.service;

import javax.servlet.http.HttpServletRequest;

import com.diningday.util.TeamUtil;

public class ReportService {

	public void insertReport(HttpServletRequest req) {
		System.out.println("insertReport()");
		// DAO 객체생성
		
		// request 파라미터값 가져오기
		System.out.println(TeamUtil.requestToMap(req));
		
		
	}

}
