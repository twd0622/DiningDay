package com.diningday.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
			
			req.setAttribute("storeInfo", paymentService.getStoreInfo(reservationDTO));
			req.setAttribute("customerInfo", paymentService.getCustomerInfo((String)session.getAttribute("CUS_NO")));
			req.setAttribute("menuInfoList", paymentService.getMenuInfo(reservationDTO));
			req.setAttribute("reservationDTO", reservationDTO);
			
			dispatcher = req.getRequestDispatcher("Payment/payment.jsp");
			dispatcher.forward(req, res);
		}
	}

}
