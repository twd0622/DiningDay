package com.diningday.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.diningday.sql.SqlMapClient;


public class UserDAO {

	private SqlSessionFactory sqlSessionFactory = SqlMapClient.getSqlSessionFactory();
	SqlSession session = sqlSessionFactory.openSession();
	
	
	public Boolean insertUser(Map<String, String> dto) {
		//dto = {user_id : choi , user_pass : 1234, user_name : 최승민}
		session = sqlSessionFactory.openSession();
		
		int insertUser = session.insert("User.insert", dto); // namespace.id
		
		session.commit();
		session.close();
		
		return insertUser > 0 ? true : false;
	}
}
