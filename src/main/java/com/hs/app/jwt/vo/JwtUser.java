package com.hs.app.jwt.vo;

import java.io.Serializable;

public class JwtUser implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private Integer idx;
	private String email;
	
	
	public JwtUser() {}
	public JwtUser(Integer idx, String email) {
		this.idx = idx;
		this.email = email;
	}
	
	public Integer getIdx() {
		return idx;
	}
	public void setIdx(Integer idx) {
		this.idx = idx;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
}
