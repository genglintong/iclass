package com.soft.dao;

import java.util.List;

import org.hibernate.hql.ast.HqlASTFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.soft.domain.StudentGroup;

public class StudentGroupDao extends HibernateDaoSupport{

	public List<Integer> findStuByGid(Integer integer) {
		// TODO Auto-generated method stub
		String hql = "select studentId from StudentGroup where groupId=?";
		List<Integer> stulist = this.getHibernateTemplate().find(hql,integer);
		return stulist;
	}

	public void save(StudentGroup studentgroup) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(studentgroup);
	}

	public List<Integer> findGroupBySid(Integer studentId) {
		// TODO Auto-generated method stub
		String hql = "select groupId from StudentGroup where studentId=?";
		List<Integer> groupList = this.getHibernateTemplate().find(hql,studentId);
		return groupList;
	}
	
}
