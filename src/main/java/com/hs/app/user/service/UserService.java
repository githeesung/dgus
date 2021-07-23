package com.hs.app.user.service;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.hs.app.jwt.service.JwtService;
import com.hs.app.user.dao.UserDao;
import com.hs.app.user.vo.UserInfo;
import com.hs.common.util.CookieUtil;

public class UserService {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired private BCryptPasswordEncoder passwordEncoder;
	@Autowired private UserDao userDao;
	@Autowired private JwtService jwtService;
	
	
	
	
	
	
	
	/** signin User 
	 * @throws UnsupportedEncodingException */
	public boolean signIn(String email, String rawPassword, HttpServletResponse response) throws Exception {
		
		UserInfo userInfo = userDao.getUserByID(email);
		if(userInfo != null) {
			if(passwordEncoder.matches(rawPassword, userInfo.getUserPassword())) {
				
				userInfo.setUserPassword(null); // 비밀번호 데이터는 날림.
				
				String token = jwtService.create("member", userInfo, "user");// JWT 생성
				
				setLoginUserCookie(token, userInfo, response);// 쿠키 저장
				
		        response.setHeader("Authorization", token);// View없이 응답해줄때 사용
		        
				logger.debug("login successed");
				return true;
				 
			}else {
				logger.debug("invalide password");
			}
		}else {
			logger.debug("not found email");
		}
		return false;
	}
	
	public boolean autoSignIn(int userIdx, HttpServletResponse response) throws Exception {
		
		UserInfo userInfo = userDao.getUserByIdx(userIdx);
		if(userInfo != null) {

			String token = jwtService.create("member", userInfo, "user");// JWT 생성
			setLoginUserCookie(token, userInfo, response);// 쿠키 저장
			response.setHeader("Authorization", token);// View없이 응답해줄때 사용
			
			logger.debug("login successed");
			return true;
			
		}else {
			logger.debug("not found user information");
		}
		return false;
	}
	
	
	/** 로그온 유저 쿠키 셋팅   
	 * @throws Exception */
	private void setLoginUserCookie(String token, UserInfo userInf, HttpServletResponse response) throws Exception {
		
		// JWT 쿠키저장
		CookieUtil.setCookie("HSID", token, response);
		
		// UserInformation 쿠키저장
		CookieUtil.setCookie("user.email", userInf.getUserEmail(), response);
		
	}
	
	
	
	
	
//	/** (회원가입) */
//	public boolean signUp(UserInfo userInfo, Map<String,Object> resultMap) {
//		
//		String rawPassword = passwordEncoder.encode(userInfo.getUserPassword());
//		userInfo.setUserPassword(rawPassword);
//		
//		// 이미 해당 닉네임으로 가입된 회원정보가 존재
//		if(userDao.isUserByName(userInfo.getUserName())>0) {
//			logger.debug("이미 해당 닉네임으로 가입된 회원정보가 존재");
//			resultMap.put("errorCode", "01"); resultMap.put("errorMsg", "Duplicate nickname");
//			return false;
//		}
//		
//		// 이미 해당메일로 가입된 회원정보가 존재
//		if(userDao.getUserByEmail(userInfo.getUserEmail())!=null) {
//			logger.debug("이미 해당메일로 가입된 회원정보가 존재");
//			resultMap.put("errorCode", "02"); resultMap.put("errorMsg", "Duplicate email");
//			return false;
//		}
//		
//		UserInfo signedUser = userDao.insertUserInfo(userInfo);
//		if(signedUser!=null) {
//			userDao.insertAuth(signedUser.getUserIdx(), "ROLE_USER");
//			return true;
//
//			
//			
//		}
//		return false;
//	}
//	

    

}
