package com.soft.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.soft.domain.*;


public class TeacherDao extends HibernateDaoSupport{
	
	@SuppressWarnings("unchecked")
	/**
	 * 登录验证
	 * @param teacher
	 * @return
	 */
	public Teacher findTeacherByNameAndPwd(Teacher teacher) {
		
		System.out.println(teacher);
		List<Teacher> allTeacher = this.getHibernateTemplate().find("from Teacher where account=? and password=?",
					new Object[]{teacher.getAccount(),teacher.getPassword()});
		if(allTeacher.size() == 1){
			System.out.println(allTeacher.get(0));
			return allTeacher.get(0);
		}
		return null;
	}

	public void setSubject(Subject subject) {
		System.out.println(subject);
		this.getHibernateTemplate().save(subject);
	}

	public void updateUserInfo(Teacher teacherFromSession) {
		System.out.println(teacherFromSession);
		teacherFromSession.setIsFirstLogin(1);
		this.getHibernateTemplate().update(teacherFromSession);
	}

	@SuppressWarnings("unchecked")
	public List<Homework> findHomework(Course course, String subjectTitle, Date commitDate, String groupAccount) {
		
		int index = 1;
		int index2 = 1;
		//模糊查询所有的作业题目
		String hql = "from Subject where 1=1 and courseId=:courseId ";
		Map<String,String> map = new HashMap<String,String>();
		if(subjectTitle!=null && subjectTitle.length() != 0){
			hql = hql + "and subjectTitle like :subjectTitle ";
			map.put("subjectTitle","%"+subjectTitle+"%");
//			query.setString("subjectTitle", "%"+subjectTitle+"%");
		}
		if(commitDate != null){
			hql = hql + "and createDate like :commitDate";
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			String createDate=sdf.format(commitDate);  
			map.put("commitDate","%"+createDate+"%");
		}
		System.out.println(hql);
		Session session = this.getSession();
		Query query = session.createQuery(hql);
		query.setParameter("courseId", course.getCourseId());
		for (Map.Entry<String,String> entry : map.entrySet()) {  
			System.out.println(entry.getKey() + "  "+ entry.getValue());
			query.setParameter(entry.getKey(), entry.getValue());  
		} 
		List<Subject> subjectList = query.list();
		for (Subject subject : subjectList) {
			System.out.println(subject);
		}
		
		//小组编号可以唯一的确定一个小组
	
		String newHql = "from Homework where 1=1";
		int groupId = 0;
		int flag = 0;
		System.out.println("不是空");
		System.out.println(groupAccount);
		try{
			String[] strArr = groupAccount.split("_");
			System.out.println(strArr[0]+" "+strArr[1]);
			groupId = Integer.parseInt(strArr[1]);
			newHql = newHql + " and groupId =:groupId ";
		}catch(Exception e){
			flag = 1;
		}
		
		if(flag == 1){
			int  sss = 0;//没用
			System.out.println("没用的代码");
			for (Subject subject : subjectList) {
				if(index == 1){
					newHql = newHql + "and subjectId =:subjectId"+index+" ";
					index++;
					System.out.println(subject);
				}
				else{
					newHql = newHql + "or subjectId =:subjectId"+index+" ";
					index++;
					System.out.println(subject);
				}
			}
		}
		System.out.println(newHql);
		Query query2 = session.createQuery(newHql);
		if(flag != 1){
			query2.setParameter("groupId", groupId);
		}
		//System.out.println(groupId);
		if(flag == 1)
		{
			for (Subject subject : subjectList){
				query2.setParameter("subjectId"+index2++, subject.getSubjectId());
				//System.out.println(subject.getSubjectId());
			}
		}
			
		List<Homework> listHomework = query2.list();
		for (Homework homework : listHomework) {
			System.out.println(homework);
		}
		session.close();
		return listHomework;
	}

	@SuppressWarnings("unchecked")
	public List<Course> findCourse(Course course,Teacher teacher){
		
		String hql = "from Course where teacherId=? and courseId=?";
		List<Course> list = this.getHibernateTemplate().find(hql,teacher.getTeacherId(),course.getCourseId());
		for (Course courses : list) {
			System.out.println(courses);
		}
		return list;
	}
	
	public List<StudentCourse> findStuByCourse(List<Course> list){
		int index = 1;
		int index2 = 1;
		String hql = "from StudentCourse where 1=1";
		for (Course course : list) {
			if(index == 1)
				hql = hql + " and courseId =:courseId"+index++;
			else{
				hql = hql + " or courseId =:courseId"+index++;
			}
		}
		Session session = this.getSession();
		Query query = session.createQuery(hql);
		for (Course course : list) {
			System.out.println("course.getCourseId() is :"+course.getCourseId());
			query.setParameter("courseId"+index2++, course.getCourseId());
		}
		List<StudentCourse> stuCourList = query.list();
		
		for (StudentCourse studentCourse : stuCourList) {
			System.out.println(studentCourse);
		}
		session.close();
		return stuCourList;
		
	}
	
