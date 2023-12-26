package com.diningday.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.diningday.service.CustomerService;

public class CustomerController extends HttpServlet {
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
		
		CustomerService customerService = new CustomerService();
		
		if(sPath.equals("/login.cu")) {
			dispatcher = req.getRequestDispatcher("Customer/login.jsp");
			dispatcher.forward(req, res);
		}
		
		if(sPath.equals("/loginPro.cu")) {
		boolean result = customerService.insertCustomer(req);
		
		if (result) res.sendRedirect("login.cu");
//		else		res.sendRedirect("insert.cu");
		}
		
		if(sPath.equals("/main.cu")) {
			dispatcher = req.getRequestDispatcher("Main/main.jsp");
			dispatcher.forward(req, res);
		}
		
//		-------------------------------------------------------------
		
		if(sPath.equals("/mypage.cu")) {
			dispatcher = req.getRequestDispatcher("Customer/mypage.jsp");
			dispatcher.forward(req, res);
		}	
		
		if(sPath.equals("/cus_edit.cu")) {
			dispatcher = req.getRequestDispatcher("Customer/cus_edit.jsp");
			dispatcher.forward(req, res);
		}	
		
//		-------------------------------------------------------------
		
		if(sPath.equals("/logout.cu")) {
			System.out.println("주소비교 /logout.me 일치");
			HttpSession session = req.getSession();
			
			session.invalidate();
			
			res.sendRedirect("main.cu");
		}
		
		
		
		
	}
}