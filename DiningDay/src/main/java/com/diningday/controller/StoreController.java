package com.diningday.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
			req.setAttribute("menuList", storeService.menuList(req));
			
			dispatcher = req.getRequestDispatcher("Store/smenu.jsp");
			System.out.println("페이지 변경확인");
			dispatcher.forward(req, res);
		}
		
		if(sPath.equals("/smenuPro.st")) {
			
			boolean check = storeService.insertMenu(req);
			if(!check) {
				return;
			}
		}
		
		if(sPath.equals("/smenuUpdate.st")) {
			
			boolean bl = storeService.menuUpdate(req);
			if(!bl) {
				return;
			}
		}
		
		if(sPath.equals("/smenuInsert.st")) {
			
		}
		
		if(sPath.equals("/upload")) {
		}
		
	}
}
