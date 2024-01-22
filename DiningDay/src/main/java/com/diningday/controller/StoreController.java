package com.diningday.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.expr.NewArray;

import com.diningday.service.StoreService;
import com.diningday.util.TeamUtil;
import com.google.gson.JsonArray;
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
			stSession.put("STORE_NO", (String)session.getAttribute("STORE_NO"));
			
			boolean bl = storeService.menuUpdate(stSession);
			if(!bl) return;
			
			res.setContentType("application/x-json; charset=utf-8");
			res.getWriter().print(storeService.menuSelect(stSession));
		}
		
		if(sPath.equals("/smenuAddEvent.st")) {
			res.setContentType("application/x-json; charset=utf-8");
			res.getWriter().print(storeService.menuMax((String)session.getAttribute("STORE_NO")));
		}
		
		if(sPath.equals("/smenuDelete.st")) {
			Map<String, String[]> dto = new HashMap<String, String[]>();
			dto = TeamUtil.fileRequestToArrayMap(req);
			
			boolean bl = storeService.menuDelete(dto);

			Map<String, String> dtoData = new HashMap<String, String>();
			dtoData.put("isTrue", String.valueOf(bl));
			dtoData.put("MENU_NO", dto.get("MENU_NO")[0]);
			
			res.setContentType("application/x-json; charset=utf-8");
			res.getWriter().print(TeamUtil.mapToJSON(dtoData));
		}
		
		if(sPath.equals("/smenuInsert.st")) {
			Map<String, String> stSession = TeamUtil.fileRequestToMap(req);
			stSession.put("STORE_NO", (String)session.getAttribute("STORE_NO"));
			
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
		
//		--- 예약 시작 ---		
		if(sPath.equals("/sRes_control.st")) {
			dispatcher = req.getRequestDispatcher("Store/sRes_control.jsp");
			dispatcher.forward(req, res);
		}
		
		if(sPath.equals("/sRes.st")) {
			req.setAttribute("dateCheck", req.getParameter("resCheck"));
			
			dispatcher = req.getRequestDispatcher("Store/sRes.jsp");
			dispatcher.forward(req, res);
		}
		
		if(sPath.equals("/sResPro.st")) {
			Map<String, String> dto = new HashMap<String, String>();
			dto.put("STORE_NO", (String)session.getAttribute("STORE_NO"));
			JsonArray a = storeService.resSelectList(req, dto);
			
			res.setContentType("application/x-json; charset=utf-8");
			res.getWriter().print(a);
		}
		
		if(sPath.equals("/sResUpdate.st")) {
			
			Map<String, String> dto = new HashMap<String, String>();
			dto = TeamUtil.requestToMap(req);
			dto.put("STORE_NO", (String)session.getAttribute("STORE_NO"));
			 
			if(!storeService.resUpdate(dto)) {
				System.out.println("실패");
				return;
			}
			
			res.setContentType("application/x-json; charset=utf-8");
			res.getWriter().print(TeamUtil.mapToJSON(dto));
		}
		
		if(sPath.equals("/sRes_controlPro.st")) {
			Map<String, String> dto = new HashMap<String, String>();
			dto = TeamUtil.requestToMap(req);
			dto.put("STORE_NO", (String)session.getAttribute("STORE_NO"));
			dto.put("OWN_NO", (String)session.getAttribute("OWN_NO"));
			System.out.println("!@#!@#!@#");
			
			
			res.setContentType("application/x-json; charset=utf-8");
			res.getWriter().print(TeamUtil.mapToJSON(storeService.resSelect(dto)));
		}
		
		if(sPath.equals("/sResMonthData.st")) {
			Map<String, String> dto = new HashMap<String, String>();
			dto = TeamUtil.requestToMap(req);
			dto.put("STORE_NO", (String)session.getAttribute("STORE_NO"));
			
			res.setContentType("application/x-json; charset=utf-8");
			res.getWriter().print(storeService.resMonthSelect(dto));
		}
		
		if(sPath.equals("/sResWeekData.st")) {
			Map<String, String> dto = new HashMap<String, String>();
			dto = TeamUtil.requestToMap(req);
			dto.put("STORE_NO", (String)session.getAttribute("STORE_NO"));
			
			res.setContentType("application/x-json; charset=utf-8");
			res.getWriter().print(storeService.resWeekSelect(dto));
		}
		
		if(sPath.equals("/resDateCheck.st")) {
			res.getWriter().print(req.getParameter("dateCheck"));
		}
		
//		--- 예약 끝 ---
		
		// ----------------- 01/17 준우 작성 건들 ㄴㄴ -------------------------------------------------
		if(sPath.equals("/sreview.st")) {
			// 점수, 리뷰 개수, 답글 개수
			String STORE_NO = (String)session.getAttribute("STORE_NO");
			
			// req.setAttribute("reviewInfo", storeService.getReviewInfo(STORE_NO));
			Map<String, String> dto = storeService.getReviewInfo(STORE_NO);
			
			req.setAttribute("REVIEW_SCORE", dto.get("REVIEW_SCORE"));
			req.setAttribute("reviewInfo", dto);
			dispatcher = req.getRequestDispatcher("Store/sreview.jsp");
			dispatcher.forward(req, res);
		}
		
		if(sPath.equals("/getReviewList.st")) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("STORE_NO", (String)session.getAttribute("STORE_NO"));
			
			res.setContentType("application/x-json; charset=utf-8");
			res.getWriter().print(TeamUtil.mapListToJSONList(storeService.getReviewList(TeamUtil.requestToMap(req, map))));
		}
		
		if(sPath.equals("/answerInsert.st")) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("STORE_NO", (String)session.getAttribute("STORE_NO"));
			
			res.setContentType("application/x-json; charset=utf-8");
			res.getWriter().print(TeamUtil.mapToJSON(storeService.answerInsert(TeamUtil.requestToMap(req, map))));
		}
		
		if(sPath.equals("/answerUpdate.st")) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("STORE_NO", (String)session.getAttribute("STORE_NO"));
			
			res.setContentType("application/x-json; charset=utf-8");
			res.getWriter().print(TeamUtil.mapToJSON(storeService.answerUpdate(TeamUtil.requestToMap(req, map))));
			
		}
		
		if(sPath.equals("/insertReviewReport.st")) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("STORE_NO", (String)session.getAttribute("STORE_NO"));
			
			res.setContentType("charset=utf-8");
			res.getWriter().print(storeService.insertReviewReport(TeamUtil.requestToMap(req, map)));
		}
		
		// -------------------여기 까지 s_review-------------------------------------------------------
		
