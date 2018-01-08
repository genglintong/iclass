package com.soft.domain;

import java.io.Serializable;
import java.util.Date;

public class logs implements Serializable{
	
	private Integer studentId;
	private Integer courseId;
	private Integer isComing;
	private Date creatDate;
	private Integer callNumber;//第几次点名
	
	
	public Integer getCallNumber() {
		return callNumber;
	}

	public void setCallNumber(Integer callNumber) {
		this.callNumber = callNumber;
	}

	@Override 
    public boolean equals(Object obj) { 
        if(obj instanceof logs){ 
        	logs pk=(logs)obj; 
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

	public Integer getIsComing() {
		return isComing;
	}
	public void setIsComing(Integer isComing) {
		this.isComing = isComing;
	}
	public Date getCreatDate() {
		return creatDate;
	}
	public void setCreatDate(Date creatDate) {
		this.creatDate = creatDate;
	}

	@Override
	public String toString() {
		return "logs [studentId=" + studentId + ", courseId=" + courseId + ", isComing=" + isComing + ", creatDate="
				+ creatDate + ", callNumber=" + callNumber + "]";
	}


	
	
	
	

}
