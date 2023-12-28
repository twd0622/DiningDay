package com.diningday.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.diningday.service.AdminService;
import com.diningday.service.UserService;

public class AdminController extends HttpServlet {
	RequestDispatcher dispatcher = null;
	AdminService adminService = null;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doProcess(req, res);
	} // doGet()s

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doProcess(req, res);
	} // doPost()

	protected void doProcess(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String sPath = req.getServletPath();

		AdminService adminService = new AdminService();
		
		if(sPath.equals("/admin_main.ad")) {
			dispatcher = req.getRequestDispatcher("Admin/admin_main.jsp");
			dispatcher.forward(req, res);
		}
//		----------------------------------------------------------------------------------------------------
		if(sPath.equals("/admin_noticeWrite.ad")) {
			dispatcher = req.getRequestDispatcher("Admin/admin_noticeWrite.jsp");
			dispatcher.forward(req, res);
		}
//		----------------------------------------------------------------------------------------------------
		if(sPath.equals("/admin_noticeWritePro.ad")) {
			req.setCharacterEncoding("UTF-8");
			
			boolean result = adminService.insertBoard(req);
			
			System.out.println(result);
			if(result) {
				res.sendRedirect("admin_noticeList.ad");
				return;
			} 

			res.sendRedirect("admin_noticeWrite.ad");
			
			
		}
//		----------------------------------------------------------------------------------------------------
		if(sPath.equals("/admin_noticeList.ad")) {
			List<Map<String, String>> noticeList = adminService.getNoticeList();
			req.setAttribute("noticeList", noticeList);
			dispatcher = req.getRequestDispatcher("Admin/admin_noticeList.jsp");
			dispatcher.forward(req, res);
			
		}
//		----------------------------------------------------------------------------------------------------		
		if(sPath.equals("/admin_noticeDetail.ad")) {
			List<Map<String, String>> noticeDetail = adminService.getNoticeDetail();
//			int num = Integer.parseInt(req.getParameter("num"));
			req.setAttribute("noticeDetail", noticeDetail);
			dispatcher = req.getRequestDispatcher("Admin/admin_noticeDetail.jsp");
			dispatcher.forward(req, res);
			
		}
//		----------------------------------------------------------------------------------------------------	
		if(sPath.equals("/admin_noticeUpdate.ad")) {
			dispatcher = req.getRequestDispatcher("Admin/admin_noticeUpdate.jsp");
			dispatcher.forward(req, res);
		}
//		----------------------------------------------------------------------------------------------------
		if(sPath.equals("/admin_noticeUpdatePro.ad")) {
			req.setCharacterEncoding("UTF-8");
			
			boolean result = adminService.updateBoard(req);
			
			System.out.println(result);
			if(result) {
				res.sendRedirect("admin_noticeList.ad");
				return;
			} 

			res.sendRedirect("admin_noticeUpdate.ad");
		}
//		----------------------------------------------------------------------------------------------------		
		if(sPath.equals("/admin_storeList.ad")) {
			List<Map<String, String>> storeList = adminService.getStoreList();
			req.setAttribute("storeList", storeList);
			dispatcher = req.getRequestDispatcher("Admin/admin_storeList.jsp");
			dispatcher.forward(req, res);
		}
//		----------------------------------------------------------------------------------------------------	
		if(sPath.equals("/admin_storeDetail.ad")) {
			dispatcher = req.getRequestDispatcher("Admin/admin_storeDetail.jsp");
			dispatcher.forward(req, res);
		}
//		----------------------------------------------------------------------------------------------------	
		if(sPath.equals("/admin_userList.ad")) {
			List<Map<String, String>> userList = adminService.getUserList();
			req.setAttribute("userList", userList);
			dispatcher = req.getRequestDispatcher("Admin/admin_userList.jsp");
			dispatcher.forward(req, res);
		}
//		----------------------------------------------------------------------------------------------------
		if(sPath.equals("/admin_storeReport.ad")) {
			List<Map<String, String>> storeReport = adminService.getStoreReport();
			req.setAttribute("storeReport", storeReport);
			dispatcher = req.getRequestDispatcher("Admin/admin_storeReport.jsp");
			dispatcher.forward(req, res);
		}
//		----------------------------------------------------------------------------------------------------
		if(sPath.equals("/admin_storeReportDetail.ad")) {
			dispatcher = req.getRequestDispatcher("Admin/admin_storeReportDetail.jsp");
			dispatcher.forward(req, res);
		}
//		----------------------------------------------------------------------------------------------------
		if(sPath.equals("/admin_userReport.ad")) {
			List<Map<String, String>> reviewReport = adminService.getReviewReport();
			req.setAttribute("reviewReport", reviewReport);
			dispatcher = req.getRequestDispatcher("Admin/admin_userReport.jsp");
			dispatcher.forward(req, res);
		}
//		----------------------------------------------------------------------------------------------------
		if(sPath.equals("/admin_userReportDetail.ad")) {
			dispatcher = req.getRequestDispatcher("Admin/admin_userReportDetail.jsp");
			dispatcher.forward(req, res);
		}
//		----------------------------------------------------------------------------------------------------
		if(sPath.equals("/admin_reviewList.ad")) {
			dispatcher = req.getRequestDispatcher("Admin/admin_reviewList.jsp");
			dispatcher.forward(req, res);
		}
		
	} // doProcess()
}
