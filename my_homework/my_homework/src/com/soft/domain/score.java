package com.soft.domain;

import java.io.Serializable;

public class score implements Serializable{
	private Double score;
	private Integer courseId;
	private Integer studentId;
	@Override 
    public boolean equals(Object obj) { 
        if(obj instanceof score){ 
        	score pk=(score)obj; 
            if(this.studentId.equals(pk.studentId)&&this.courseId.equals(pk.courseId)){ 
                return true; 
            } 
        } 
        return false; 
    }

    @Override 
    public int hashCode() { 
        return super.hashCode(); 
    }
    

	public Double getScore() {
		return score;
	}
	public void setScore(Double score) {
		this.score = score;
	}

	public Integer getCourseId() {
		return courseId;
	}

	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}

	public Integer getStudentId() {
		return studentId;
	}

	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}

	
	

}