	/**
	 * 查询所有学生信息从studentCourse表
	 * @param list
	 * @return
	 */
	public List<Student> findStuByStuCour(List<StudentCourse> list){
		int index = 1;
		int index2 = 1;
		String hql = "from Student where 1=1";
		for (StudentCourse studentCourse : list) {
			if(index == 1)
				hql = hql + " and studentId =:studentId"+index++;
			else{
				hql = hql + " or studentId =:studentId"+index++;
			}
		}
		Session session = this.getSession();
		Query query = session.createQuery(hql);
		for (StudentCourse studentCourse : list) {
			query.setParameter("studentId"+index2++, studentCourse.getStudentId());
		}
		List<Student> stuList = query.list();
		for (Student student : stuList) {
			System.out.println(student);
		}
		session.close();
		return stuList;
		
	}
	
	public List<StudentGroup> findStuGroup(int gropuId){
		String hql = "from StudentGroup where groupId = ?";
		List<StudentGroup> list = this.getHibernateTemplate().find(hql,gropuId);
		for (StudentGroup studentGroup : list) {
			System.out.println("studentGroup.getStudentId() is "+studentGroup.getStudentId());
		}
		return list;
	}
	public List<Student> findStudentById(List<StudentGroup> StudentGroupList){
		int index = 1;
		int index2 = 1;
		String hql = "from Student where 1=1 ";
		
		for (StudentGroup studentGroup : StudentGroupList) {
			if(index == 1)
				hql = hql + " and studentId =:studentId"+index++;
			else{
				hql = hql + " or studentId =:studentId"+index++;
			}
		}
		System.out.println(hql);
		Session session = this.getSession();
				Query query = session.createQuery(hql);
		for (StudentGroup studentGroup : StudentGroupList) {
			query.setParameter("studentId" + index2++, studentGroup.getStudentId());
		}
		List<Student> stulist = query.list();
		for (Student student : stulist) {
			System.out.println(student);
		}
		session.close();
		return stulist;
		
	}
	
	/**
	 * 查找当前老师的学生，如果输入小组号，则根据小组编号查
	 * 未输入小组号或者没有不规范则直接查找当前老师的所有学生信息
	 * @param teacher
	 * @param groupAccount
	 * @return
	 */
	public List<Student> findStudent(Course course,Teacher teacher,String groupAccount) {
		int flag = 0;
		int groupId = 0;
		if(groupAccount == null){
			List<Course> courseList = this.findCourse(course,teacher);
			List<StudentCourse> stuCourList = this.findStuByCourse(courseList);
			List<Student> studentList = this.findStuByStuCour(stuCourList);
			return studentList;
		}
		else if(groupAccount.length() != 0){
			try{
				String[] strArr = groupAccount.split("_");
				System.out.println(strArr[0]+" "+strArr[1]);
				groupId = Integer.parseInt(strArr[1]);
//				hql = hql + " and groupId =:groupId ";
			}catch(Exception e){
				flag = 1;
			
			}
		}
		if(flag != 1 && groupAccount.length() != 0){
			List<StudentGroup> StudentGroupList = this.findStuGroup(groupId);
			List<Student> stuList = findStudentById(StudentGroupList);
			return stuList;
		}
		else{
			//小组编号不存在的时候
			List<Course> courseList = this.findCourse(course,teacher);
			List<StudentCourse> stuCourList = this.findStuByCourse(courseList);
			List<Student> studentList = this.findStuByStuCour(stuCourList);
			return studentList;
		}
	}

	public List<Group> findCourseGroup(List<Course> courseList){
		int index = 1;
		int index2 = 1;
		String hql = "from Group where 1=1";
		for (Course course : courseList) {
			if(index == 1)
				hql = hql + " and courseId =:courseId"+index++;
			else{
				hql = hql + " or courseId =:courseId"+index++;
			}
		}
		Session session = this.getSession();
		Query query = session.createQuery(hql);
		for (Course course : courseList) {
			System.out.println("course.getCourseId() is :"+course.getCourseId());
			query.setParameter("courseId"+index2++, course.getCourseId());
		}
		List<Group> groupList = query.list();
		for (Group group : groupList) {
			System.out.println(group);
		}
		session.close();
		return groupList;
		
	}
	
	public List<Group> findAllGroup(Course course, Teacher teacher) {
		List<Course> courseList = this.findCourse(course,teacher);
		List<Group> groupList = this.findCourseGroup(courseList);
		return groupList;
	}

	public Group findGroupById(int id) {
		List<Group> list = this.getHibernateTemplate().find("from Group where groupId=?",id);
		System.out.println(list.get(0));
		return list.get(0);
	}

