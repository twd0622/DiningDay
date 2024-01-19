package com.diningday.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.diningday.sql.SqlMapClient;

public class OwnerDAO {
	private SqlSessionFactory sqlSessionFactory = SqlMapClient.getSqlSessionFactory();
	SqlSession session;

	public boolean idCheck(Map<String, String> ownerDTO) {
		session = sqlSessionFactory.openSession();
		Map<String, String> idCheck = session.selectOne("Owner.selectCheck", ownerDTO);
		session.close();
		return idCheck != null ? true : false;
	}
	
	public Map<String, String> joinCheck(Map<String, String> ownerDTO) {
		session = sqlSessionFactory.openSession();
		Map<String, String> joinCheck =  session.selectOne("Owner.joinCheck", ownerDTO);
		session.close();
		return joinCheck;
	}
	
	public boolean insertOwner(Map<String, String> ownerDTO) {
		session = sqlSessionFactory.openSession();
		int insertOwner = session.insert("Owner.insert", ownerDTO); // namespace.id
		session.commit();
		session.close();
		return insertOwner > 0 ? true : false;
	}
	
	public Map<String, String> ownerCheck(Map<String, String> ownerDTO) {
		session = sqlSessionFactory.openSession();
		Map<String, String> ownerCheck =  session.selectOne("Owner.selectCheck", ownerDTO);
		session.close();
		return ownerCheck;
	}

	public Map<String, String> authCheck(Map<String, String> ownerDTO) {
		session = sqlSessionFactory.openSession();
		Map<String, String> authCheck =  session.selectOne("Owner.selectCheck", ownerDTO);
		session.close();
		return authCheck;
	}

	public Map<String, String> authPwCheck(Map<String, String> ownerDTO) {
		session = sqlSessionFactory.openSession();
		Map<String, String> authPwCheck =  session.selectOne("Owner.selectCheck", ownerDTO);
		session.close();
		return authPwCheck;
	}
	
	public boolean newPw(Map<String, String> ownerDTO) {
		session = sqlSessionFactory.openSession();
		int customerEdit = session.update("Owner.newPw", ownerDTO);
		session.commit();
		session.close();
		return customerEdit > 0 ? true : false;
	}

}
