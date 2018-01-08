package com.soft.domain;

import java.util.HashSet;
import java.util.Set;

import org.apache.jasper.tagplugins.jstl.core.Choose;

public class Student{
	private Integer studentId;
	private String studentName;
	private String account;
	private String password;
	private String banji;
	private Integer isFirstLogin;	
	
	public String getBanji() {
		return banji;
	}
	public void setBanji(String banji) {
		this.banji = banji;
	}
	public Integer getStudentId() {
		return studentId;
	}
	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getIsFirstLogin() {
		return isFirstLogin;
	}
	public void setIsFirstLogin(Integer isFirstLogin) {
		this.isFirstLogin = isFirstLogin;
	}
	

}
