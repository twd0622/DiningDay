package com.diningday.controller;

import java.io.IOException;

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
			adminService = new AdminService();
			boolean result = adminService.insertBoard(req);
			
			System.out.println(result);
			if(result) {
				res.sendRedirect("admin_noticeList.ad");
			} else {
				res.sendRedirect("admin_noticeWrite.ad");
			}
			
			
		}
//		----------------------------------------------------------------------------------------------------
		if(sPath.equals("/admin_noticeList.ad")) {
			dispatcher = req.getRequestDispatcher("Admin/admin_noticeList.jsp");
			dispatcher.forward(req, res);
		}
//		----------------------------------------------------------------------------------------------------		
		if(sPath.equals("/admin_userList.ad")) {
			dispatcher = req.getRequestDispatcher("Admin/admin_userList.jsp");
			dispatcher.forward(req, res);
		}
//		----------------------------------------------------------------------------------------------------	
	} // doProcess()
}
