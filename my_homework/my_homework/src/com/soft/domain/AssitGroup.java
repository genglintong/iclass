package com.soft.domain;

import java.util.List;

public class AssitGroup {
	private Assit assit ;
	private List<Group> groupList;
	
	public Assit getAssit() {
		return assit;
	}
	public void setAssit(Assit assit) {
		this.assit = assit;
	}
	public List<Group> getGroupList() {
		return groupList;
	}
	public void setGroupList(List<Group> groupList) {
		this.groupList = groupList;
	}
	
	@Override
	public String toString() {
		return "AssitGroup [assit=" + assit + ", groupList=" + groupList + "]";
	}
	
	
	
	
}
