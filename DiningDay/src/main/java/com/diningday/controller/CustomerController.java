package com.diningday.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.diningday.service.CustomerService;
import com.diningday.util.TeamUtil;

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
		HttpSession session = req.getSession();
		CustomerService customerService = new CustomerService();
		
		System.out.println(sPath);
		
		if(sPath.equals("/login.cu")) {
			dispatcher = req.getRequestDispatcher("Customer/login.jsp");
			dispatcher.forward(req, res);
		}
		
		
		if(sPath.equals("/loginPro.cu")) {
			boolean result = false;
			Map<String, String> searchId = customerService.searchId(req);
			
			// req id 값이 db에 있는 회원인지
			if(searchId == null || searchId.isEmpty()) {
				// 없으면 자동 회원가입 후 메인
				System.out.println("첫 회원가입 고객");
				result = customerService.insertCustomer(req);
				searchId = customerService.searchId(req);
			} else {
				// 있으면 그냥 세션값 넣고 메인
				System.out.println("이미 가입한 고객");
				result = true;
			}
			if(result) {
				session.setAttribute("CUS_NO", searchId.get("CUS_NO"));
				res.sendRedirect("main.ma");
			}
		}
		
		
		if(sPath.equals("/main.ma")) {
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
			session = req.getSession();
			session.invalidate();
			res.sendRedirect("main.ma");
		}
		
		
		
		
	}
	
}