package com.diningday.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.diningday.service.StoreService;
import com.diningday.util.TeamUtil;
import com.mysql.fabric.xmlrpc.base.Array;

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
		HttpSession session = req.getSession();
		
		if(sPath.equals("/smain.st")) {
			dispatcher = req.getRequestDispatcher("Store/smain.jsp");
			dispatcher.forward(req, res);
		}
		
		if(sPath.equals("/smenu.st")) {
			System.out.println(session.getAttribute("STORE_NO"));
			dispatcher = req.getRequestDispatcher("Store/smenu.jsp");
			dispatcher.forward(req, res);
		}
		
		if(sPath.equals("/smenuList.st")) {
			res.setContentType("application/x-json; charset=utf-8");
			res.getWriter().print(storeService.menuList(req));
		}
		
		if(sPath.equals("/smenuUpdate.st")) {
			Map<String, String> stSession = TeamUtil.fileRequestToMap(req);
			boolean bl = storeService.menuUpdate(stSession);
			if(!bl) return;
			
			res.setContentType("application/x-json; charset=utf-8");
			res.getWriter().print(storeService.menuSelect(stSession));
		}
		
		if(sPath.equals("/smenuAddEvent.st")) {
			res.setContentType("application/x-json; charset=utf-8");
			res.getWriter().print(storeService.menuMax(req));
		}
		
		if(sPath.equals("/smenuDelete.st")) {
			boolean bl = storeService.menuDelete(req);
//			System.out.println(Arrays.toString(a.get("STORE_NO")));
//			System.out.println(Arrays.toString(a.get("MENU_NO")));
			
			res.getWriter().print(bl);
		}
		
		if(sPath.equals("/smenuInsert.st")) {
			Map<String, String> stSession = TeamUtil.fileRequestToMap(req);
			boolean isTrue = storeService.insertMenu(stSession);
			if(!isTrue) return;
			
			res.setContentType("application/x-json; charset=utf-8");
			res.getWriter().print(storeService.menuSelect(stSession));
		}
		
		if(sPath.equals("/upload")) {
		}
	}
}
