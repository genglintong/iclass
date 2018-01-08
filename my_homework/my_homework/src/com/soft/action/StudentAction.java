package com.soft.action;

import static org.hamcrest.CoreMatchers.nullValue;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.management.remote.SubjectDelegationPermission;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ActionMappingParametersInteceptor;
import org.apache.tomcat.jni.Stdlib;
import org.aspectj.org.eclipse.jdt.core.dom.ThisExpression;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.soft.Util.upLoad;
import com.soft.dao.SubjectDao;
import com.soft.domain.Course;
import com.soft.domain.CourseSubject;
import com.soft.domain.CourseTeacher;
import com.soft.domain.Group;
import com.soft.domain.Homework;
import com.soft.domain.Student;
import com.soft.domain.StudentGroup;
import com.soft.domain.Subject;
import com.soft.domain.Teacher;
import com.soft.service.CourseService;
import com.soft.service.GroupService;
import com.soft.service.HomeworkService;
import com.soft.service.StudentService;
import com.soft.service.SubjectService;
import com.soft.service.TeacherService;

import sun.security.x509.SubjectKeyIdentifierExtension;

public class StudentAction extends ActionSupport implements ModelDriven<Student>{
	Student student = new Student();
	private String teacherName;
	private TeacherService teacherService;
	private CourseService courseService;
	private HttpServletRequest request ;
    private SubjectService subjectService;
    private GroupService groupService;
    private HomeworkService homeworkService;
    private String chooseCourse;
    private List<File> file1 ;  
    private List<String> file1FileName ;  
    private List<String> file1ContentType ;  
    private String newPassword;
public void setGroupService(GroupService groupService) {
		this.groupService = groupService;
	}


public String getNewPassword() {
		return newPassword;
	}


	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}


public String getChooseCourse() {
		return chooseCourse;
	}


	public void setChooseCourse(String chooseCourse) {
		this.chooseCourse = chooseCourse;
	}


public List<File> getFile1() {
		return file1;
	}


	public void setFile1(List<File> file1) {
		this.file1 = file1;
	}


	public List<String> getFile1FileName() {
		return file1FileName;
	}


	public void setFile1FileName(List<String> file1FileName) {
		this.file1FileName = file1FileName;
	}


	public List<String> getFile1ContentType() {
		return file1ContentType;
	}


	public void setFile1ContentType(List<String> file1ContentType) {
		this.file1ContentType = file1ContentType;
	}


public void setRequest(HttpServletRequest request) {
		this.request = request;
	}


	public void setHomeworkService(HomeworkService homeworkService) {
		this.homeworkService = homeworkService;
	}


