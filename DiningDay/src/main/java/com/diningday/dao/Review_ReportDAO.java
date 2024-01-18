package com.diningday.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.diningday.sql.SqlMapClient;

public class Review_ReportDAO {

	private SqlSessionFactory sqlSessionFactory = SqlMapClient.getSqlSessionFactory();
	SqlSession session = null;
	
	public void insertReport(Map<String, String> review_ReportDTO) {
		session = sqlSessionFactory.openSession();
		session.insert("Review_Report.insertReport",review_ReportDTO);
		
		session.commit();
		session.close();
		
		
	}

	public void insertReview(Map<String, String> review_ReportDTO) {
		session = sqlSessionFactory.openSession();
		session.insert("Review_Report.insertReview",review_ReportDTO);
		
		session.commit();
		session.close();
		
	}

	public String getNick(String CUS_NO) {
		session = sqlSessionFactory.openSession();
		String nick = session.selectOne("Review_Report.getNick",CUS_NO);
		
		session.close();
		
		return nick;
	}

	

}
