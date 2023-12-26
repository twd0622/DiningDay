package com.diningday.service;

import java.time.LocalDateTime;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.diningday.dao.AdminDAO;
import com.diningday.util.TeamUtil;

public class AdminService {
	
	AdminDAO adminDAO = new AdminDAO();

	public boolean insertBoard(HttpServletRequest req) {
		adminDAO = new AdminDAO();
		// request 파라미터값 가져오기
		Map<String, String> boardDTO = TeamUtil.requestToMap(req);
//		boardDTO.put("NOT_DATE", LocalDateTime.now().toString());
		
		
		
		return adminDAO.insertBoard(boardDTO);
		
	}
	
	
}
