package com.soft.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.soft.domain.Group;

public class GroupDao extends HibernateDaoSupport{

	public List<Integer> findByCourseId(Integer courseId) {
		// TODO Auto-generated method stub
		String hql = "select groupId from Group where courseId=?";
		List<Integer> groupIds = this.getHibernateTemplate().find(hql,courseId);
		if(groupIds.size()>0)
		{
			return groupIds;
		}
		else {
			return null;
		}
		
	}

	public int count() {
		// TODO Auto-generated method stub
		String hql = "from Group";
		List<Group> groups = this.getHibernateTemplate().find(hql);
		return groups.size();
	}

	public void save(Group group) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(group);
	}

	public Group findById(Integer groupId) {
		// TODO Auto-generated method stub
		String hql = "from Group where groupId=?";
		List<Group> groups = this.getHibernateTemplate().find(hql,groupId);
		return groups.get(0);
	}

	public void updateGroup(Group group2) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().update(group2);
	}

	public void addPhone(String phone,Integer groupId) {
		// TODO Auto-generated method stub
		Session session = this.getHibernateTemplate().getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		String hql = "update Group group set group.phoneNum = :phoneNum where group.groupId=:groupId";
		Query query = session.createQuery(hql);
		query.setString("phoneNum", phone);
		query.setInteger("groupId", groupId);
		query.executeUpdate();
		tx.commit();
		session.close();
	}
	

}
