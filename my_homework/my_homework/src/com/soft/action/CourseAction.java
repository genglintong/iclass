package com.soft.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.aspectj.org.eclipse.jdt.internal.core.CreateCompilationUnitOperation;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.soft.domain.Course;
import com.soft.domain.Group;
import com.soft.domain.Student;
import com.soft.domain.Teacher;
import com.soft.service.CourseService;
import com.soft.service.GroupService;

public class CourseAction extends ActionSupport implements ModelDriven<Course> {
	
	private Course course = new Course();
	private Teacher teacher = null;
	private CourseService courseService = null;
	private GroupService groupService;
	private String teacherName;
	private String checkName ;
	private String Phone;
	private HttpServletRequest request ;
	private Integer parameterGroupId ;
	
	public String getPhone() {
		return Phone;
	}

	public void setPhone(String phone) {
		Phone = phone;
	}

	public Integer getParameterGroupId() {
		return parameterGroupId;
	}

	public void setParameterGroupId(Integer parameterGroupId) {
		this.parameterGroupId = parameterGroupId;
	}

	public String getCheckName() {
		return checkName;
	}

	public void setCheckName(String checkName) {
		this.checkName = checkName;
	}

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public void setGroupService(GroupService groupService) {
		this.groupService = groupService;
	}

	public CourseService getCourseService() {
		return courseService;
	}

	public void setCourseService(CourseService courseService) {
		this.courseService = courseService;
	}

	@Override
	public Course getModel() {
		return course;
	}
	
	public void getTeacherFromSession(){
		ActionContext actionContext = ActionContext.getContext();
		Map<String, Object> sessionAttribute = actionContext.getSession();
		teacher = (Teacher) sessionAttribute.get("teacher");
	}
	
	public String createCourse(){
		this.getTeacherFromSession();//获取teacher对象
		if(0 != courseService.createCourseServ(teacher,course)){
			return "createSuccess";
		}
		return "createError";
	}
	
	public String chengeCourse(){
		this.getTeacherFromSession();
		if(0 != courseService.changeCourse(teacher,course));
		return "success";
		
	}
	
	public String CreateGroup() {
		Course currcourse = (Course)ActionContext.getContext().getSession().get("currentCourse");
		Integer courseId = currcourse.getCourseId();
		Student currentStudent = (Student)ActionContext.getContext().getSession().get("existStudent");
		Integer studentId = currentStudent.getStudentId();
		List<Student> students = courseService.findUngroupStu(courseId);
		for(int i=0;i<students.size();i++)
		{
			if(students.get(i).getStudentId() == studentId)
			{
				Group group = new Group();
				group.setCourseId(courseId);
				group.setLeaderId(studentId);
				String groupPrefix = courseService.getPrefix(courseId);
				int nextIndex = groupService.getNextIndex();
				String groupName = groupPrefix + "_" + nextIndex;
				group.setGroupName(groupName);
				group.setPersonNum(1);
				groupService.save(group);
				Group group2 = groupService.findById(nextIndex);
				courseService.insertStuGroup(studentId, nextIndex);
				courseService.insertcouGroup(courseId, nextIndex);
				ActionContext.getContext().getValueStack().set("group",group2);
				this.parameterGroupId = group2.getGroupId();
				students.remove(i);
				ActionContext.getContext().getValueStack().set("AllStudents", students);
				return "CreateGroup";
			}
		}
		
		return "CreateFailed";
	}
	
	public String refreshGroup()
	{
		Course currcourse = (Course)ActionContext.getContext().getSession().get("currentCourse");
		Integer courseId = currcourse.getCourseId();
		this.request = ServletActionContext.getRequest();
		Integer groupId = Integer.parseInt(this.request.getParameter("groupId"));
		Student currentStudent = (Student)ActionContext.getContext().getSession().get("existStudent");
		Integer studentId = currentStudent.getStudentId();
		List<Student> students = courseService.findUngroupStu(courseId);
		List<Student> hasGroupStudents = groupService.findStduents(groupId);
		Group group2 = groupService.findById(groupId);
		ActionContext.getContext().getValueStack().set("group",group2);
		ActionContext.getContext().getValueStack().set("AllStudents", students);
		ActionContext.getContext().getValueStack().set("groupstudents", hasGroupStudents);
		return "refresh";
	}
	

	public String getCheckBox()
	{
		this.request = ServletActionContext.getRequest();
		Integer groupId = Integer.parseInt(this.request.getParameter("groupId"));
		String test = this.request.getParameter("num");
		System.out.println(test);
		//处理空
		String[] chkValues = this.getCheckName().split(", "); 
		Group group2 = groupService.findById(groupId);
		int num = group2.getPersonNum() + chkValues.length;
		group2.setPersonNum(num);
		group2.setPhoneNum(this.getPhone());
		groupService.updateGroup(group2);
		for(int i=0;i<chkValues.length;i++)
		{
			Integer studentId = Integer.valueOf(chkValues[i]);
			courseService.insertStuGroup(studentId, groupId);
		}
		
		 return "get";
	}
	public String selectAllCourse(){
		List<Course> list = courseService.selectAllCourse();
		return "selectSuccess";
	}
	
	
	
}
