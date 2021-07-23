package com.hs.app.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.hs.app.board.vo.GuestBook;
import com.hs.app.board.vo.ProfileInfo;


public class BoardDao extends SqlSessionDaoSupport {
	
	
	public Integer updateProfileInfo(ProfileInfo info) {
		return getSqlSession().update("board.updateProfileInfo", info);
	}
	
	public Integer deleteProfileInfo(int idx) {
		return getSqlSession().delete("board.deleteProfileInfo", idx);
	}
	
	public Integer deleteGuestBook(int idx) {
		return getSqlSession().delete("board.deleteGuestBook", idx);
	}
	
	
	public ProfileInfo getProfileByIdx(int idx) {
		return getSqlSession().selectOne("board.getProfileByIdx", idx);
	}
	
	public int getProfileSize() {
		return getSqlSession().selectOne("board.getProfileSize");
	}
	public List<GuestBook> getProfileList(int startRow, int rowBlockCount) {
		Map<String,Object> pMap = new HashMap<String,Object>();
		pMap.put("startRow", startRow);
		pMap.put("rowBlockCount", rowBlockCount);
		return getSqlSession().selectList("board.getProfileList", pMap);
	}
	
	public Integer insertProfileInfo(ProfileInfo info) {
		return getSqlSession().insert("board.insertProfileInfo", info);
	}
	
	
	public int getGuestBookSize() {
		return getSqlSession().selectOne("board.getGuestBookSize");
	}
	public List<GuestBook> getGuestBookList(int startRow, int rowBlockCount) {
		Map<String,Object> pMap = new HashMap<String,Object>();
		pMap.put("startRow", startRow);
		pMap.put("rowBlockCount", rowBlockCount);
		return getSqlSession().selectList("board.getGuestBookList", pMap);
	}
	
	
	public Integer updateGuestBoookNumb(GuestBook guestBook) {
		return getSqlSession().update("board.updateGuestBoookNumb", guestBook);
	}
	public GuestBook getInsertedGuestBookIdx(GuestBook guestBook) {
		return getSqlSession().selectOne("board.getInsertedGuestBookIdx", guestBook);
	}
	public Integer insertGuestBook(GuestBook guestBook) {
		return getSqlSession().insert("board.insertGuestBook", guestBook);
	}
	
	
	
	
    
    
}