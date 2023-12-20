package com.diningday.util;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;


public class TeamUtil {
	
	public static Map<String, String> requestBack(HttpServletRequest req) {
		Map<String, String> dto = new HashMap<String, String>();
		try {
			req.setCharacterEncoding("UTF-8");
			
			Enumeration<String> list = req.getParameterNames();
			
			while(list.hasMoreElements()) {
				String reqName = list.nextElement();
				dto.put(reqName, req.getParameter(reqName));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return dto;
	}
	
	public static Map<String, String> requestBack(MultipartRequest multi) {
		Map<String, String> dto = new HashMap<String, String>();
		try {
			
			@SuppressWarnings("unchecked")
			Enumeration<String> parameterList = multi.getParameterNames();
			@SuppressWarnings("unchecked")
			Enumeration<String> fileList = multi.getFileNames();
			
			// 파일
			while(fileList.hasMoreElements()) {
				String reqName = fileList.nextElement();
				dto.put(reqName, multi.getFilesystemName(reqName));
			}
			
			// 파라미터
			while(parameterList.hasMoreElements()) {
				String reqName = parameterList.nextElement();
				dto.put(reqName, multi.getParameter(reqName));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return dto;
	}
	
	// ------------------------------------------------
	public static String changeDateToStr(LocalDateTime date, String fromat) {
		String StrDate = date.format(DateTimeFormatter.ofPattern(fromat));
		
		return StrDate;
	}
	
	public static String AddDate(String strDate, int year, int month, int day) {
		SimpleDateFormat dtFormat = new SimpleDateFormat("yyyyMMdd");
		try {
	        
			Calendar cal = Calendar.getInstance();
	        
			Date dt = dtFormat.parse(strDate);
	        
			cal.setTime(dt);
	        
			cal.add(Calendar.YEAR,  year);
			cal.add(Calendar.MONTH, month);
			cal.add(Calendar.DATE,  day);
		
			return dtFormat.format(cal.getTime());
		} catch (Exception e) {
			e.printStackTrace();
		}

        return null;	
	}
}	
