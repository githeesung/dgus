package com.hs.app.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hs.app.board.dao.BoardDao;
import com.hs.app.board.service.BoardService;
import com.hs.app.board.vo.ProfileInfo;

@Controller
@RequestMapping(value = "")
public class MainController {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired private BoardService boardService;
	@Autowired private BoardDao boardDao;
	
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String getAdminPage(HttpServletRequest request, ModelMap model) {
        return "main:pages/home";
	}
	
	@RequestMapping(value = "intro", method = RequestMethod.GET)
	public String getIntro(HttpServletRequest request, ModelMap model) {
        return "main:pages/intro";
	}
	
	@RequestMapping(value = "greetings/{numb}", method = RequestMethod.GET)
	public String getGreetings(@PathVariable int numb, HttpServletRequest request, ModelMap model) {
        return "main:pages/greeting_"+numb;
	}
	
	@RequestMapping(value = "display", method = RequestMethod.GET)
	public String display(HttpServletRequest request, ModelMap model) {
        return "main:pages/display";
	}
	
	@RequestMapping(value = "works", method = RequestMethod.GET)
	public String works(HttpServletRequest request, ModelMap model) {
        return "main:pages/works";
	}
	@RequestMapping(value = "works/{idx}", method = RequestMethod.GET)
	public String works(@PathVariable int idx, HttpServletRequest request, ModelMap model) {
		ProfileInfo info =boardDao.getProfileByIdx(idx);
		if(info!=null) {
			model.put("info", info);
	        return "main:pages/works_pop";
		}
		return "redirect:/works";
	}
	@RequestMapping(value = "visitors", method = RequestMethod.GET)
	public String visitors(HttpServletRequest request, ModelMap model) {
        return "main:pages/visitors";
	}
	
	
	
	

}
