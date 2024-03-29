package com.diningday.controller;

import java.io.IOException;
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
import com.diningday.util.PaymentCancel;
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
			String[] menu_nameList = req.getParameter("MENU_NAME").split(",");
			String[] menu_countList = req.getParameter("MENU_COUNT").split(",");
			
			List<Map<String,String>> menuDTOList = new ArrayList<Map<String, String>>();
			for(int i=0; i < menu_countList.length; i++) {
				Map<String,String> menuDTO = new HashMap<String, String>();
				
				menuDTO.put("STORE_NO", req.getParameter("STORE_NO"));
				menuDTO.put("MENU_NAME", menu_nameList[i]);
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
		
		if(sPath.equals("/payment_cancel.pa")) {
			String MERCHANT_UID = req.getParameter("MERCHANT_UID");
			String msg = "당일 취소는 불가 합니다. 식당에 문의해 주세요";
			
			String storeRes = req.getParameter("storeRes");
			// 환불 가능한지 판단
			if(paymentService.checkResDate(MERCHANT_UID) && storeRes == null) {
				// 가능하다면 환불 처리
				String token = PaymentCancel.getImportToken();
				
				int result_delete = PaymentCancel.cancelPay(token, MERCHANT_UID);
				
				
				// 환불 처리 후 DB 변경
				if(result_delete == 1) {
					paymentService.payment_cancel(MERCHANT_UID);
					msg = "취소 완료 되었습니다.";
				} else {
					msg = "취소 실패 되었습니다.";
				}
				
			} 
			
			if(storeRes != null) {
				PaymentCancel.cancelPay(PaymentCancel.getImportToken(), MERCHANT_UID);
			}
			
			System.out.println(msg);	
			req.setAttribute("msg", msg);
			dispatcher = req.getRequestDispatcher("Payment/payment_msg.jsp");
			dispatcher.forward(req, res);
		}
		
	}

}
