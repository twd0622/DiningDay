package com.diningday.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.diningday.dao.LocationDAO;
import com.diningday.util.TeamUtil;
import com.google.gson.JsonArray;

public class LocationService {
	LocationDAO locationDAO = new LocationDAO(); 
		
	public JsonArray getLocation2(HttpServletRequest req) {
		return TeamUtil.mapListToJSON(locationDAO.getLocation2(TeamUtil.requestToMap(req))); 
	}

}
