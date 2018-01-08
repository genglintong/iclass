package com.soft.domain;

import java.util.HashSet;
import java.util.Set;

public class Teacher {
	private Integer teacherId;
	private String teacherName;
	private String password;
	private String account;
	private Integer isFirstLogin;
	public Integer getTeacherId() {
		return teacherId;
	}
	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public Integer getIsFirstLogin() {
		return isFirstLogin;
	}
	public void setIsFirstLogin(Integer isFirstLogin) {
		this.isFirstLogin = isFirstLogin;
	}
	

}
