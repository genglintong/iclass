package com.soft.domain;

import java.util.List;

public class GroupAssit {
	private Group group;
	private List<Assit> assitList;
	
	public Group getGroup() {
		return group;
	}
	public void setGroup(Group group) {
		this.group = group;
	}
	public List<Assit> getAssitList() {
		return assitList;
	}
	public void setAssitList(List<Assit> assitList) {
		this.assitList = assitList;
	}
	
	@Override
	public String toString() {
		return "GroupAssit [group=" + group + ", assitList=" + assitList + "]";
	}
	
	
	
	
}
