package com.diningday.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.diningday.dao.UserDAO;
import com.diningday.service.UserService;

public class UserController extends HttpServlet {
	RequestDispatcher dispatcher = null;
	
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
		
		UserService userService = new UserService();
		
		if(sPath.equals("/login.me")) {
			dispatcher = req.getRequestDispatcher("user/2_login.jsp");
			dispatcher.forward(req, res);
		}
		
		if(sPath.equals("/insert.me")) {
			dispatcher = req.getRequestDispatcher("user/1_insert.jsp");
			dispatcher.forward(req, res);
		}
		
		if(sPath.equals("/insertPro.me")) {
			boolean result = userService.insertUser(req);
			
			if (result) res.sendRedirect("login.me");
			else		res.sendRedirect("insert.me");
;		}
	}
}
