package com.hs.app.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hs.app.board.dao.BoardDao;
import com.hs.app.board.service.BoardService;
import com.hs.app.board.vo.ProfileInfo;
import com.hs.app.user.dao.UserDao;
import com.hs.app.user.vo.UserInfo;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	 
		
	@Autowired private BoardService boardService;
	@Autowired private BoardDao boardDao;
	@Autowired private UserDao userDao;
	@Autowired private BCryptPasswordEncoder passwordEncoder;
	
	/** */
	@RequestMapping(value = "/settings", method = RequestMethod.POST)
	@ResponseBody
	public void update(@RequestBody Map<String, Object> param,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		userDao.updateUser(param.get("email").toString(), passwordEncoder.encode(param.get("password").toString()));
	}
	
	/** 어드민로그인 */  
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String getAdminPage(HttpServletRequest request, ModelMap model) {

        return "run:home/main";
	}
	
	
	
	@RequestMapping(value = "/pg/settings", method = RequestMethod.GET)
	public String getSettings(ModelMap model) {
		UserInfo userInfo = userDao.getUserByIdx(1);
        model.put("inf", userInfo);
        return "run:home/settings";
	}
	
	/** 방명록 목록 */
	@RequestMapping(value = "/pg/guest_book/list", method = RequestMethod.GET)
	public String getGListPage(ModelMap model) {
        
        Map<String,Object> rst = boardService.loadGuestBookList(1, 10);
        model.put("result", rst);
        return "run:guest_book/list";
	}
	
	
	
	
	@RequestMapping(value = "/pg/profile/list", method = RequestMethod.GET)
	public String getProfileListPage(ModelMap model) {
		
        return "run:profile/list";
	}
	@RequestMapping(value = "/pg/profile/input", method = RequestMethod.GET)
	public String getProfileInputpage(ModelMap model) {
		
        return "run:profile/input";
	}
	@RequestMapping(value = "/pg/profile/input/{idx}", method = RequestMethod.GET)
	public String getProfileInputpageIdx(@PathVariable int idx, ModelMap model) {
		
		ProfileInfo info = boardDao.getProfileByIdx(idx);
		model.put("info", info);
		
        return "run:profile/input";
	}

}
