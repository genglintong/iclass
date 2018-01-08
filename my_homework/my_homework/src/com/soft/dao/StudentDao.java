package com.soft.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.openxmlformats.schemas.drawingml.x2006.main.STTextUnderlineType;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.soft.Util.*;

import com.opensymphony.xwork2.ActionContext;
import com.soft.domain.Student;

import sun.security.provider.MD5;

public class StudentDao extends HibernateDaoSupport{

	public Student findByAccountandPassword(Student student){
		// TODO Auto-generated method stub
		String hql = "from Student where account=? and password=?";
		String pass = iclassUtil.MD5(student.getPassword());
		List<Student> studentList = this.getHibernateTemplate().find(hql, student.getAccount(),pass);
		if(studentList.size() == 0 )
		{
			return null;
		}
		else {
			return studentList.get(0);
		}
	}
	public Student findById(Integer studentId)
	{
		String hql = "from Student where studentId=?";
		List<Student> students = this.getHibernateTemplate().find(hql,studentId);
		if(students.size()>0)
		{
			return students.get(0);
		}
		else {
			return null;
		}		
	}
	public void changePassword(String newPassword, Integer studentId) {
		// TODO Auto-generated method stub
		Session session = this.getHibernateTemplate().getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		String hql = "update Student student set student.password = :password , student.isFirstLogin = :isFirstLogin where student.studentId=:studentId";
		Query query = session.createQuery(hql);
		newPassword = iclassUtil.MD5(newPassword);
		query.setString("password", newPassword);
		query.setInteger("isFirstLogin", 0);
		query.setInteger("studentId", studentId);
		query.executeUpdate();
		tx.commit();
		session.close();
		Student student = this.findById(studentId);
		ActionContext.getContext().getSession().put("existStudent", student);
	}
	
	/**
	 * Author: genglintong
	 * Date:2017年12月31日下午4:59:42
	 * Desc:插入学生数据
	 */
	public boolean insert(List<Student> studentList){
		int num = studentList.size();
		for (int i = 0; i < num; i++) {
			this.getHibernateTemplate().save(studentList.get(i));
		}
		return true;
	}
	public Integer insertStudent(Student student) {
		// TODO Auto-generated method stub
		String account = student.getAccount();
		Student student2 = this.findByAccount(account);
		if(student2 == null)
		{
			this.getHibernateTemplate().save(student);
			return student.getStudentId();
		}
		else
		{
			return student2.getStudentId();
		}
	}
	private Student findByAccount(String account) {
		// TODO Auto-generated method stub
		String hql = "from Student where account=?";
		List<Student> students = this.getHibernateTemplate().find(hql,account);
		if(students.size()>0)
		{
			return students.get(0);
		}
		else
		{
			return null;
		}
		
	}

}
