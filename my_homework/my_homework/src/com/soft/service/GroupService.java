package com.soft.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.interceptor.ActionMappingParametersInteceptor;

import com.soft.dao.GroupDao;
import com.soft.dao.StudentDao;
import com.soft.dao.StudentGroupDao;
import com.soft.domain.Group;
import com.soft.domain.Student;

public class GroupService {
	private GroupDao groupDao;
	private StudentGroupDao studentGroupDao;
	private StudentDao studentDao;
	
	public void setStudentDao(StudentDao studentDao) {
		this.studentDao = studentDao;
	}

	public void setStudentGroupDao(StudentGroupDao studentGroupDao) {
		this.studentGroupDao = studentGroupDao;
	}

	public GroupDao getGroupDao() {
		return groupDao;
	}

	public void setGroupDao(GroupDao groupDao) {
		this.groupDao = groupDao;
	}
	public Integer getNextIndex() {
		int size = groupDao.count();
		return size+1;
	}

	public void save(Group group) {
		// TODO Auto-generated method stub
		groupDao.save(group);
	}
	public Group findById(Integer groupId)
	{
		Group group = groupDao.findById(groupId);
		return group;
		
	}

	public void updateGroup(Group group2) {
		// TODO Auto-generated method stub
		groupDao.updateGroup(group2);
	}

	public List<Student> findStduents(Integer groupId) {
		// TODO Auto-generated method stub
		List<Integer> stuIds = studentGroupDao.findStuByGid(groupId);
		List<Student> students = new ArrayList<Student>();
		for(int i=0;i<stuIds.size();i++)
		{
			Student student = studentDao.findById(stuIds.get(i));
			students.add(student);
		}
		
		return students;
	}

	public void addphone(String phone,Integer groupId) {
		// TODO Auto-generated method stub
		groupDao.addPhone(phone,groupId);
	}
	

}
