package com.soft.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Transaction;
import org.hibernate.classic.Session;
import org.hibernate.hql.ast.HqlASTFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.soft.domain.Course;
import com.soft.domain.Teacher;

public class CourseDao extends HibernateDaoSupport{

	public int createCourse(Teacher teacher, Course course) {
		course.setTeacherId(teacher.getTeacherId());
		course.setGroupMaxNum(1);
		course.setGroupMinNum(1);
		this.getHibernateTemplate().save(course);
		return 1;
	}

	public int updateCourse(Teacher teacher, Course course) {
		this.getHibernateTemplate().update(course);
		return 1;
	}
	
	public List<Course> selectAllCourse() {
		String hql = "from Course";
		Query query = this.getSession().createQuery(hql);
		List<Course> list = query.list();
		//this.getHibernateTemplate().find(sql);
		System.out.println(list);
		return list;
	}

	public List<Course> findAllCourses(List<Integer> cid) {
		// TODO Auto-generated method stub
		List<Course> courses = new ArrayList<Course>();
		for(int i=0;i<cid.size();i++)
		{
			Course tempCourse = this.findById(cid.get(i));
			courses.add(tempCourse);
		}
		return courses;
	}
	public Course findById(Integer courseId)
	{
		String hql = "from Course where courseId = ?";
		List<Course> courses = this.getHibernateTemplate().find(hql,courseId);
		if(courses.size()>0)
		{
			return courses.get(0);
		}
		else {
			return null;
		}
		
	}

	public String getGroupPrefix(Integer courseId) {
		// TODO Auto-generated method stub
		String hql = "select groupPre from Course where courseId = ?";
		List<String> prefix = this.getHibernateTemplate().find(hql,courseId);
		return prefix.get(0);
	}
	
	/**
	 * 
	 * Author: genglintong
	 * Date:2017年12月31日下午6:48:50
	 * Desc:  更新小组配置
	 */
	public void updateGroupConfig(Course course) {
		// TODO 自动生成的方法存根
		System.out.println("test");
		/*Configuration config = new Configuration().configure();  
		SessionFactory sessionFactory = config.buildSessionFactory();  
		Session session = sessionFactory.openSession();  
        Query query = session.createQuery("update course t set t.groupMaxNum = "+groupMaxNum+"t.groupMinNum = "+groupMinNum + "t.groupPre = " + groupPre 
        		+ "where courseId = " + courseId + "and teacherId = " + teacherId);  
        query.executeUpdate();  
        session.getTransaction().commit(); */ 
		
		Session session = this.getHibernateTemplate().getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		
		String hql = "update Course course set "
				+"course.groupMaxNum = :groupMaxNum , "
				+"course.groupMinNum = :groupMinNum , "
				+"course.groupPre = :groupPre "
				+ "WHERE course.courseId = :courseId "
				+"AND course.teacherId = :teacherId ";
		Query query = session.createQuery(hql);
		//query.setString("sex", user.getSex());
		
		query.setInteger("groupMaxNum", course.getGroupMaxNum());
		query.setInteger("groupMinNum", course.getGroupMinNum());
		query.setString("groupPre", course.getGroupPre());
		query.setInteger("courseId", course.getCourseId());
		query.setInteger("teacherId", course.getTeacherId());
		
		query.executeUpdate();
		tx.commit();
		session.close();
	}


}
