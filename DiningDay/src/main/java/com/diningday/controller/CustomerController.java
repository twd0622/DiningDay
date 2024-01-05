package com.diningday.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
			System.out.println("req: " + req.toString());
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
				session.setAttribute("CUS_NICK", searchId.get("CUS_NICK"));
				session.setAttribute("date", LocalDate.now().format(DateTimeFormatter.ofPattern("YYYY-MM-dd")));
				session.setAttribute("people", "2");
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
			String CUS_NO = (String) session.getAttribute("CUS_NO");
			// 정보 확인
			req.setAttribute("customerInfo", customerService.getCustomer(CUS_NO));
			
			dispatcher = req.getRequestDispatcher("Customer/cus_edit.jsp");
			dispatcher.forward(req, res);
		}	
		
		if(sPath.equals("/cus_editPro.cu")) {			
			// 정보 수정
			Map<String, String> param = new HashMap<String, String>();
			param.put("CUS_NO", session.getAttribute("CUS_NO").toString());
			req.setAttribute("customerEdit", customerService.customerEdit(req, param));
			session.setAttribute("CUS_NICK", req.getParameter("CUS_NICK"));
			res.sendRedirect("mypage.cu");
		}
		
//		-------------------------------------------------------------
		
		if(sPath.equals("/logout.cu")) {
			session.invalidate();
			res.sendRedirect("main.ma");
		}
		
		if(sPath.equals("/deletePro.cu")) {
			Map<String, String> param = new HashMap<String, String>();
			param.put("CUS_NO", session.getAttribute("CUS_NO").toString());
			Map<String, String> customerCheck = customerService.customerCheck(req, param);
			req.setAttribute("customerCheck", customerCheck);
			System.out.println("customerCheck: " + customerCheck);
			
			if(customerCheck != null) {
				customerService.deleteCustomer(customerCheck);
				session.invalidate();
				res.sendRedirect("main.ma");
			} else {
				String msg = "이메일을 다시 확인해 주십시오.";
				alertAndBack(res, msg);
			}
		}
		
		
		
	}
	
	
	
	
	
	public static void alertAndBack(HttpServletResponse res, String msg) {
	    try {
	        res.setContentType("text/html; charset=utf-8");
	        PrintWriter w = res.getWriter();
	        w.write("<script>alert('"+msg+"');history.go(-1);</script>");
	        w.flush();
	        w.close();
	    } catch(Exception e) {
	        e.printStackTrace();
	    }
	}
	
}