//		--- 식당 좌석 시작 ---
		
		if(sPath.equals("/stable_insert.st")) {
			dispatcher = req.getRequestDispatcher("Store/stable_insert.jsp");
			dispatcher.forward(req, res);
		}
		
		if(sPath.equals("/seatInsert.st")) {
			boolean bl = storeService.seatInsert(req);
			
			res.setContentType("application/x-json; charset=utf-8");
			res.getWriter().print(bl);
		}
		
		if(sPath.equals("/stable.st")) {
			dispatcher = req.getRequestDispatcher("Store/stable.jsp");
			dispatcher.forward(req, res);
		}
		
		if(sPath.equals("/stablePro.st")) {
			Map<String, String> dto = new HashMap<String, String>();
			dto.put("STORE_NO", (String)session.getAttribute("STORE_NO"));
			
			res.setContentType("application/x-json; charset=utf-8");
			res.getWriter().print(storeService.seatSelectList(dto));
		}
		
		if(sPath.equals("/stableResCheck.st")) {
			Map<String, String> dto = new HashMap<String, String>();
			dto.put("STORE_NO", (String)session.getAttribute("STORE_NO"));
			dto.put("REQ_STATE", "false");
			dto = TeamUtil.requestToMap(req, dto);
			List<Map<String, String>> dtoList = storeService.stableResCheck(dto);
			
			for(Map<String, String> str : dtoList) {
				if(str.values().contains("0")) {
					dto.put("REQ_STATE", "true");
					break;
				}
			}

			res.setContentType("application/x-json; charset=utf-8");
			res.getWriter().print(TeamUtil.mapToJSON(dto));		
		}
		
		if(sPath.equals("/seatDeletePro.st")) {
			Map<String, String> dto = new HashMap<String, String>();
			dto = TeamUtil.fileRequestToMap(req);
			dto.put("STORE_NO", (String)session.getAttribute("STORE_NO"));
			
			boolean bl = storeService.seatDelete(dto);
			if(!bl) {
				return;
			}
			
			res.getWriter().print(dto.get("COLOUMN"));	
		}
		
		if(sPath.equals("/seatUpdatePro.st")) {
			Map<String, String> dto = new HashMap<String, String>();
			dto = TeamUtil.fileRequestToMap(req);
			dto.put("STORE_NO", (String)session.getAttribute("STORE_NO"));
			
			boolean bl = storeService.seatUpdate(dto);
			if(!bl) {
				return;
			}
			
			res.setContentType("application/x-json; charset=utf-8");
			res.getWriter().print(TeamUtil.mapToJSON(dto));
		}

//		--- 식당 좌석 끝 ---		
		
//		-------------------------------------------------------------------------------
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