public void setSubjectService(SubjectService subjectService) {
	this.subjectService = subjectService;
}


	public void setCourseService(CourseService courseService) {
		this.courseService = courseService;
	}


	public void setTeacherService(TeacherService teacherService) {
		this.teacherService = teacherService;
	}

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	@Override
	public Student getModel() {
		// TODO Auto-generated method stub
		return this.student;
	}
	
	StudentService studentService;
	
	public void setStudent(Student student) {
		this.student = student;
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	public String stuLogin() {
		Student existstudent = studentService.login(student);
		if(existstudent == null) {
			this.addActionError("用户名或密码错误");
			return INPUT;
		}
		else {
			ActionContext.getContext().getSession().put("existStudent", existstudent);
			List<Course> courses = studentService.getAllCourses(existstudent.getStudentId());
			ActionContext.getContext().getSession().put("currentCourse", courses.get(0));
			ActionContext.getContext().getSession().put("Login_type", "student");
			if(existstudent.getIsFirstLogin().equals(1))
			{
				return "firstSuccess";
			}
			else
			{
				List<Subject> subjectsList = studentService.getSubjectWarn(existstudent.getStudentId());
				for(int i=0;i<subjectsList.size();i++)
				{
					Integer courseId = subjectsList.get(i).getCourseId();
					String courseName = courseService.finfById(courseId).getCourseName();
					subjectsList.get(i).setSubjectDesc(courseName);
					
				}
				
				ActionContext.getContext().getSession().put("subject_course", subjectsList);
				int subjectNum = subjectsList.size();
				if (subjectNum > 0) {
					//返回前段，提示信息
					System.out.println("********"+subjectNum);
				}
				return SUCCESS;
			}
			
		}
		
	}
	
	public String stuLogout() {
		ActionContext.getContext().getSession().remove("existStudent");
		ActionContext.getContext().getSession().remove("currentCourse");
		ActionContext.getContext().getSession().remove("subject_course");
		ActionContext.getContext().getSession().remove("Login_type");
		return "stuLogout";
	}
	
	public String SearchScore() {
		Course currcourse = (Course)ActionContext.getContext().getSession().get("currentCourse");
		Integer courseId = currcourse.getCourseId();
		Student student = (Student)ActionContext.getContext().getSession().get("existStudent");
		Integer studentId = student.getStudentId();
		double score = studentService.getCourseScore(courseId,studentId);
		System.out.println(score);
		return "searchScoreSuccess";
	}
	public String SearchCourse() {
		Student student = (Student)ActionContext.getContext().getSession().get("existStudent");
		Integer studentId = student.getStudentId();
		List<Course> courses = studentService.getAllCourses(studentId);
		List<Teacher> teachers = teacherService.findteachers(courses);
		List<CourseTeacher> course_teacher= new ArrayList<CourseTeacher>();
		for(int i=0;i<courses.size();i++)
		{
			CourseTeacher temp = new CourseTeacher();
			temp.setCourse(courses.get(i));
			temp.setTeacher(teachers.get(i));
			course_teacher.add(temp);
		}
		ActionContext.getContext().getValueStack().push(course_teacher);
		return "searchCourseSuccess";
	}
	
	public String ChooseCourse() {
		Student student = (Student)ActionContext.getContext().getSession().get("existStudent");
		Integer studentId = student.getStudentId();
		List<Course> course_list = studentService.getAllCourses(studentId);
		ActionContext.getContext().getValueStack().push(course_list);
		return "listCourse";
	}
	
	public String setCurrentCourse()
	{
		System.out.println("choss");
		System.out.println(this.chooseCourse);
		Integer courseId = Integer.parseInt(this.chooseCourse);
		Course course = courseService.finfById(courseId);
		ActionContext.getContext().getSession().put("currentCourse", course);
		return "setCourse";
	}
	
	public String SearchAllSubject() {
		Student student = (Student)ActionContext.getContext().getSession().get("existStudent");
		Integer studentId = student.getStudentId();
		Course currcourse = (Course)ActionContext.getContext().getSession().get("currentCourse");
		//List<Course> courses = studentService.getAllCourses(studentId);
		List<Course> courses = new ArrayList<Course>();
		courses.add(currcourse);
		List<Subject> subjects = studentService.getSubjects(courses);
		List<CourseSubject> courseSubjects = new ArrayList<CourseSubject>();
		for(int i=0;i<courses.size();i++)
		{
			Course course = courses.get(i);
			List<Course> courses2 = new ArrayList<Course>();
			courses2.add(course);
			List<Subject> tempSubjects = studentService.getSubjects(courses2);
			if(tempSubjects!=null)
			{
				for(int j=0;j<tempSubjects.size();j++)
				{
					CourseSubject courseSubject = new CourseSubject();
					courseSubject.setCourse(course);
					courseSubject.setSubject(tempSubjects.get(j));
					courseSubject.setState(studentService.judgeHomework(studentId, tempSubjects.get(j).getSubjectId(),currcourse.getCourseId()));
					courseSubjects.add(courseSubject);
				}
			}
		}
		ActionContext.getContext().getValueStack().set("courseSubjects",courseSubjects);
		return "findAllSubjects";
	}
	
	public String SearchConditionSubject() {
		Student student = (Student)ActionContext.getContext().getSession().get("existStudent");
		Integer studentId = student.getStudentId();
		Course currcourse = (Course)ActionContext.getContext().getSession().get("currentCourse");
		//List<Course> courses = studentService.getAllCourses(studentId);
		List<Course> courses = new ArrayList<Course>();
		courses.add(currcourse);
		List<Subject> subjects = studentService.getSubjects(courses);
		this.request = ServletActionContext.getRequest();
		Integer is_submit = Integer.parseInt(this.request.getParameter("is_submit"));
		List<CourseSubject> courseSubjects = new ArrayList<CourseSubject>();
		for(int i=0;i<courses.size();i++)
		{
			Course course = courses.get(i);
			List<Course> courses2 = new ArrayList<Course>();
			courses2.add(course);
			List<Subject> tempSubjects = studentService.getSubjects(courses2);
			if(tempSubjects!=null)
			{
				for(int j=0;j<tempSubjects.size();j++)
				{
					CourseSubject courseSubject = new CourseSubject();
					courseSubject.setCourse(course);
					courseSubject.setSubject(tempSubjects.get(j));
					String state = studentService.judgeHomework(studentId, tempSubjects.get(j).getSubjectId(),currcourse.getCourseId());
					courseSubject.setState(state);
					if(is_submit == 0)
					{
						if(state.equals("是"))
						{
							courseSubjects.add(courseSubject);
						}
					}
					else if(is_submit==1)
					{
						if(state.equals("否"))
						{
							courseSubjects.add(courseSubject);
						}
					}
					else {
						courseSubjects.add(courseSubject);
					}
					
				}
			}
		}
		ActionContext.getContext().getValueStack().set("courseSubjects",courseSubjects);
		return "findConditionSubjects";
	}
	
	
	public String commitHomework()
	{
		this.request = ServletActionContext.getRequest();
		Integer subjectId = Integer.parseInt(this.request.getParameter("subjectId"));
		Student student = (Student)ActionContext.getContext().getSession().get("existStudent");
		Integer studentId = student.getStudentId();
		Subject subject = subjectService.findById(subjectId);
		ActionContext.getContext().getValueStack().push(subject);
		return "tosubmit";
	}
	public String submitHomework()
	{
		this.request = ServletActionContext.getRequest();
		Integer subjectId = Integer.parseInt(this.request.getParameter("subjectId"));
		Student student = (Student)ActionContext.getContext().getSession().get("existStudent");
		Integer studentId = student.getStudentId();
		Subject subject = subjectService.findById(subjectId);
		Integer groupId = studentService.getGroupId(subject.getCourseId(),studentId);
		if(groupId == null)
			return "error";
		Homework homework = homeworkService.findBySubIdAndGroupId(subjectId,groupId);
		if(homework == null)
		{
			homework = new Homework();
			homework.setSubjectId(subjectId);
			homework.setGroupId(groupId);
			homework.setScore(0.0);
			homework.setCommitDate(new Date());
			String dir = groupId + "_" +subjectId;
			homework.setAddress(dir);
			for(int i=0;i<file1.size();i++)
	    	{
	    		String filePath = upLoad.upload(file1.get(i), file1FileName.get(i), dir);
	    		System.out.println(filePath);
	    	}
			
		}
		else
		{
			String dir = groupId + "_" +subjectId;
			homework.setAddress(dir);
			homework.setCommitDate(new Date());
			for(int i=0;i<file1.size();i++)
	    	{
	    		String filePath = upLoad.upload(file1.get(i), file1FileName.get(i), dir);
	    		System.out.println(filePath);
	    	}
			
		}
		homeworkService.save(homework);
		return "submitSuccess";
	}
	public String ChangePassword()
	{
		Student student = (Student)ActionContext.getContext().getSession().get("existStudent");
		Integer studentId = student.getStudentId();
		studentService.changePassword(newPassword,studentId);
		return "changeSuccess";
	}
	public String showInfo()
	{
		Student student = (Student)ActionContext.getContext().getSession().get("existStudent");
		ActionContext.getContext().getValueStack().push(student);
		return "showInfo";
	}
	
	public String MyGroup()
	{
		Course currcourse = (Course)ActionContext.getContext().getSession().get("currentCourse");
		Integer courseId = currcourse.getCourseId();
		Student student = (Student)ActionContext.getContext().getSession().get("existStudent");
		Integer studentId = student.getStudentId();
		Integer groupId = studentService.getGroupId(courseId, studentId);
		if(groupId != null)
		{
			Group group = groupService.findById(groupId);
			ActionContext.getContext().getValueStack().set("group",group);
			Integer leaderId = group.getLeaderId();
			Student leader = studentService.findById(leaderId);
			ActionContext.getContext().getValueStack().set("leader",leader);
			String allname = studentService.getGroupMember(groupId);
			ActionContext.getContext().getValueStack().set("allname",allname);
			return "showGroupInfo";
		}
		else
		{
			return "error";
		}
		
	}
}
