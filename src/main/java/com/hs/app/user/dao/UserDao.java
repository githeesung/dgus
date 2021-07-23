package com.hs.app.user.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.hs.app.user.vo.UserInfo;

public class UserDao extends SqlSessionDaoSupport {
	
	@Autowired private BCryptPasswordEncoder passwordEncoder;
	
	
	
	public Integer updateUser(String userEmail, String userPassword) {
		Map<String,Object> pMap = new HashMap<String,Object>();
		pMap.put("userEmail", userEmail);
		pMap.put("userPassword", userPassword);
		return getSqlSession().update("user.updateUser", pMap);
	}
	
	/** 시퀀스로 회원정보 로드 */
	public UserInfo getUserByIdx(Integer userIdx) {
		return getSqlSession().selectOne("user.getUserByIdx", userIdx);
	}
	
	/** 이메일로 회원정보 로드 */
	public UserInfo getUserByID(String id) {
		return getSqlSession().selectOne("user.getUserByID", id);
	}
	

	
	
	/** 회원 등록 */
	public UserInfo insertUserInfo(UserInfo userInfo) {
		Integer r = getSqlSession().insert("user.insertUserInfo", userInfo);
		if(r!=null&&r>0) {
			UserInfo dbInfo = this.getUserByID(userInfo.getUserEmail());
			return dbInfo;
		}
		return null;
	}
	
	/** 권한 등록 */
	public boolean insertAuth(int userIdx, String authName) {
		Map<String,Object> pMap = new HashMap<String,Object>();
		pMap.put("userIdx", userIdx);
		pMap.put("authName", authName);
		Integer r = getSqlSession().insert("user.insertAuth", pMap);
		if(r != null && r > 0) {
			return true;
		}
		return false;
	}
	
	
	//----------------------------------------------------------------------------------------
	
	
	
	
	
	public Integer updateEnableCheckEmail(int idx) {
		return getSqlSession().update("user.updateEnableCheckEmail", idx);
	}
	
	public Integer hasCheckEmail(int userIdx, String signKey) {
		Map<String,Object> pMap = new HashMap<String,Object>();
		pMap.put("userIdx", userIdx);
		pMap.put("signKey", signKey);
		return getSqlSession().selectOne("user.hasCheckEmail", pMap);
	}
	
	public boolean insertCheckEmail(int userIdx, String signKey) {
		Map<String,Object> pMap = new HashMap<String,Object>();
		pMap.put("userIdx", userIdx);
		pMap.put("signKey", signKey);
		Integer r = getSqlSession().insert("user.insertCheckEmail", pMap);
		if(r != null && r > 0) {
			return true;
		}
		return false;
	}
	
	

	
	public boolean updateUserImgIntro(UserInfo userInfo) {
		Integer r = getSqlSession().update("user.updateUserImgIntro", userInfo);
		if(r != null && r > 0) {
			return true;
		}
		return false;
	}
	
	public boolean updateUserInfo(UserInfo userInfo) {
		Integer r = getSqlSession().update("user.updateUserInfo", userInfo);
		if(r != null && r > 0) {
			return true;
		}
		return false;
	}
	
	/** 프로필 변경 */
	public boolean updateProfile(int idx, String img) {
		Map<String,Object> pMap = new HashMap<String,Object>();
		pMap.put("idx", idx);
		pMap.put("img", img);
		Integer r = getSqlSession().update("user.updateProfile", pMap);
		if(r != null && r > 0) {
			return true;
		}
		return false;
	}
	
	
	
	

	
	
	/** 권한 삭제 */
	public boolean deleteAuth(int userIdx, String authName) {
		Map<String,Object> pMap = new HashMap<String,Object>();
		pMap.put("userIdx", userIdx);
		pMap.put("authName", authName);
		Integer r = getSqlSession().insert("user.deleteAuth", pMap);
		if(r != null && r > 0) {
			return true;
		}
		return false;
	}
	
	
	
	/** 회원 상세 쿼리 */
	public UserInfo getUser(int idx) {
		return getSqlSession().selectOne("user.getUser", idx);
	}
	

    
}