	public Subject findSubjectById(int id) {
		List<Subject> list = this.getHibernateTemplate().find("from Subject where subjectId=?",id);
		System.out.println(list.get(0));
		return list.get(0);
	}

	public List<Subject> findAllSubject(Teacher teacherFromSession,Course course) {
		List<Subject> list = this.getHibernateTemplate().find("from Subject where courseId=?",course.getCourseId());
		for (Subject subject : list) {
			System.out.println(subject);
		}
		return list;
	}

	public List<Student> findAllStudent(Course course,Teacher teacher) {
		List<Course> courseList = this.findCourse(course,teacher);
		List<StudentCourse> stuCourList = this.findStuByCourse(courseList);
		List<Student> studentList = this.findStuByStuCour(stuCourList);
		return studentList;
	}

	public void setCallLogs(logs log) {
		System.out.println("dao里边的log" + log);
		this.getHibernateTemplate().save(log);
	}


	
	/**
	 * 设置助教1
	 * @param course
	 * @return
	 */
	public List<Group> findAllGroupByCourse(Course course) {
		return this.getHibernateTemplate().find("from Group where courseId=?",course.getCourseId());
	}

	public List<Assit> findAllAssit(Course course) {
		return this.getHibernateTemplate().find("from Assit where courseId=?",course.getCourseId());
	}

	public List<Course> getAllCourse(Teacher teacherFromSession) {
		List<Course> list = this.getHibernateTemplate().find("from Course where teacherId=?",teacherFromSession.getTeacherId());
		
		for (Course course : list) {
			System.out.println(course);
		}
		
		return list;
	}

	public Course getCourseByName(int courseId) {
		List<Course> courseList = this.getHibernateTemplate().find("from Course where courseId=?",courseId);
		return courseList.get(0);
	}

	public void updateCourse(Course course) {
		this.getHibernateTemplate().update(course);
	}

	public Teacher findById(Integer tid) {
		// TODO Auto-generated method stub
		String hql="from Teacher where teacherId = ?";
		List<Teacher> teachers = this.getHibernateTemplate().find(hql,tid);
		return teachers.get(0);
	}

	public void setAssist2Impl(String groupIdStr, String assitIdStr) {
		int groupId = Integer.parseInt(groupIdStr);
		List<Group> groupList = this.getHibernateTemplate().find("from Group where groupId=?",groupId);
		Group group = groupList.get(0);
		int assistId = Integer.parseInt(assitIdStr);
		group.setAssitId(assistId);
		this.getHibernateTemplate().update(group);
	}

	public List<StudentGroup> findAllStudentGroup(Student student) {
		List<StudentGroup> StudentGroupList = this.getHibernateTemplate().find("from StudentGroup where studentId=?",student.getStudentId());
		for (StudentGroup studentGroup : StudentGroupList) {
			System.out.println(studentGroup.getStudentId());
		}
		
		return StudentGroupList;
	}

	public List<Group> findAllGroupBygroupStu(Course course, List<StudentGroup> studentGroupList) {
		
		
		
		int index = 1;
		int index2 = 1;
		String hql = "from Group where 1=1";
		hql = hql + " and courseId =:courseId";
		
		for (StudentGroup studentGroup : studentGroupList) {
			if(index == 1){
				hql = hql + " and groupId =:groupId"+index++;
			}else{
//				hql = hql + " or courseId =:courseId"+index++;
				hql = hql + " or groupId =:groupId"+index++;
			}
			
		}
		Session session = this.getSession();
		Query query = session.createQuery(hql);
		System.out.println(hql + " "+course.getCourseId() );
		query.setParameter("courseId", course.getCourseId());
		for (StudentGroup studentGroup : studentGroupList) {
				query.setParameter("groupId"+index2++, studentGroup.getGroupId());
		}
		List<Group> groupList = query.list();
		session.close();
		return groupList;
	}

	public List<Homework> findAllHomeworkByGrup(List<Group> groupList) {
		int index = 1;
		int index2 = 1;
		String hql = "from Homework where 1=1";
		
		for (Group group : groupList) {
			if(index == 1){
				hql = hql + " and groupId =:groupId"+index++;
			}else{
				hql = hql + " or groupId =:groupId"+index++;
			}
			
		}
		Session session = this.getSession();
		Query query = session.createQuery(hql);
		System.out.println(hql);
		for (Group group : groupList) {
				query.setParameter("groupId"+index2++, group.getGroupId());
		}
		List<Homework> homeworkLists = query.list();
		
		for (Homework homework : homeworkLists) {
			System.out.println(homework);
		}
		session.close();
		return homeworkLists;
	}

	public List<logs> findAllLogs(Course course, Student student) {
		List<logs> logsList = this.getHibernateTemplate().find("from logs where studentId=? and courseId=?",student.getStudentId(),course.getCourseId());
		for (logs logs : logsList) {
			System.out.println(logs);
		}
		return logsList;
	}
	
	
	

	
}
