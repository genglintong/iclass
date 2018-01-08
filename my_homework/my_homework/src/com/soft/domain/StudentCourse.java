package com.soft.domain;

import java.io.Serializable;

public class StudentCourse implements Serializable{
	private Integer studentId;
	private Integer courseId;
	@Override 
    public boolean equals(Object obj) { 
        if(obj instanceof StudentCourse){ 
        	StudentCourse pk=(StudentCourse)obj; 
            if(this.courseId.equals(pk.courseId)&&this.studentId.equals(pk.studentId)){ 
                return true; 
            } 
        } 
        return false; 
    }

    @Override 
    public int hashCode() { 
        return super.hashCode(); 
    }

	public Integer getStudentId() {
		return studentId;
	}
	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}
	public Integer getCourseId() {
		return courseId;
	}
	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}
	

}
