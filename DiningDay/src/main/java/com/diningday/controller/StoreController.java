package com.diningday.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.diningday.service.StoreService;
import com.diningday.util.TeamUtil;
import com.google.gson.JsonObject;

public class StoreController extends HttpServlet {
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
		
		StoreService storeService = new StoreService();
		
		if(sPath.equals("/smenu.st")) {
			HttpSession session = req.getSession();
			session.setAttribute("store_num", 1);
			
			dispatcher = req.getRequestDispatcher("Store/smenu.jsp");
			dispatcher.forward(req, res);
		}
		
		if(sPath.equals("/smenuPro.st")) {
			
			boolean check = storeService.insertMenu(req);
			if(!check) {
				return;
			}
		}
		
		if(sPath.equals("/smenuList.st")) {
			
			res.setContentType("application/x-json; charset=utf-8");
			res.getWriter().print(storeService.menuList(req));
		}
		
		if(sPath.equals("/smenuUpdate.st")) {
			
			boolean bl = storeService.menuUpdate(req);
			if(!bl) {
				return;
			}
		}
		
		if(sPath.equals("/smenuInsert.st")) {
			boolean isTrue = storeService.insertMenu(req);
			if(!isTrue) {
				return;
			}
			
			res.setContentType("application/x-json; charset=utf-8");
			res.getWriter().print(storeService.menuSelect(req));
		}
		
		if(sPath.equals("/upload")) {
		}
		
	}
}
