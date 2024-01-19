package com.diningday.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.diningday.service.AdminService;
import com.diningday.service.Review_ReportService;
import com.diningday.util.TeamUtil;

public class Review_ReportController extends HttpServlet {
	RequestDispatcher dispatcher = null;
	AdminService adminService = null;
	Review_ReportService review_ReportService = null;


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doProcess(req, res);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doProcess(req, res);
		
	}
	
	
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String sPath = req.getServletPath();
		System.out.println(sPath);
		
		if(sPath.equals("/reportWrite.re")) {
			System.out.println("/reportWrite.re");
			req.setAttribute("STORE_NO", req.getParameter("STORE_NO"));
			req.setAttribute("STORE_NAME", req.getParameter("STORE_NAME"));
			dispatcher = req.getRequestDispatcher("Review_Report/reportWrite.jsp");
			dispatcher.forward(req, res);
		}
		
		if(sPath.equals("/reportWritePro.re")) {
			System.out.println("/reportWritePro.re");
			review_ReportService = new Review_ReportService();
			
			review_ReportService.insertReport(req);
			res.sendRedirect("main.ma");
		}
		
		if(sPath.equals("/reviewWrite.re")) {
			System.out.println("/reviewWrite.re");
			review_ReportService = new Review_ReportService();
			HttpSession session = req.getSession();
			
			
			req.setAttribute("nick", review_ReportService.getNick((String)session.getAttribute("CUS_NO")));
			req.setAttribute("RES_NO", req.getParameter("RES_NO"));
			req.setAttribute("store_name", req.getParameter("STORE_NAME"));
			dispatcher = req.getRequestDispatcher("Review_Report/reviewWrite.jsp");
			dispatcher.forward(req, res);
		}
		
		if(sPath.equals("/reviewWritePro.re")) {
			System.out.println("/reviewWritePro.re");
			String content = req.getParameter("rev_content");
			System.out.println(content);
			String score = req.getParameter("rev_score");
			System.out.println(score);
			
			Map<String, String> review_ReportDTO = TeamUtil.fileRequestToMap(req);
			System.out.println(review_ReportDTO);
			review_ReportService = new Review_ReportService();
			review_ReportService.insertReview(review_ReportDTO);
			res.sendRedirect("mypage.cu");
		}
		
		if(sPath.equals("/store_review.re")) {
			review_ReportService = new Review_ReportService();
			
			req.setAttribute("storeReviewList", review_ReportService.getStore_review(req)); 
			
			dispatcher = req.getRequestDispatcher("Review_Report/store_review.jsp");
			dispatcher.forward(req, res);
			
		}
		
	}
}
