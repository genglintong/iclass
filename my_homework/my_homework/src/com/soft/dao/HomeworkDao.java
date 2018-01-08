package com.soft.dao;

import java.util.List;

import org.hibernate.hql.ast.HqlASTFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.soft.domain.Homework;

public class HomeworkDao extends HibernateDaoSupport{

	public Homework findBySubIdAndGroupId(Integer subjectId, int groupId) {
		// TODO Auto-generated method stub
		String hql = "from Homework where subjectId=? and groupId=?";
		List<Homework> homeworks = this.getHibernateTemplate().find(hql,subjectId,groupId);
		if(homeworks.size()>0)
			return homeworks.get(0);
		else
			return null;
	}

	public void save(Homework homework) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(homework);
	}

	public Homework findById(Integer homeworkId) {
		// TODO Auto-generated method stub
		String hql = "from Homework where homeworkId=?";
		List<Homework> homeworks = this.getHibernateTemplate().find(hql,homeworkId);
		return homeworks.get(0);
	}

	public void update(Homework homework) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().update(homework);
	}

	public void saveorupdate(Homework homework) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().saveOrUpdate(homework);
	}

}
