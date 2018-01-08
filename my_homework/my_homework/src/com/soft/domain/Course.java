package com.soft.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Course {
	private Integer courseId;
	private Integer groupMaxNum;
	private Integer groupMinNum;
	private String groupPre;
	private String courseName;
	private String courseDesc;
	private Date createdate;
	private Integer teacherId;
	private String kaohefangshi="";
	private String shoukeshichang="";
	private Integer allCallNumber;//本门课程的点名次数
	private Integer onCallScore;//一次点名 的得分
	
	public String getKaohefangshi() {
		return kaohefangshi;
	}

	public void setKaohefangshi(String kaohefangshi) {
		this.kaohefangshi = kaohefangshi;
	}

	public String getShoukeshichang() {
		return shoukeshichang;
	}

	public void setShoukeshichang(String shoukeshichang) {
		this.shoukeshichang = shoukeshichang;
	}

	public String getCourseDesc() {
		return courseDesc;
	}

	public void setCourseDesc(String courseDesc) {
		this.courseDesc = courseDesc;
	}

	public Integer getAllCallNumber() {
		return allCallNumber;
	}

	public void setAllCallNumber(Integer allCallNumber) {
		this.allCallNumber = allCallNumber;
	}

	public Integer getOnCallScore() {
		return onCallScore;
	}

	public void setOnCallScore(Integer onCallScore) {
		this.onCallScore = onCallScore;
	}

	@Override
	public String toString() {
		return "Course [courseId=" + courseId + ", groupMaxNum=" + groupMaxNum + ", groupMinNum=" + groupMinNum
				+ ", groupPre=" + groupPre + ", courseName=" + courseName + ", createdate=" + createdate
				+ ", teacherId=" + teacherId + "]";
	}
	
	public Integer getCourseId() {
		return courseId;
	}
	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}
	public Integer getGroupMaxNum() {
		return groupMaxNum;
	}
	public void setGroupMaxNum(Integer groupMaxNum) {
		this.groupMaxNum = groupMaxNum;
	}
	public Integer getGroupMinNum() {
		return groupMinNum;
	}
	public void setGroupMinNum(Integer groupMinNum) {
		this.groupMinNum = groupMinNum;
	}
	public String getGroupPre() {
		return groupPre;
	}
	public void setGroupPre(String groupPre) {
		this.groupPre = groupPre;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public Date getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
	public Integer getTeacherId() {
		return teacherId;
	}
	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}
	
	
	
	
	
}
