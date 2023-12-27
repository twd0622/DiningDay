package com.diningday.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.diningday.dao.UserDAO;
import com.diningday.service.StoreService;
import com.diningday.service.UserService;

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
			dispatcher = req.getRequestDispatcher("Store/smenu.jsp");
			dispatcher.forward(req, res);
		}
		
		if(sPath.equals("/smenuPro.st")) {
			boolean check = storeService.insertMenu(req);
			if(!check) {
				return;
			}
			req.setAttribute("menuList", storeService.menuList(req)); 
		}
		
	}
}
