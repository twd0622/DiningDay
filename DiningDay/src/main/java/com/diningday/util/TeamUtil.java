package com.diningday.util;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
import com.oreilly.servlet.MultipartRequest;


public class TeamUtil {
	
	
	// request 받아온 파라미터 맵에 넣어주는 함수
	public static Map<String, String> requestToMap(HttpServletRequest req) {
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
	
	public static Map<String, String> requestToMap(MultipartRequest multi) {
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
	
	//---------------------------------------------------------------------------------------
	
	// map을 json으로
	public static JsonObject mapToJSON(Map<String, String> map) {
		JsonObject jsonObject = new JsonObject();
		
		map.forEach((key, value) -> {
			jsonObject.addProperty(key, value);
		});
		
		return jsonObject;
	}
	
	
	// map이 담긴 list를 json배열
	public static JsonArray mapListToJSONList(List<Map<String, String>> MapList) {
		JsonArray jsonArray = new JsonArray();
		
		for(Map<String, String> map : MapList) {
			JsonObject jsonObject = new JsonObject();
			
			map.forEach((key, value) ->{
				jsonObject.addProperty(key, value);
			});
			
			jsonArray.add(jsonObject);
		}
		
		return jsonArray;
	}
	
	//---------------------------------------------------------------------------------------
	
	// json을 map으로
	public static Map<String, String> jsonToMap(JsonObject json) {
		return new Gson().fromJson(json, new TypeToken<Map<String, String>>(){}.getType());
	}
	
	// jsonList를 mapList로
	public static List<Map<String, String>> jsonListToMapList(JsonArray jsonArray) {
		return new Gson().fromJson(jsonArray, new TypeToken<List<Map<String, String>>>(){}.getType());
	}
	
}	
