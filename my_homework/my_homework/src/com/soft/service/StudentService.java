package com.soft.service;

import static org.hamcrest.CoreMatchers.nullValue;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.soft.Util.iclassUtil;
import com.soft.dao.CourseDao;
import com.soft.dao.CourseGroupDao;
import com.soft.dao.GroupDao;
import com.soft.dao.HomeworkDao;
import com.soft.dao.ScoreDao;
import com.soft.dao.StudentCourseDao;
import com.soft.dao.StudentDao;
import com.soft.dao.StudentGroupDao;
import com.soft.dao.SubjectDao;
import com.soft.domain.Course;
import com.soft.domain.Group;
import com.soft.domain.Homework;
import com.soft.domain.Student;
import com.soft.domain.Subject;
import com.sun.xml.internal.bind.v2.model.core.ID;

public class StudentService {
	
	StudentDao studentDao;
	StudentCourseDao studentCourseDao;
	ScoreDao scoreDao;
	CourseDao courseDao;
	SubjectDao subjectDao;
	StudentGroupDao studentGroupDao;
	HomeworkDao homeworkDao;
	CourseGroupDao courseGroupDao;
	
	public HomeworkDao getHomeworkDao() {
		return homeworkDao;
	}


	public void setHomeworkDao(HomeworkDao homeworkDao) {
		this.homeworkDao = homeworkDao;
	}


	public CourseDao getCourseDao() {
		return courseDao;
	}


	public void setStudentGroupDao(StudentGroupDao studentGroupDao) {
		this.studentGroupDao = studentGroupDao;
	}


	public void setCourseGroupDao(CourseGroupDao courseGroupDao) {
		this.courseGroupDao = courseGroupDao;
	}


	public void setSubjectDao(SubjectDao subjectDao) {
		this.subjectDao = subjectDao;
	}


	public void setCourseDao(CourseDao courseDao) {
		this.courseDao = courseDao;
	}


	public void setStudentDao(StudentDao studentDao) {
		this.studentDao = studentDao;
	}
	

	public void setScoreDao(ScoreDao scoreDao) {
		this.scoreDao = scoreDao;
	}
	


	public void setStudentCourseDao(StudentCourseDao studentCourseDao) {
		this.studentCourseDao = studentCourseDao;
	}


	public Student login(Student student) {
		// TODO Auto-generated method stub
		Student exitStudent = studentDao.findByAccountandPassword(student);
		return exitStudent;
	}

	public double getCourseScore(Integer courseId, Integer studentId) {
		// TODO Auto-generated method stub
		double score = scoreDao.getScore(courseId,studentId);
		return score;
	}


	public List<Course> getAllCourses(Integer studentId) {
		// TODO Auto-generated method stub
		List<Integer> cid = studentCourseDao.findBySid(studentId);
		List<Course> courses = courseDao.findAllCourses(cid);
		return courses;
	}


	public List<Subject> getSubjects(List<Course> courses) {
		// TODO Auto-generated method stub
		List<Subject> subjects = subjectDao.getSubjects(courses);
		return subjects;
	}


	public Integer getGroupId(Integer courseId, Integer studentId) {
		// TODO Auto-generated method stub
		List<Integer> group1 = studentGroupDao.findGroupBySid(studentId);
		List<Integer> group2 = courseGroupDao.findGroupByCourseId(courseId);
		if(group1 == null || group2 == null)
		{
			return null;
		}
		else
		{
			group1.retainAll(group2);
			if(group1.size()>0)
			{
				return group1.get(0);
			}
			else
			{
				return null;
			}
			
		}
		
	}


	public void changePassword(String newPassword, Integer studentId) {
		// TODO Auto-generated method stub
		studentDao.changePassword(newPassword,studentId);
	}


	public Student findById(Integer leaderId) {
		// TODO Auto-generated method stub
		Student student = studentDao.findById(leaderId);
		return student;
	}


	public String getGroupMember(Integer groupId) {
		// TODO Auto-generated method stub
		String allname = "";
		List<Integer> students = studentGroupDao.findStuByGid(groupId);
		for(int i=0;i<students.size();i++)
		{
			Integer Id = students.get(i);
			
			allname += studentDao.findById(Id).getStudentName() + " ";
		}
		return allname;
	}
	public String judgeHomework(Integer studentId,Integer subjectId,Integer courseId)
	{
		Integer groupId = this.getGroupId(courseId, studentId);
		if(groupId == null)
		{
			return "否";
		}
		else
		{
			Homework homework = homeworkDao.findBySubIdAndGroupId(subjectId, groupId);
			if(homework == null)
				return "否";
			else
				return "是";
		}
		
	}
	
	/**
	 * Author: genglintong
	 * Date:2017年12月31日下午4:35:10
	 * Desc:  获取报警信息
	 */
	public List<Subject> getSubjectWarn(Integer studentId) {
		List<Integer> courseList = studentCourseDao.findBySid(studentId);
		List<Subject> subjectsList = subjectDao.getSubjectsWarn(courseList);
		List<Subject> subjectsWarn = new ArrayList<>();
		if(subjectsList!=null)
		{
			for (int i = 0; i < subjectsList.size(); i++) {
			Subject subject = subjectsList.get(i);
			System.out.println(subject.getSubjectTitle());
			if (judgeHomework(studentId,subject.getSubjectId(),subject.getCourseId()) == "否") {
				subjectsWarn.add(subject);
				}
			}
		
		}
		return subjectsWarn;
		
	}
	/**
	 * Author: genglintong
	 * Date:2017年12月31日下午4:35:10
	 * Desc:  导入学生名单
	 */
	public boolean importStudentList(Map<Integer, String> map){
		List<Student> studentList = new ArrayList<>();
		
		for (int i=1; i<=map.size(); i++) {   
            //System.out.println(map.get(i));  
			Student student = new Student();
			String[] s = map.get(i).split(",");
			System.out.println(s[2]);
			student.setAccount(s[1]);
			student.setIsFirstLogin(1);
			student.setPassword(iclassUtil.MD5(s[1]));
			student.setStudentName(s[2]);
			Integer studentId = studentDao.insertStudent(student);
			studentList.add(student);
			Course course = (Course)ActionContext.getContext().getSession().get("course");
			studentCourseDao.save(studentId,course.getCourseId());
        }
		
		return true;
	}
	

}
