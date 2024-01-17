package com.diningday.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
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
import com.google.gson.JsonArray;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
			
			if(searchId == null || searchId.isEmpty()) {
				System.out.println("첫 회원가입 고객");
				result = customerService.insertCustomer(req);
				searchId = customerService.searchId(req);
			} else {
				System.out.println("이미 가입한 고객");
				result = true;
			}
			if(result) {
				session.setAttribute("CUS_NO", searchId.get("CUS_NO"));
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
			req.setAttribute("reservationInfo", customerService.getReservation((String)session.getAttribute("CUS_NO")));
			String CUS_NO = (String) session.getAttribute("CUS_NO");
			req.setAttribute("customerInfo", customerService.getCustomer(CUS_NO));
			dispatcher = req.getRequestDispatcher("Customer/mypage.jsp");
			dispatcher.forward(req, res);
		}	
		
		
		if(sPath.equals("/resDetail.cu")) {
			String RES_NO = req.getParameter("RES_NO");
			res.setContentType("application/x-json; charset=utf-8");
			Map<String, String> resMap = customerService.reservationModal(RES_NO);
			List<Map<String, String>> menuList = customerService.menuModal(RES_NO);
			menuList.add(resMap);
			res.getWriter().print(TeamUtil.mapListToJSONList(menuList));
		}
		
		
		if(sPath.equals("/cus_edit.cu")) {
			String CUS_NO = (String) session.getAttribute("CUS_NO");
			req.setAttribute("customerInfo", customerService.getCustomer(CUS_NO));
			dispatcher = req.getRequestDispatcher("Customer/cus_edit.jsp");
			dispatcher.forward(req, res);
		}	
		
		
		if(sPath.equals("/cus_editPro.cu")) {	
			Map<String, String> param = new HashMap<String, String>();
			param.put("CUS_NO", session.getAttribute("CUS_NO").toString());
			req.setAttribute("customerEdit", customerService.customerEdit(req, param));
			res.sendRedirect("mypage.cu");
		}
		
//		-------------------------------------------------------------
		
		if(sPath.equals("/logout.cu")) {
			session.invalidate();
			res.sendRedirect("main.ma");
		}
		
		
		if(sPath.equals("/deletePro.cu")) {
			System.out.println("/deletePro.cu");
			boolean result = false;
			Map<String, String> param = new HashMap<String, String>();
			param.put("CUS_NO", session.getAttribute("CUS_NO").toString());
			Map<String, String> customerCheck = customerService.customerCheck(req, param);
			req.setAttribute("customerCheck", customerCheck);
			
			if(customerCheck != null) {
				customerCheck.put("CUS_REASON", req.getParameter("CUS_REASON"));
				result = customerService.insertEx(customerCheck);
				customerService.deleteCustomer(customerCheck);
				session.invalidate();
			}
			if(result) {
				res.getWriter().print(result);
			}
		}

		
		// 01/08_준우 + 찜 목록 이동 기능
		if(sPath.equals("/like_list.cu")) {
			req.setAttribute("LikeList", customerService.getLikeList((String)session.getAttribute("CUS_NO")));
			
			dispatcher = req.getRequestDispatcher("Customer/like_list.jsp");
			dispatcher.forward(req, res);
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