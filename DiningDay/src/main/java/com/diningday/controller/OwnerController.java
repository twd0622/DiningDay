package com.diningday.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.diningday.service.OwnerService;
import com.diningday.util.TeamUtil;

public class OwnerController extends HttpServlet {
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
		OwnerService ownerService = new OwnerService();
		
		System.out.println(sPath);
		
		
		if(sPath.equals("/owner_join.ow")) {
			dispatcher = req.getRequestDispatcher("Owner/owner_join.jsp");
			dispatcher.forward(req, res);
		}
		
		if(sPath.equals("/owner_joinPro.ow")) {
			req.setCharacterEncoding("UTF-8");
			boolean result = ownerService.insertOwner(req);
			
			System.out.println("result: " + result);
			if (result) res.sendRedirect("owner_login.ow");
			else		res.sendRedirect("owner_join.ow");
			
		}
		
//		-------------------------------------------------------------
		
		if(sPath.equals("/search_id.ow")) {
			dispatcher = req.getRequestDispatcher("Owner/search_id.jsp");
			dispatcher.forward(req, res);
		}	
		
		if(sPath.equals("/search_pw.ow")) {
			dispatcher = req.getRequestDispatcher("Owner/search_pw.jsp");
			dispatcher.forward(req, res);
		}	
		
		if(sPath.equals("/new_pw.ow")) {
			dispatcher = req.getRequestDispatcher("Owner/new_pw.jsp");
			dispatcher.forward(req, res);
		}	

//		-------------------------------------------------------------
		
		if(sPath.equals("/owner_login.ow")) {
			dispatcher = req.getRequestDispatcher("Owner/owner_login.jsp");
			dispatcher.forward(req, res);
		}		
		
		if(sPath.equals("/owner_loginPro.ow")) {
			Map<String, String> ownerCheck = ownerService.ownerCheck(req);
			if(ownerCheck != null) {
				System.out.println("로그인 성공");
				session.setAttribute("STORE_NO", ownerCheck.get("STORE_NO"));
				session.setAttribute("id", ownerCheck.get("OWN_ID"));
				res.sendRedirect("smain.ow");

				String adminId = (String)session.getAttribute("id");

				// 관리자로 로그인할 경우 관리자페이지로 이동
				if(adminId.equals("admin")) {
					res.sendRedirect("admin_main.ad");
				} else {
					res.sendRedirect("smain.ow");
				}

			} else {
				String msg = "아이디 혹은 비밀번호가 틀렸습니다.";
				alertAndBack(res, msg);
			}
		}

//		-------------------------------------------------------------
		
		if(sPath.equals("/smain.ow")) {
			System.out.println("주소비교 /smain.ow 일치");
			dispatcher = req.getRequestDispatcher("Store/smain.jsp");
			dispatcher.forward(req, res);
		}
		

		
		
		
	}
}
