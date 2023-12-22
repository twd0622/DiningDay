package com.diningday.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.diningday.dao.LocationDAO;
import com.diningday.util.TeamUtil;

public class LocationService {
	LocationDAO locationDAO = new LocationDAO(); 
		
	public List<Map<String, String>> getLocation2(HttpServletRequest req) {
		System.out.println(TeamUtil.requestBack(req));
		return locationDAO.getLocation2(TeamUtil.requestBack(req)); 
	}

}
