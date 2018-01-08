package com.soft.action;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.soft.domain.Group;
import com.soft.service.GroupService;

public class GroupAction extends ActionSupport implements ModelDriven<Group>{

	Group currentGroup = new Group();
	private GroupService groupService;
	@Override
	public Group getModel() {
		// TODO Auto-generated method stub
		return null;
	}
	public GroupService getGroupService() {
		return groupService;
	}
	public void setGroupService(GroupService groupService) {
		this.groupService = groupService;
	}
	public String createGroup() {
		
		return null;
	}

}
