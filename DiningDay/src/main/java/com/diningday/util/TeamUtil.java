package com.diningday.util;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.el.stream.Stream;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


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
	
	// request 받아온 파라미터와 다른 맵을 합쳐 주는 함수
	public static Map<String, String> requestToMap(HttpServletRequest req, Map<String, String> param) {
		Map<String, String> map = requestToMap(req);
		map.putAll(param);
		return map;
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
	
	// 파일이 담긴 request 파라미터를 맵에 넣어주는 함수
	public static Map<String, String> fileRequestToMap(HttpServletRequest req) {
		Map<String, String> dto = new HashMap<String, String>();
		
		String uploadPath = req.getRealPath("/upload");
		int maxSize = 10 * 1024 * 1024;
		
		try {
			MultipartRequest multi = new MultipartRequest(req, uploadPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			
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
			
			System.out.println(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return dto;
	}
	
	// 파일request 받아온 파라미터 맵에 넣어주는 함수
		public static Map<String, String[]> fileRequestToArrayMap(HttpServletRequest req) {
			Map<String, String[]> dto = new HashMap<String, String[]>();
			
			String uploadPath = req.getRealPath("/upload");
			int maxSize = 10 * 1024 * 1024;
			
			try {
				MultipartRequest multi = new MultipartRequest(req, uploadPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
				
				@SuppressWarnings("unchecked")
				Enumeration<String> parameterList = multi.getParameterNames();
				@SuppressWarnings("unchecked")
				Enumeration<String> fileList = multi.getFileNames();
				
				// 파일
				while(fileList.hasMoreElements()) {
					String reqName = fileList.nextElement();
					System.out.println(multi.getFilesystemName(reqName));
					dto.put(reqName, multi.getFilesystemName(reqName).split(","));
				}
				
				// 파라미터
				while(parameterList.hasMoreElements()) {
					String reqName = parameterList.nextElement();
					dto.put(reqName, multi.getParameter(reqName).split(","));
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
	
	// 맵이 담긴 리스트 들을 json으로
	public static JsonObject MapListsToJson(List<Map<String, String>> MapList1) {
		JsonArray jsonArray1 = new JsonArray();
		
		for(Map<String, String> map : MapList1) {
			JsonObject jsonObject = new JsonObject();
			map.forEach((key, value) ->{
				jsonObject.addProperty(key, value);
			});
			
			jsonArray1.add(jsonObject);
		}
		
		
		JsonObject jsonObject = new JsonObject();
		jsonObject.add("json1", jsonArray1);
		
		return jsonObject;
	}
	
	public static JsonObject MapListsToJson(List<Map<String, String>> MapList1, List<Map<String, String>> MapList2, List<Map<String, String>> MapList3, List<Map<String, String>> MapList4) {
		JsonArray jsonArray1 = new JsonArray();
		JsonArray jsonArray2 = new JsonArray();
		JsonArray jsonArray3 = new JsonArray();
		JsonArray jsonArray4 = new JsonArray();
		
		for(Map<String, String> map : MapList1) {
			JsonObject jsonObject = new JsonObject();
			map.forEach((key, value) ->{
				jsonObject.addProperty(key, value);
			});
			
			jsonArray1.add(jsonObject);
		}
		
		for(Map<String, String> map : MapList2) {
			JsonObject jsonObject = new JsonObject();
			map.forEach((key, value) ->{
				jsonObject.addProperty(key, value);
			});
			
			jsonArray2.add(jsonObject);
		}
		
		for(Map<String, String> map : MapList3) {
			JsonObject jsonObject = new JsonObject();
			map.forEach((key, value) ->{
				jsonObject.addProperty(key, value);
			});
			
			jsonArray3.add(jsonObject);
		}
		
		for(Map<String, String> map : MapList4) {
			JsonObject jsonObject = new JsonObject();
			map.forEach((key, value) ->{
				jsonObject.addProperty(key, value);
			});
			
			jsonArray4.add(jsonObject);
		}
		
		JsonObject jsonObject = new JsonObject();
		jsonObject.add("json1", jsonArray1);
		jsonObject.add("json2", jsonArray2);
		jsonObject.add("json3", jsonArray3);
		jsonObject.add("json4", jsonArray4);
		
		return jsonObject;
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
