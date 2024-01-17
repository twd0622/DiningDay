package com.diningday.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.diningday.service.StoreService;
import com.diningday.util.TeamUtil;
import com.google.gson.JsonObject;
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
		
//		---------------------------------------------------------------------------------------------

		if(sPath.equals("/smainIsNotExist.st")) {
			dispatcher = req.getRequestDispatcher("Store/smain.jsp");
			dispatcher.forward(req, res);
		}

		if(sPath.equals("/smainIsExist.st")) {
			Map<String, String> storeDTO = new HashMap<String, String>();
			storeDTO.put("STORE_NO", (String)session.getAttribute("STORE_NO"));
			System.out.println(storeDTO);
			req.setAttribute("STORE_LIST", storeService.storeSelect(storeDTO));
			
			
			dispatcher = req.getRequestDispatcher("Store/smainisExist.jsp");
			dispatcher.forward(req, res);
		}

		if(sPath.equals("/storeInsert.st")) {
			
			Map<String,String> storeDTO = TeamUtil.fileRequestToMap(req);
			boolean bl = storeService.storeInsert(storeDTO);
			
			if(bl) {
				bl = storeService.firstInsertStore_OwnerUpdate(storeDTO);
			}
			
			if(bl) {
				storeDTO = storeService.ownerSelect(storeDTO);
			}
			
			if(storeDTO.get("STORE_NO").equals("0")) {
				System.out.println("오류발생!");
				return;
			}
			
			System.out.println(storeDTO);
			session.setAttribute("STORE_NO", storeDTO.get("STORE_NO"));
			session.setAttribute("OWN_NO", storeDTO.get("OWN_NO"));
			
			res.setContentType("application/x-json; charset=utf-8");
			res.getWriter().print(bl);
		}
		
		if(sPath.equals("/smainDelete.st")) {
			
		}
		
		if(sPath.equals("/smainUpdate.st")) {
			
		}
		
//		---------------------------------------------------------------------------------------------
		
		if(sPath.equals("/sRes_control.st")) {
			dispatcher = req.getRequestDispatcher("Store/sRes_control.jsp");
			dispatcher.forward(req, res);
		}
		
		if(sPath.equals("/sRes.st")) {
			dispatcher = req.getRequestDispatcher("Store/sRes.jsp");
			dispatcher.forward(req, res);
		}
		
		if(sPath.equals("/sreview.st")) {
			dispatcher = req.getRequestDispatcher("Store/sreview.jsp");
			dispatcher.forward(req, res);
		}
		
		
		if(sPath.equals("/stable_insert.st")) {
			dispatcher = req.getRequestDispatcher("Store/stable_insert.jsp");
			dispatcher.forward(req, res);
		}
		
		if(sPath.equals("/stable.st")) {
			dispatcher = req.getRequestDispatcher("Store/stable.jsp");
			dispatcher.forward(req, res);
		}
		
		if(sPath.equals("/sdeclare.st")) {
			dispatcher = req.getRequestDispatcher("Store/sdeclare.jsp");
			dispatcher.forward(req, res);
		}
		
		if(sPath.equals("/upload")) {
		}
		

//		01/17_강현아 + 점주 정보 저장 및 수정 + 로그아웃
		
		if(sPath.equals("/info_update.st")) {
			String OWN_NO = (String) session.getAttribute("OWN_NO");
			req.setAttribute("getOwner", storeService.getOwner(OWN_NO));
			dispatcher = req.getRequestDispatcher("Store/info_update.jsp");
			dispatcher.forward(req, res);
		}	
		
		
		if(sPath.equals("/info_updatePro.st")) {	
			boolean result = false;
			Map<String, String> param = new HashMap<String, String>();
			param.put("OWN_NO", session.getAttribute("OWN_NO").toString());
			result = storeService.ownerEdit(req, param);
			req.setAttribute("ownerEdit", result);
			if(result) {
				res.getWriter().print(result);
			}
		}
		
		if(sPath.equals("/logout.st")) {
			session.invalidate();
			res.sendRedirect("main.ma");
		}
		
	}
}
