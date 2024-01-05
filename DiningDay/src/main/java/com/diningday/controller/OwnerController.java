package com.diningday.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.eclipse.jdt.internal.compiler.ast.Receiver;

import com.diningday.service.OwnerService;
import com.diningday.util.TeamUtil;

public class OwnerController extends HttpServlet {
	RequestDispatcher dispatcher = null;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doProcess(req, res);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doProcess(req, res);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String sPath = req.getServletPath();
		HttpSession session = req.getSession();
		OwnerService ownerService = new OwnerService();
		
		System.out.println(sPath);
		
		if(sPath.equals("/owner_join.ow")) {
			dispatcher = req.getRequestDispatcher("Owner/owner_join.jsp");
			dispatcher.forward(req, res);
		}
		
		if(sPath.equals("/owner_joinPro.ow")) {
			req.setCharacterEncoding("UTF-8");
			Map<String, String> joinCheck = ownerService.joinCheck(req);
			boolean result = false;
			if(joinCheck == null || joinCheck.isEmpty()) {
				result = ownerService.insertOwner(req);
			} else {
				String msg = "이미 가입된 사업자번호입니다.";
				alertAndBack(res, msg);
			}
			if (result) {
				res.sendRedirect("owner_login.ow");
			}
		}
		
//		-------------------------------------------------------------

		if(sPath.equals("/search_id.ow")) {
			dispatcher = req.getRequestDispatcher("Owner/search_id.jsp");
			dispatcher.forward(req, res);
		}
		
		if(sPath.equals("/searchPro.ow")) {
			Map<String, String> authCheck = ownerService.authCheck(req);
			
			System.out.println("joinCheck: " + authCheck);
			// receiver -> 사업장번호 joinCheck 해서 db에 없으면 모달창 띄워서 실패 알림
			if(authCheck == null) {
				String msg = "미등록된 사업자번호입니다.";
				alertAndBack(res, msg);
			} else {
				// 난수를 활용하여 특정 범위의 값을 발생시키기 - SMS 인증번호 (숫자) 생성
				Random random = new Random();
				int randomNum = random.nextInt(1000000);
				String AuthNumber = String.format("%06d", randomNum);
				System.out.println(AuthNumber);
				
				session.setAttribute("AuthNumber", AuthNumber);
				
				// 인증번호 메일 발송
				String sender = "gus3241@naver.com";
				String receiver = req.getParameter("OWN_EMAIL");
				String title = "다이닝데이 - 점주 계정 찾기 인증번호 발송";
				String content = "인증번호는 [" + AuthNumber + "] 입니다.";
				
				try {
					Properties properties = System.getProperties();
					
					properties.put("mail.smtp.starttls.enable", "true");
					properties.put("mail.smtp.ssl.protocols", "TLSv1.2");
					properties.put("mail.smtp.host", "smtp.gmail.com");
					properties.put("mail.smtp.auth", "true");
					properties.put("mail.smtp.port", "587");
					
					Authenticator authenticator = new GoogleSMTPAuthenticator();
					Session mailSession = Session.getDefaultInstance(properties, authenticator);
					Message mailMessage = new MimeMessage(mailSession);
					Address sender_address = new InternetAddress(sender, "다이닝데이");
					Address receiver_address = new InternetAddress(receiver);
					
					mailMessage.setHeader("content-type", "text/html; charset=UTF-8");
					mailMessage.setFrom(sender_address);
					mailMessage.addRecipient(RecipientType.TO, receiver_address);
					mailMessage.setSubject(title);
					mailMessage.setContent(content, "text/html; charset=UTF-8");
					mailMessage.setSentDate(new Date());
					
					Transport.send(mailMessage);
					
//					// 인증메일 일치하는지 확인하기
//					String idCode = (String)req.getParameter("idCode");
//					req.setAttribute("idCode", idCode);
//					
//					if(AuthNumber.equals(idCode)) {
//					}
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}	
			res.sendRedirect("search_id.ow");
		}
			
			if(sPath.equals("/search_pw.ow")) {
				dispatcher = req.getRequestDispatcher("Owner/search_pw.jsp");
				dispatcher.forward(req, res);
			}	
			
			if(sPath.equals("/new_pw.ow")) {
				dispatcher = req.getRequestDispatcher("Owner/new_pw.jsp");
				dispatcher.forward(req, res);
			}	
			
			


//		-------------------------------------------------------------
		
		if(sPath.equals("/owner_login.ow")) {
			dispatcher = req.getRequestDispatcher("Owner/owner_login.jsp");
			dispatcher.forward(req, res);
		}		
		
		if(sPath.equals("/owner_loginPro.ow")) {
			System.out.println("req:" + req.toString());
			Map<String, String> ownerCheck = ownerService.ownerCheck(req);
			if(ownerCheck != null) {
				System.out.println("로그인 성공");
				session.setAttribute("STORE_NO", ownerCheck.get("STORE_NO"));
				session.setAttribute("id", ownerCheck.get("OWN_ID"));
				
				String adminId = (String)session.getAttribute("id");
				
				// 관리자로 로그인할 경우 관리자페이지로 이동
				if(adminId.equals("admin")) {
					res.sendRedirect("admin_main.ad");
				} else {
					res.sendRedirect("smain.ow");
				}
				
			} else {
				String msg = "아이디 혹은 비밀번호가 틀렸습니다.";
				alertAndBack(res, msg);
			}
		}

//		-------------------------------------------------------------
		
		if(sPath.equals("/smain.ow")) {
			System.out.println("주소비교 /smain.ow 일치");
			dispatcher = req.getRequestDispatcher("Store/smain.jsp");
			dispatcher.forward(req, res);
		}
		
		
		
		
		
		

		

	}
	
	// 모달창으로 메세지 알림 및 이전 페이지 이동
	public static void alertAndBack(HttpServletResponse res, String msg) {
	    try {
	        res.setContentType("text/html; charset=utf-8");
	        PrintWriter w = res.getWriter();
	        w.write("<script>alert('"+msg+"');history.go(-1);</script>");
	        w.flush();
	        w.close();
	    } catch(Exception e) {
	        e.printStackTrace();
	    }
	}
	
}


class GoogleSMTPAuthenticator extends Authenticator {
	PasswordAuthentication passwordAuthentication;

	public GoogleSMTPAuthenticator() {
		passwordAuthentication = new PasswordAuthentication("gyeon3241@gmail.com", "yukvgnaszlocornd");
	}
	
	@Override
	protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
		return passwordAuthentication;
	}
}