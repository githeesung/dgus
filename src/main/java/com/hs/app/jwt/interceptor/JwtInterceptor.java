package com.hs.app.jwt.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.hs.app.jwt.exception.UnauthorizedException;
import com.hs.app.jwt.service.JwtService;
import com.hs.app.user.dao.UserDao;
import com.hs.common.util.CookieUtil;

public class JwtInterceptor implements HandlerInterceptor {
	
	private final Logger logger = LoggerFactory.getLogger(getClass());
	private static final String HEADER_AUTH = "Authorization";

	@Autowired private JwtService jwtService;
	@Autowired private UserDao userDao;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		try { 
			
//			final String token = request.getHeader(HEADER_AUTH); 
			final String token = CookieUtil.getCookie("HSID", request);
			
			if(token != null && jwtService.isUsable(token)){
				request.setAttribute("HSID", token); 
				request.setAttribute("IDX", jwtService.getMemberId(token)); 
				return true;
			}else{
				response.setStatus(403);
				return false;
			} 
			
		} catch(Exception ec) {
			response.setStatus(403);
			return false;
		}
		    
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
		// TODO Auto-generated method stub
	}
}
