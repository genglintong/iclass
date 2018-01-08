package com.soft.domain;

import java.io.Serializable;

public class CourseGroup implements Serializable{
	private Integer courseId;
	private Integer groupId;
	public Integer getCourseId() {
		return courseId;
	}
	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}
	public Integer getGroupId() {
		return groupId;
	}
	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}
	@Override 
    public boolean equals(Object obj) { 
        if(obj instanceof CourseGroup){ 
        	CourseGroup pk=(CourseGroup)obj; 
            if(this.courseId.equals(pk.courseId)&&this.groupId.equals(pk.groupId)){ 
                return true; 
            } 
        } 
        return false; 
    }

    @Override 
    public int hashCode() { 
        return super.hashCode(); 
    }

}
