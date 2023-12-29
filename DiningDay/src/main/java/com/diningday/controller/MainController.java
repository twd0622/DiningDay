package com.diningday.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.diningday.service.LocationService;
import com.diningday.service.MainService;
import com.google.gson.JsonArray;

public class MainController extends HttpServlet {
	RequestDispatcher dispatcher = null;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doProcess(req, res);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doProcess(req, res);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		String sPath = req.getServletPath();
		HttpSession session = req.getSession();
		
		MainService mainService = new MainService();
		
		System.out.println(sPath);
		
		if(sPath.equals("/main.ma")) {
			// 로그인 할때 넣어주기
			session.setAttribute("date", LocalDate.now());
			session.setAttribute("people", "2");
			
			dispatcher = req.getRequestDispatcher("Main/main.jsp");
			dispatcher.forward(req, res);
		}
		
		if(sPath.equals("/searchResult.ma")) {
			req.setAttribute("searchCount", mainService.searchCount(req));
			req.setAttribute("searchList", mainService.searchResult(req));
			req.setAttribute("searchInput", req.getParameter("searchInput"));
			
			dispatcher = req.getRequestDispatcher("Main/search_result.jsp");
			dispatcher.forward(req, res);
		}
		
		if(sPath.equals("/store.ma")) {
			String store_no = req.getParameter("STORE_NO");
			
			Map<String, String> param = new HashMap<String, String>();
			param.put("PEOPLE", session.getAttribute("people").toString());
			
			req.setAttribute("storeInfo", mainService.getStore(req));
			req.setAttribute("menuList", mainService.getMenuList(req));
			req.setAttribute("tableList", mainService.getTableList(req, param));
			
			dispatcher = req.getRequestDispatcher("Main/store.jsp");
			dispatcher.forward(req, res);
		}
		
		if(sPath.equals("/getTable.ma")) {
			
			res.setContentType("application/x-json; charset=utf-8");
			res.getWriter().print(mainService.getTable(req));
			
		}
		
		if(sPath.equals("/dateSession.ma")) {
			session.setAttribute("date", req.getParameter("date"));
		}
		if(sPath.equals("/peopleSession.ma")) {
			session.setAttribute("people", req.getParameter("people"));
		}
	}
	
}
