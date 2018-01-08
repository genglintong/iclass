package com.soft.dao;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.hql.ast.HqlASTFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.soft.Util.iclassUtil;
import com.soft.domain.Course;
import com.soft.domain.Subject;

public class SubjectDao extends HibernateDaoSupport{

	private static int day = 3;
	public List<Subject> getSubjects(List<Course> courses) {
		// TODO Auto-generated method stub
		List<Subject> subjects = new ArrayList<>();
		for(int i=0;i<courses.size();i++)
		{
			Integer courseId = courses.get(i).getCourseId();
			String hql = "from Subject where courseId = ? ";
			List<Subject> tempSubject = this.getHibernateTemplate().find(hql,courseId);
			subjects.addAll(tempSubject);
			
		}
		if(subjects.size()>0)
		{
			return subjects;
		}
		else
		{
			return null;
		}
	}

	public Subject findById(Integer subjectId) {
		// TODO Auto-generated method stub
		String hql="from Subject where subjectId =?";
		List<Subject> subjects = this.getHibernateTemplate().find(hql,subjectId);
		return subjects.get(0);
	}
	
	
	/**
	 * Author: genglintong
	 * Date:2018年1月1日下午1:23:47
	 * Desc:用于获取尚未提交的且即将要到期的作业
	 */
	public List<Subject> getSubjectsWarn(List<Integer> coursesId) {
		// TODO Auto-generated method stub
		List<Subject> subjects = new ArrayList<>();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = iclassUtil.getTime(day);
		Date date;
		try {
			date = df.parse(time);
			System.out.println(time);
			for(int i=0;i<coursesId.size();i++)
			{
				Integer courseId = coursesId.get(i);
				String hql = "from Subject where courseId = ? and  deadLine <= ?";
				List<Subject> tempSubject = this.getHibernateTemplate().find(hql,courseId,date);
				subjects.addAll(tempSubject);
			}
			if(subjects.size()>0)
			{
				return subjects;
			}
			else
			{
				return null;
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
