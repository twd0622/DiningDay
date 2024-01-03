package com.diningday.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
		HttpSession session = req.getSession();
		OwnerService ownerService = new OwnerService();
		
		System.out.println(sPath);
		
		if(sPath.equals("/owner_join.ow")) {
			dispatcher = req.getRequestDispatcher("Owner/owner_join.jsp");
			dispatcher.forward(req, res);
		}
		
		if(sPath.equals("/owner_joinPro.ow")) {
			req.setCharacterEncoding("UTF-8");
			Map<String, String> joinCheck = ownerService.joinCheck(req);
			boolean result = false;
			if(joinCheck == null || joinCheck.isEmpty()) {
				result = ownerService.insertOwner(req);
				joinCheck = ownerService.joinCheck(req);
			} else {
				String msg = "이미 가입된 사업자번호입니다.";
				alertAndBack(res, msg);
			}
			if (result) {
				res.sendRedirect("owner_login.ow");
			}
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
