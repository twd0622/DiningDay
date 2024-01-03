package com.diningday.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.diningday.sql.SqlMapClient;

public class ReportDAO {

	private SqlSessionFactory sqlSessionFactory = SqlMapClient.getSqlSessionFactory();
	SqlSession session = null;
	
	public void insertReport(Map<String, String> reportDTO) {
		session = sqlSessionFactory.openSession();
		session.insert("Report.insertReport",reportDTO);
		
		session.commit();
		session.close();
	}

	

}
