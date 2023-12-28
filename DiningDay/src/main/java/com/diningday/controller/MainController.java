package com.diningday.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		MainService mainService = new MainService();
		
		System.out.println(sPath);
		
		if(sPath.equals("/main.ma")) {
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
			req.setAttribute("storeInfo", mainService.getStore(req));
			req.setAttribute("menuList", mainService.getMenuList(req));
			req.setAttribute("tableList", mainService.getTableList(req));
			
			dispatcher = req.getRequestDispatcher("Main/store.jsp");
			dispatcher.forward(req, res);
		}
		
		if(sPath.equals("/getTable.ma")) {
			
			res.setContentType("application/x-json; charset=utf-8");
			res.getWriter().print(mainService.getTable(req));
			
		}
		
	}
	
}
