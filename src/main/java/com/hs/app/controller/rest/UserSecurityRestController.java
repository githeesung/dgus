package com.hs.app.controller.rest;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hs.app.user.dao.UserDao;
import com.hs.app.user.service.UserService;
import com.hs.app.user.vo.UserInfo;
import com.hs.common.util.CookieUtil;

@RestController
@RequestMapping(value = "/api/account")
public class UserSecurityRestController {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired private UserService userService;	
	@Autowired private UserDao userDao;
	@Autowired private BCryptPasswordEncoder passwordEncoder;
	
	
	/** (로그인) */
	@RequestMapping(value = "signin", method = RequestMethod.POST)
	public Map<String,Object> login(
			@RequestBody Map<String, Object> param,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String,Object> r = new HashMap<String,Object>();
		
		// 비밀번호 유효성 검사(DB) -> JWT 생성 -> Cookie 저장 
		if(!userService.signIn(param.get("email").toString(), param.get("password").toString(), response)) {
			response.setStatus(401);
			r.put("errorMsg", "가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.");
		}
        return r;
	}
	
	/** (로그아웃) */
	@RequestMapping(value = "signout", method = RequestMethod.GET)
	public void signout(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws IOException {
		
		CookieUtil.deleteAllCookite(request, response);// 모든 쿠키 제거
		CookieUtil.logCookies();// 쿠키 출력   
		
		logger.debug("logout successed");
	}
	  
}
