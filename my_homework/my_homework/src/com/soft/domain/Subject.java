package com.soft.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Subject {
	private Integer subjectId;
	private String subjectDesc;
	private Date createDate;
	private Date deadLine;
	private String subjectTitle;
	private Integer courseId;
	private Integer quanzhong;
	
	
	public Integer getQuanzhong() {
		return quanzhong;
	}
	public void setQuanzhong(Integer quanzhong) {
		this.quanzhong = quanzhong;
	}
	public Integer getCourseId() {
		return courseId;
	}
	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}
	public Integer getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(Integer subjectId) {
		this.subjectId = subjectId;
	}
	public String getSubjectDesc() {
		return subjectDesc;
	}
	public void setSubjectDesc(String subjectDesc) {
		this.subjectDesc = subjectDesc;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getDeadLine() {
		return deadLine;
	}
	public void setDeadLine(Date deadLine) {
		this.deadLine = deadLine;
	}
	public String getSubjectTitle() {
		return subjectTitle;
	}
	public void setSubjectTitle(String subjectTitle) {
		this.subjectTitle = subjectTitle;
	}

}
