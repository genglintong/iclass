package com.soft.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.soft.domain.StudentCourse;

public class StudentCourseDao extends HibernateDaoSupport{

	public List<Integer> findBySid(Integer studentId) {
		String hql = "select courseId from StudentCourse where studentId=?";
		List<Integer> sc = this.getHibernateTemplate().find(hql,studentId);
		return sc;
	}
	public List<Integer> findByCid(Integer courseId) {
		String hql = "select studentId from StudentCourse where courseId=?";
		List<Integer> stuId = this.getHibernateTemplate().find(hql,courseId);
		return stuId;
		
	}
	public void save(Integer studentId, Integer courseId) {
		// TODO Auto-generated method stub
		StudentCourse studentCourse = new StudentCourse();
		studentCourse.setCourseId(courseId);
		studentCourse.setStudentId(studentId);
		this.getHibernateTemplate().saveOrUpdate(studentCourse);
	}
}
