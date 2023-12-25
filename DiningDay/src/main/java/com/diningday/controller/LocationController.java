package com.diningday.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.diningday.service.LocationService;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

public class LocationController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doProcess(req, res);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doProcess(req, res);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String sPath = req.getServletPath();
		
		LocationService locationService = new LocationService();
		System.out.println(sPath);
		if(sPath.equals("/Main/getLocation2.lo")) {
			
			res.setContentType("application/x-json; charset=utf-8");
			res.getWriter().print(locationService.getLocation2(req));
		}
		
	}
	
}
