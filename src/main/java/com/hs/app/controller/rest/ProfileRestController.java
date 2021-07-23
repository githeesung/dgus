package com.hs.app.controller.rest;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hs.app.board.dao.BoardDao;
import com.hs.app.board.service.BoardService;
import com.hs.app.board.vo.ProfileInfo;
import com.nhncorp.lucy.security.xss.XssFilter;

@RestController
@RequestMapping(value = "/api/profile")
public class ProfileRestController {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	 
	@Autowired private BoardService boardService;
	@Autowired private BoardDao boardDao;
	
	
	@RequestMapping(value = "", method = RequestMethod.DELETE)
	public void deleteBoardMenu(@RequestBody int[] idxArray, HttpServletResponse response) {

		for(int i=0;i<idxArray.length;i++) {
			Integer idx = idxArray[i];			
			Integer r = boardDao.deleteProfileInfo(idx);
			if(r==null || r<1) {
				response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
				return;
			}
		}
        response.setStatus(HttpServletResponse.SC_OK);       
	}
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public Map<String,Object> getBoardItems(
        @RequestParam(required=false) Integer page,
        @RequestParam(required=false) String q) {
		
        page = (page==null||page<1)?1:page;
        Map<String,Object> rst = boardService.loadProfileList(page, 500);
        return rst;
	}
	@RequestMapping(value = "", method = RequestMethod.POST)
	public Map<String,Object> updateBoardItem(@RequestBody ProfileInfo info,
            HttpServletRequest request, HttpServletResponse response) {
		
		if(info.getIdx()!=null&&info.getIdx()>0) {
			boardDao.updateProfileInfo(info);
		}else {
			boardDao.insertProfileInfo(info);
		}
		
		
        return null;
	}
	
	

}
