package com.orm;

import java.io.Serializable;

public class TAdmin implements Serializable {
	
	private int userId;//id
	private String userName;//ÓÃ»§Ãû
	private String userPw;//ÃÜÂë

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

}
