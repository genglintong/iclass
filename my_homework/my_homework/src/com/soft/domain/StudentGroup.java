package com.soft.domain;

import java.io.Serializable;

public class StudentGroup implements Serializable{
	
	private Integer studentId;
	private Integer groupId;
	
	@Override 
    public boolean equals(Object obj) { 
        if(obj instanceof StudentGroup){ 
        	StudentGroup pk=(StudentGroup)obj; 
            if(this.studentId.equals(pk.studentId)&&this.groupId.equals(pk.groupId)){ 
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
	public Integer getGroupId() {
		return groupId;
	}
	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}
	

}
