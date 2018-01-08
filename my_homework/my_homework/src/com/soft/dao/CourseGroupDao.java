package com.soft.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.soft.domain.CourseGroup;
import com.soft.domain.StudentCourse;

public class CourseGroupDao extends HibernateDaoSupport{

	public void save(CourseGroup courseGroup) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(courseGroup);
	}

	public List<Integer> findGroupByCourseId(Integer courseId) {
		// TODO Auto-generated method stub
		String hql = "select groupId from CourseGroup where courseId=?";
		List<Integer> groupList = this.getHibernateTemplate().find(hql,courseId);
		return groupList;
	}

	
}
