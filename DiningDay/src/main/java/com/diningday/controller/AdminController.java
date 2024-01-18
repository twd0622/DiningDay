package com.diningday.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.diningday.service.AdminService;
import com.diningday.service.UserService;
import com.diningday.util.TeamUtil;

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
		HttpSession session = req.getSession();

		AdminService adminService = new AdminService();
		
		if(sPath.equals("/admin_main.ad")) {
			List<Map<String, String>> noticeList = adminService.getNoticeList();
			req.setAttribute("noticeList", noticeList);
			
			List<Map<String, String>> storeList = adminService.getStoreList();
			req.setAttribute("storeList", storeList);
			
			List<Map<String, String>> storeReport = adminService.getStoreReport();
			req.setAttribute("storeReport", storeReport);
			
			List<Map<String, String>> reviewReport = adminService.getReviewReport();
			req.setAttribute("reviewReport", reviewReport);
			
			dispatcher = req.getRequestDispatcher("Admin/admin_main.jsp");
			dispatcher.forward(req, res);
		}
//		----------------------------------------------------------------------------------------------------
		if(sPath.equals("/admin_noticeWrite.ad")) {
			Map<String, String> admin = adminService.admin();
			req.setAttribute("admin", admin);
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
		if(sPath.equals("/admin_noticeDelete.ad")) {
			String result = Integer.toString(adminService.noticeDelete(req));
			List<Map<String, String>> noticeList = adminService.getNoticeList();
			req.setAttribute("noticeList", noticeList);
			res.sendRedirect("admin_noticeList.ad");
		}
//		----------------------------------------------------------------------------------------------------
		if(sPath.equals("/admin_noticeList.ad")) {
			List<Map<String, String>> noticeList = adminService.getNoticeList(req);
			req.setAttribute("noticeList", noticeList);
			Map<String, String> noticeCount = adminService.noticeCount();
			req.setAttribute("noticeCount", noticeCount);
			dispatcher = req.getRequestDispatcher("Admin/admin_noticeList.jsp");
			dispatcher.forward(req, res);
		}
//		----------------------------------------------------------------------------------------------------		
		if(sPath.equals("/admin_noticeDetail.ad")) {
			System.out.println(req.getParameter("NOT_NO"));
			Map<String, String> noticeDetail = adminService.getNoticeDetail(req);
			Map<String, String> admin = adminService.admin();
			req.setAttribute("admin", admin);
			req.setAttribute("noticeDetail", noticeDetail);
			dispatcher = req.getRequestDispatcher("Admin/admin_noticeDetail.jsp");
			dispatcher.forward(req, res);
		}
//		----------------------------------------------------------------------------------------------------	
		if(sPath.equals("/admin_noticeUpdate.ad")) {
			Map<String, String> noticeDetail = adminService.getNoticeDetail(req);
			req.setAttribute("noticeDetail", noticeDetail);
			System.out.println(noticeDetail);
			String NOT_NO = req.getParameter("NOT_NO");
//			req.setAttribute("NOT_NO", NOT_NO);
			session.setAttribute("NOT_NO", NOT_NO);
			dispatcher = req.getRequestDispatcher("Admin/admin_noticeUpdate.jsp");
			dispatcher.forward(req, res);
		}
//		----------------------------------------------------------------------------------------------------
		if(sPath.equals("/admin_noticeUpdatePro.ad")) {
			req.setCharacterEncoding("UTF-8");
			String NOT_NO = session.getAttribute("NOT_NO").toString();
			Map<String, String> param = new HashMap<String, String>();
			param.put("NOT_NO", NOT_NO);
			req.setAttribute("noticeUpdate", adminService.noticeUpdate(req, param));
			
			
			res.sendRedirect("admin_noticeList.ad");
		}
//		----------------------------------------------------------------------------------------------------		
		if(sPath.equals("/admin_storeList.ad")) {
			List<Map<String, String>> storeList = adminService.getStoreList(req);
			req.setAttribute("storeList", storeList);
			Map<String, String> storeCount = adminService.storeCount();
			req.setAttribute("storeCount", storeCount);
			dispatcher = req.getRequestDispatcher("Admin/admin_storeList.jsp");
			dispatcher.forward(req, res);
		}
//		----------------------------------------------------------------------------------------------------	
		if(sPath.equals("/admin_storeDelete.ad")) {
			String result = Integer.toString(adminService.storeDelete(req));
			
			List<Map<String, String>> storeList = adminService.getStoreList();
			req.setAttribute("storeList", storeList);
			
			res.sendRedirect("admin_storeList.ad");
		}
//		----------------------------------------------------------------------------------------------------	
		if(sPath.equals("/admin_storeDetail.ad")) {
			System.out.println(req.getParameter("OWN_NO"));
			Map<String, String> storeDetail = adminService.getStoreDetail(req);
			req.setAttribute("storeDetail", storeDetail);
			dispatcher = req.getRequestDispatcher("Admin/admin_storeDetail.jsp");
			dispatcher.forward(req, res);
		}
//		----------------------------------------------------------------------------------------------------	
		if(sPath.equals("/admin_userList.ad")) {
			List<Map<String, String>> userList = adminService.getUserList(req);
			req.setAttribute("userList", userList);
			Map<String, String> userCount = adminService.userCount();
			req.setAttribute("userCount", userCount);
			dispatcher = req.getRequestDispatcher("Admin/admin_userList.jsp");
			dispatcher.forward(req, res);
		}
//		----------------------------------------------------------------------------------------------------
		if(sPath.equals("/admin_userDelete.ad")) {
			String result = Integer.toString(adminService.userDelete(req));
			
			List<Map<String, String>> userList = adminService.getUserList();
			req.setAttribute("userList", userList);
			
			res.sendRedirect("admin_userList.ad");
		}
//		----------------------------------------------------------------------------------------------------
		if(sPath.equals("/admin_storeReport.ad")) {
			List<Map<String, String>> storeReport = adminService.getStoreReport(req);
			req.setAttribute("storeReport", storeReport);
			Map<String, String> sRepCount = adminService.sRepCount();
			req.setAttribute("sRepCount", sRepCount);
			dispatcher = req.getRequestDispatcher("Admin/admin_storeReport.jsp");
			dispatcher.forward(req, res);
		}
//		----------------------------------------------------------------------------------------------------	
		if(sPath.equals("/admin_storeReportDelete.ad")) {
			String result = Integer.toString(adminService.sRepReport(req));
			
			List<Map<String, String>> storeReport = adminService.getStoreReport();
			req.setAttribute("storeReport", storeReport);
			
			res.sendRedirect("admin_storeReport.ad");
		}
//		----------------------------------------------------------------------------------------------------
		if(sPath.equals("/admin_storeReportDetail.ad")) {
			System.out.println(req.getParameter("OWN_NO"));
			Map<String, String> sRepDetail = adminService.getSRepDetail(req);
			req.setAttribute("sRepDetail", sRepDetail);
			dispatcher = req.getRequestDispatcher("Admin/admin_storeReportDetail.jsp");
			dispatcher.forward(req, res);
		}
//		----------------------------------------------------------------------------------------------------
		if(sPath.equals("/admin_userReport.ad")) {
			List<Map<String, String>> reviewReport = adminService.getReviewReport(req);
			req.setAttribute("reviewReport", reviewReport);
			Map<String, String> cRepCount = adminService.cRepCount();
			req.setAttribute("cRepCount", cRepCount);
			dispatcher = req.getRequestDispatcher("Admin/admin_userReport.jsp");
			dispatcher.forward(req, res);
		}
//		----------------------------------------------------------------------------------------------------
		if(sPath.equals("/admin_userReportDelete.ad")) {
			String result = Integer.toString(adminService.cRepDelete(req));
			
			List<Map<String, String>> reviewReport = adminService.getReviewReport();
			req.setAttribute("reviewReport", reviewReport);
			
			res.sendRedirect("admin_userReport.ad");
		}
		
//		----------------------------------------------------------------------------------------------------
		if(sPath.equals("/admin_userReportDetail.ad")) {
			Map<String, String> cRepDetail = adminService.getCRepDetail(req);
			req.setAttribute("cRepDetail", cRepDetail);
			dispatcher = req.getRequestDispatcher("Admin/admin_userReportDetail.jsp");
			dispatcher.forward(req, res);
		}
//		----------------------------------------------------------------------------------------------------
		if(sPath.equals("/admin_reviewList.ad")) {
			List<Map<String, String>> reviewList = adminService.reviewList(req);
			req.setAttribute("reviewList", reviewList);
			dispatcher = req.getRequestDispatcher("Admin/admin_reviewList.jsp");
			dispatcher.forward(req, res);
		}
//		----------------------------------------------------------------------------------------------------
		if(sPath.equals("/admin_reviewDetail.ad")) {
			Map<String, String> reviewDetail = adminService.reviewDetail(req);
			req.setAttribute("reviewDetail", reviewDetail);
			Map<String, String> reviewComment = adminService.reviewComment(req);
			req.setAttribute("reviewComment", reviewComment);
			dispatcher = req.getRequestDispatcher("Admin/admin_reviewDetail.jsp");
			dispatcher.forward(req, res);
		}
//		----------------------------------------------------------------------------------------------------
		if(sPath.equals("/admin_reviewDelete.ad")) {
			String result = Integer.toString(adminService.reviewDelete(req));
			
			List<Map<String, String>> reviewList = adminService.reviewList();
			req.setAttribute("reviewList", reviewList);
			
			res.sendRedirect("admin_reviewList.ad");
		}
//		----------------------------------------------------------------------------------------------------
		if(sPath.equals("/companyIntro.ad")) {
			dispatcher = req.getRequestDispatcher("Main/companyIntro.jsp");
			dispatcher.forward(req, res);
		}
//		----------------------------------------------------------------------------------------------------
		if(sPath.equals("/notice.ad")) {
			List<Map<String, String>> noticeList = adminService.getNoticeList(req);
			req.setAttribute("noticeList", noticeList);
			dispatcher = req.getRequestDispatcher("Main/notice.jsp");
			dispatcher.forward(req, res);
		}
//		----------------------------------------------------------------------------------------------------		
		if(sPath.equals("/noticeDetail.ad")) {
			System.out.println(req.getParameter("NOT_NO"));
			Map<String, String> noticeDetail = adminService.getNoticeDetail(req);
			req.setAttribute("noticeDetail", noticeDetail);
			dispatcher = req.getRequestDispatcher("Main/noticeDetail.jsp");
			dispatcher.forward(req, res);
		}
//		----------------------------------------------------------------------------------------------------		
		if(sPath.equals("/logout.ad")) {
			session.invalidate();
			res.sendRedirect("main.ma");
		}
		
	} // doProcess()
}
