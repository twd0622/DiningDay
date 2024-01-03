package com.diningday.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.diningday.service.AdminService;
import com.diningday.service.ReportService;

public class ReportController extends HttpServlet {
	RequestDispatcher dispatcher = null;
	AdminService adminService = null;
	ReportService reportService = null;


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
		System.out.println(sPath);
		
		if(sPath.equals("/reportWrite.re")) {
			System.out.println("/reportWrite.re");
			dispatcher = req.getRequestDispatcher("Review_Report/reportWrite.jsp");
			dispatcher.forward(req, res);
		}
		
		if(sPath.equals("/reportWritePro.re")) {
			System.out.println("/reportWritePro.re");
			reportService = new ReportService();
			
			reportService.insertReport(req);
		}
		
		
		
	}
}
