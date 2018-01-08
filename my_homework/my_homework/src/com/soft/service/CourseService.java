package com.soft.service;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.soft.dao.CourseDao;
import com.soft.dao.CourseGroupDao;
import com.soft.dao.GroupDao;
import com.soft.dao.ProductDao;
import com.soft.dao.StudentCourseDao;
import com.soft.dao.StudentDao;
import com.soft.dao.StudentGroupDao;
import com.soft.domain.Course;
import com.soft.domain.CourseGroup;
import com.soft.domain.Product;
import com.soft.domain.Student;
import com.soft.domain.StudentGroup;
import com.soft.domain.Teacher;

import jdk.internal.org.objectweb.asm.tree.IntInsnNode;

public class CourseService { 
	private CourseDao courseDao;
	private StudentCourseDao studentCourseDao;
	private StudentDao studentDao;
	private GroupDao groupDao;
	private StudentGroupDao studentGroupDao;
	private CourseGroupDao courseGroupDao;
	
	public void setCourseGroupDao(CourseGroupDao courseGroupDao) {
		this.courseGroupDao = courseGroupDao;
	}

	public void setStudentGroupDao(StudentGroupDao studentGroupDao) {
		this.studentGroupDao = studentGroupDao;
	}

	public void setGroupDao(GroupDao groupDao) {
		this.groupDao = groupDao;
	}

	public void setStudentDao(StudentDao studentDao) {
		this.studentDao = studentDao;
	}

	public void setStudentCourseDao(StudentCourseDao studentCourseDao) {
		this.studentCourseDao = studentCourseDao;
	}

	public CourseDao getCourseDao() {
		return courseDao;
	}

	public void setCourseDao(CourseDao courseDao) {
		this.courseDao = courseDao;
	}

	public int createCourseServ(Teacher teacher, Course course) {
		return courseDao.createCourse(teacher,course);
	}

	public int changeCourse(Teacher teacher, Course course) {
		return courseDao.updateCourse(teacher,course);
	}
	//查找选课学生
	public List<Student> findStudent(Integer courseId){
		List<Integer> stuId = this.studentCourseDao.findByCid(courseId);
		List<Student> students = new ArrayList<Student>();
		for(int  i=0;i<stuId.size();i++)
		{
			int studentId = stuId.get(i);
			Student student = studentDao.findById(studentId);
			students.add(student);
		}
		return students;
	}
	public List<Student> findUngroupStu(Integer courseId){
		List<Integer> stuId = this.studentCourseDao.findByCid(courseId);
		List<Integer> groupId = this.groupDao.findByCourseId(courseId);
		List<Student> students = new ArrayList<Student>();
		if(groupId == null)
		{
			students = this.findStudent(courseId);		
		}
		else 
		{
			
			for(int i=0;i<groupId.size();i++)
			{
				
				List<Integer> hasGroupStu = this.studentGroupDao.findStuByGid(groupId.get(i));
				for(int h=0;h<stuId.size();h++)
				{
					
					for(int m=0;m<hasGroupStu.size();m++)
					{
						
						
						if(stuId.get(h).equals(hasGroupStu.get(m)))
						{
							stuId.remove(h);
							h--;
							break;
						}
					}
				}
			}
			for(int j=0;j<stuId.size();j++)
			{
				int studentId = stuId.get(j);
				Student student = studentDao.findById(studentId);
				students.add(student);
			}	
		}
		return students;
	}
	
	public String getPrefix(Integer courseId)
	{
		String prefix = courseDao.getGroupPrefix(courseId);
		return prefix;
	}
	
	public void insertStuGroup(Integer studentId,Integer groupId)
	{
		StudentGroup studentgroup = new StudentGroup();
		studentgroup.setGroupId(groupId);
		studentgroup.setStudentId(studentId);
		studentGroupDao.save(studentgroup);
	}

	public void insertcouGroup(int courseId, int nextIndex) {
		// TODO Auto-generated method stub
		CourseGroup courseGroup = new CourseGroup();
		courseGroup.setCourseId(courseId);
		courseGroup.setGroupId(nextIndex);
		courseGroupDao.save(courseGroup);
	}

	public Course finfById(int courseId) {
		// TODO Auto-generated method stub
		Course course = this.courseDao.findById(courseId);
		return course;
	}
	
	public void groupConfig(
			int courseId,int teacherId,int groupMaxNum,
			int groupMinNum,String groupPre) {
		Course course = new Course();
		course.setCourseId(courseId);
		course.setGroupPre(groupPre);
		course.setGroupMaxNum(groupMaxNum);
		course.setGroupMinNum(groupMinNum);
		course.setTeacherId(teacherId);
		courseDao.updateGroupConfig(course);
	}
	public List<Course> selectAllCourse() {
		return courseDao.selectAllCourse();
	}
	
	
	
	
 
}
