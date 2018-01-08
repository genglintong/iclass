package com.soft.Util;

/**
 * 
 * Project Name:my_homework 
 * File Name:StudentReport.java 
 * Package Name:com.soft.Util 
 * Author: genglintong
 * Date:2018年1月1日下午2:55:19  
 * Desc:用于导出学生信息
 */
public class StudentReport{
	private String studentName;
	private String studentNum;
	private String studentScore;
	
	public  StudentReport(String studentName,String studentNum,String studentScore) {
		this.studentName = studentName;
		this.studentNum = studentNum;
		this.studentScore = studentScore;
	}
	
	public String getStudentScore() {
		return studentScore;
	}
	public void setStudentScore(String studentScore) {
		this.studentScore = studentScore;
	}
	public String getStudentNum() {
		return studentNum;
	}
	public void setStudentNum(String studentNum) {
		this.studentNum = studentNum;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	
	
}