package com.soft.domain;

import java.util.HashSet;
import java.util.Set;

public class Assit {
	private Integer assitId;
	@Override
	public String toString() {
		return "Assit [assitId=" + assitId + ", assitName=" + assitName + ", password=" + password + ", courseId="
				+ courseId + "]";
	}
	private String assitName;
	private String password;
	private Integer courseId;
	
	public Integer getCourseId() {
		return courseId;
	}
	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}
	public String getAssitName() {
		return assitName;
	}
	public Integer getAssitId() {
		return assitId;
	}
	public void setAssitId(Integer assitId) {
		this.assitId = assitId;
	}
	public void setAssitName(String assitName) {
		this.assitName = assitName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
