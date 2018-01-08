package com.soft.domain;

import java.util.List;

public class studentWithScore {
	private Student student;
	private List<logs> logsList;
	
	private List<Homework> homeworkList;
	private Double callScore;
	private Double homeWorkScore;
	private Double allScore;
	
	public List<logs> getLogsList() {
		return logsList;
	}
	public void setLogsList(List<logs> logsList) {
		this.logsList = logsList;
	}
	public List<Homework> getHomeworkList() {
		return homeworkList;
	}
	public void setHomeworkList(List<Homework> homeworkList) {
		this.homeworkList = homeworkList;
	}

	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	
	public Double getCallScore() {
		return callScore;
	}
	public void setCallScore(Double callScore) {
		this.callScore = callScore;
	}
	public Double getHomeWorkScore() {
		return homeWorkScore;
	}
	public void setHomeWorkScore(Double homeWorkScore) {
		this.homeWorkScore = homeWorkScore;
	}
	public Double getAllScore() {
		return allScore;
	}
	public void setAllScore(Double allScore) {
		this.allScore = allScore;
	}
	@Override
	public String toString() {
		return "studentWithScore [student=" + student + ", callScore=" + callScore + ", homeWorkScore=" + homeWorkScore
				+ ", allScore=" + allScore + "]";
	}
	
	
	
}
