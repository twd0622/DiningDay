package com.diningday.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.diningday.service.PaymentService;
import com.diningday.util.TeamUtil;

public class PaymentController extends HttpServlet {
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
		PaymentService paymentService = new PaymentService();
		HttpSession session = req.getSession();
		
		System.out.println(sPath);
		
		if(sPath.equals("/payment.pa")) {
			Map<String, String> reservationDTO = TeamUtil.requestToMap(req);
			System.out.println(reservationDTO);
			req.setAttribute("storeInfo", paymentService.getStoreInfo(reservationDTO));
			req.setAttribute("customerInfo", paymentService.getCustomerInfo((String)session.getAttribute("CUS_NO")));
			req.setAttribute("menuInfoList", paymentService.getMenuInfo(reservationDTO));
			req.setAttribute("reservationDTO", reservationDTO);
			
			dispatcher = req.getRequestDispatcher("Payment/payment.jsp");
			dispatcher.forward(req, res);
		}
		
		if(sPath.equals("/paymentInsert.pa")) {
			
			Map<String, String> paymentDTO = TeamUtil.requestToMap(req);
			paymentService.paymentInsert(paymentDTO);
			
			String[] menu_noList = req.getParameter("MENU_NO").split(",");
			String[] menu_countList = req.getParameter("MENU_COUNT").split(",");
			
			List<Map<String,String>> menuDTOList = new ArrayList<Map<String, String>>();
			for(int i=0; i < menu_countList.length; i++) {
				Map<String,String> menuDTO = new HashMap<String, String>();
				
				menuDTO.put("STORE_NO", req.getParameter("STORE_NO"));
				menuDTO.put("MENU_NO", menu_noList[i]);
				menuDTO.put("MENU_COUNT", menu_countList[i]);
				
				menuDTOList.add(menuDTO);
			}
			paymentService.reservationMenuInsert(menuDTOList);
			
			res.setContentType("application/x-json; charset=utf-8");
			res.getWriter().print(TeamUtil.mapToJSON(paymentService.getRES_NO(paymentDTO)));
		}
		
		if(sPath.equals("/payment_success.pa")) {
			req.setAttribute("resInfo", paymentService.getResInfo(TeamUtil.requestToMap(req)));
			dispatcher = req.getRequestDispatcher("Payment/payment_success.jsp");
			dispatcher.forward(req, res);
		}
	}

}
