package com.soft.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.util.ValueStack;
import com.soft.Util.ExcelReader;
import com.soft.Util.iclassUtil;
import com.soft.domain.*;
import com.soft.service.CourseService;
import com.soft.service.HomeworkService;
import com.soft.service.StudentService;
import com.soft.service.TeacherService;

public class TeacherAction  extends ActionSupport implements ModelDriven<Teacher>{
	
	int AllScorePublic = 10;//一次作业十分；
	
	private TeacherService teacherService = null;
	private Teacher teacher = new Teacher();
	private Subject subject = null;
	
	private String callNumber = null;
	private String chooseCourse;
	
	
	
	private Integer allCallNumber;//本门课程的点名次数
	private Integer onCallScore;//一次点名 的得分
	private StudentService studentService = null;
	private CourseService courseService = null;
	private HttpServletRequest request ;
	//学生名单文件
	private File studentList;
	private String studentListFileName;
	private HomeworkService homeworkService;
	
 	public String getChooseCourse() {
		return chooseCourse;
	}

	public void setChooseCourse(String chooseCourse) {
		this.chooseCourse = chooseCourse;
	}

	public HomeworkService getHomeworkService() {
		return homeworkService;
	}

	public void setHomeworkService(HomeworkService homeworkService) {
		this.homeworkService = homeworkService;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public String getStudentListFileName() {
		return studentListFileName;
	}

	public void setStudentListFileName(String studentListFileName) {
		this.studentListFileName = studentListFileName;
	
	}
	public Integer getAllCallNumber() {
		return allCallNumber;
	}

	public void setAllCallNumber(Integer allCallNumber) {
		this.allCallNumber = allCallNumber;
	}

	public Integer getOnCallScore() {
		return onCallScore;
	}

	public void setOnCallScore(Integer onCallScore) {
		this.onCallScore = onCallScore;
	}

	

	public String getCallNumber() {
		return callNumber;
	}

	public void setCallNumber(String callNumber) {
		this.callNumber = callNumber;
	}


	/***************************************/
	private String subjectTitle = null;
	private Date commitDate = null;
	private String groupAccount = null;
	
	public String getSubjectTitle() {
		return subjectTitle;
	}

	public void setSubjectTitle(String subjectTitle) {
		this.subjectTitle = subjectTitle;
	}

	public Date getCommitDate() {
		return commitDate;
	}

	public void setCommitDate(Date commitDate) {
		this.commitDate = commitDate;
	}

	public String getGroupAccount() {
		return groupAccount;
	}

	public void setGroupAccount(String groupAccount) {
		this.groupAccount = groupAccount;
	}

	/***************************************/
	
	
	
	public Subject getSubject() {
		return subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}

	public TeacherService getTeacherService() {
		return teacherService;
	}

	public void setTeacherService(TeacherService teacherService) {
		this.teacherService = teacherService;
	}

	public Teacher getModel() {
		return teacher;
	}
	
	public Teacher getTeacherFromSession(){
		ActionContext actionContext = ActionContext.getContext();
		Map<String, Object> sessionAttribute = actionContext.getSession();
		Teacher teacherSession = (Teacher) sessionAttribute.get("teacher");
		System.out.println("session中取出的老师对象"+ teacherSession);
		return teacherSession;
	}
	
	public Course getCourseFromSession(){
		ActionContext actionContext = ActionContext.getContext();
		Map<String, Object> sessionAttribute = actionContext.getSession();
		Course courseSession = (Course) sessionAttribute.get("course");
		System.out.println("session中取出的课程对象"+ courseSession);
		return courseSession;
	}
	
	/**
	 * 登录
	 * @return
	 */
	public String login(){
		Teacher teachers = teacherService.loginService(teacher);
		if(teachers != null){
			//把老师对象放在session域中去,表示老师已经登录
			ActionContext actionContext = ActionContext.getContext();
			Map<String, Object> sessionAttribute = actionContext.getSession();
			List<Course> courseList = teacherService.getAllCourse(teachers);
			ActionContext.getContext().getSession().put("course", courseList.get(0));
			System.out.println("session中的老师对象"+ teachers);
			sessionAttribute.put("teacher", teachers);
			return "loginSuccess";
		}
		return "loginError";
	}
	
	/**
	 * 修改个人资料
	 */
	public String updateUserInfo(){
		Teacher teacherFromSession = this.getTeacherFromSession();
		teacher.setTeacherId(teacherFromSession.getTeacherId());
		teacherService.updateUserInfo(teacher);
		return "updateSuccess";
		
	}
	
	/**
	 * 获取课程列表
	 */
	public String getAllCourse(){
		Teacher teacherFromSession = this.getTeacherFromSession();
		List<Course> courseList = teacherService.getAllCourse(teacherFromSession);
		ActionContext.getContext().getValueStack().push(courseList);;
		return "getAllCourseSuccess";
		
	}
	
	/**
	 * 选择课程
	 */
	public String chooseCourse(){
		
		String courseName = ServletActionContext.getRequest().getParameter("courseName");
		System.out.println("课程id："+ courseName);
		Course course = teacherService.getCourseByName(courseName);
		
		ActionContext actionContext = ActionContext.getContext();
		Map<String, Object> sessionAttribute = actionContext.getSession();
		
		sessionAttribute.put("course", course);
		
		System.out.println("session中取出的课程对象"+sessionAttribute.get("course"));
		return "chooseCourseSuccess";
		
	}
	
	/**
	 * 老师布置作业
	 * @return
	 */
	public String setSubject(){
		Course course = this.getCourseFromSession();
		subject.setCourseId(course.getCourseId());
		this.request = ServletActionContext.getRequest();
		Integer rate_grade = Integer.parseInt(this.request.getParameter("rate_grade"));
		subject.setQuanzhong(rate_grade);
		teacherService.setSubject(subject);
		return "setSubjectSuccess";
	}
	
	public String findAllSubject(){
		Teacher teacherFromSession = this.getTeacherFromSession();
		Course course = this.getCourseFromSession();
		/**
		 * 注意，此处打桩已经取消
		 */
		
		List<Subject> list = teacherService.findAllSubject(teacherFromSession, course);
		ValueStack stack = ActionContext.getContext().getValueStack();
		stack.set("subjectList",list);
		
		return "findSubjectSuccess";
	}
	
	
	

	/**
	 * 查找所有作业
	 * @return
	 */
	public String findHomework(){
		Teacher teacher = this.getTeacherFromSession();
		Course course = this.getCourseFromSession();
		List<HomeworkInfo> homeworkList = teacherService.findHomework(course,subjectTitle,commitDate,groupAccount);
		ValueStack stack = ActionContext.getContext().getValueStack();
		stack.set("homeworkList",homeworkList);
		/*System.out.println(ServletActionContext.getRequest().getScheme());
		System.out.println(ServletActionContext.getRequest().getServerName());
		System.out.println(ServletActionContext.getRequest().getServerPort());
		System.out.println(ServletActionContext.getRequest().getContextPath());*/
		String path = ServletActionContext.getRequest().getScheme() + "://" 
					+ ServletActionContext.getRequest().getServerName() + ":" 
					+ ServletActionContext.getRequest().getServerPort() 
					+ ServletActionContext.getRequest().getContextPath()+"/";
		
		for (int i = 0; i < homeworkList.size(); i++) {
			String address = homeworkList.get(i).getHomework().getAddress();
			System.out.println("2222"+address);
			String[] aStrings = iclassUtil.getFileName(address);
			if (aStrings != null) {
				address = path + "UploadImages/" +address + "/" + aStrings[0];
				homeworkList.get(i).setFileName(aStrings[0]);
			}else {
				address = null;
			}
			System.out.println("2222"+address);
			homeworkList.get(i).setAddress(address);
		}
		
		ActionContext actionContext = ActionContext.getContext();
		Map<String, Object> sessionAttribute = actionContext.getSession();
		sessionAttribute.put("homeworkList", homeworkList);
		
		return "findHkSuccess";
		
	}
	
	
	
	
	public String getCallScoreInfo(){
		String str = ServletActionContext.getRequest().getParameter("studentId");
		System.out.println("学生id"+str);
		int studentId = Integer.parseInt(str);
		ActionContext actionContext = ActionContext.getContext();
		Map<String, Object> sessionAttribute = actionContext.getSession();
		List<studentWithScore> list = (List<studentWithScore>) sessionAttribute.get("studentList");
		
		System.out.println("取出的学生list"+list);
		for (studentWithScore studentWithScore : list) {
			if(studentWithScore.getStudent().getStudentId() == studentId){
				ValueStack stack = ActionContext.getContext().getValueStack();
				stack.set("studentLogsList",studentWithScore.getLogsList());
			}
		}
		
		return "getCallScoreInfoSuccess";
	}
	
	public String getHKScoreInfo(){
		String str = ServletActionContext.getRequest().getParameter("studentId");
		System.out.println(str);
		int studentId = Integer.parseInt(str);
		ActionContext actionContext = ActionContext.getContext();
		Map<String, Object> sessionAttribute = actionContext.getSession();
		List<studentWithScore> list = (List<studentWithScore>) sessionAttribute.get("studentList");
		
		System.out.println("取出的学生list"+list);
		
		for (studentWithScore studentWithScore : list) {
			if(studentWithScore.getStudent().getStudentId() == studentId){
				ValueStack stack = ActionContext.getContext().getValueStack();
				stack.set("studentHKsList",studentWithScore.getHomeworkList());
			}
		}
		
		return "getHKScoreInfoSuccess";
	}
	
	
/*	public List<studentWithScore> getstudentWithScoreInfo(List<studentWithScore> list){
		return list;
	}
*/	
	/**
	 * 查找老师的所有学生
	 * @return
	 */
	public String findStudent(){
		Teacher teacher = this.getTeacherFromSession();
		System.out.println(teacher);
		Course course = this.getCourseFromSession();
		List<studentWithScore> list = teacherService.findStudent(AllScorePublic,course,teacher,groupAccount);
		ValueStack stack = ActionContext.getContext().getValueStack();
		//计算学生成绩
		stack.set("studentList",list);
		
		ActionContext actionContext = ActionContext.getContext();
		Map<String, Object> sessionAttribute = actionContext.getSession();
		System.out.println("session中的学生队列对象"+ list);
		sessionAttribute.put("studentList", list);
		return "findStuSuccess";
		
	}
	
	
	
	/**
	 * 导出成绩
	 * @return
	 */
	public String downLoadExcel(){
		String path = ServletActionContext.getRequest().getScheme() + "://" 
				+ ServletActionContext.getRequest().getServerName() + ":" 
				+ ServletActionContext.getRequest().getServerPort() 
				+ ServletActionContext.getRequest().getContextPath()+"/";
		Teacher teacher = this.getTeacherFromSession();
		System.out.println(teacher);
		Course course = this.getCourseFromSession();
		List<studentWithScore> list = teacherService.findStudent(AllScorePublic,course,teacher,groupAccount);
		String excelPath = iclassUtil.creatExcel(list,"score");
		excelPath = path + "UploadImages/" + "score.xls";
		ActionContext.getContext().getSession().put("path", excelPath);
		System.out.println("下载路径"+excelPath);
		return "downLoadSuccess";
	}
	
	/**
	 * 导出作业
	 */
	public String downLoadHKExcel(){
		Teacher teacher = this.getTeacherFromSession();
		System.out.println(teacher);
		Course course = this.getCourseFromSession();
		
		ActionContext actionContext = ActionContext.getContext();
		Map<String, Object> sessionAttribute = actionContext.getSession();
		List<HomeworkInfo> homeworkList = (List<HomeworkInfo>) sessionAttribute.get("homeworkList");
		List<String[]> pathList = new ArrayList<String[]>();
		
		for (HomeworkInfo homeworkInfo : homeworkList) {
			System.out.println(homeworkInfo.getHomework().getAddress());
			String[] str = iclassUtil.getFileName(homeworkInfo.getHomework().getAddress());
			pathList.add(str);
		}
		//pathList，就是当前页面所有作业文件的路径的list<String[]>的集合
		
		return "downLoadHKExcelSuccess";
	}
	
	
	
	
	
	/**
	 * 查询当前老师的所有小组
	 */
	public String findAllGroup(){
		Teacher teacher = this.getTeacherFromSession();
		Course course = this.getCourseFromSession();
		List<Group> list = teacherService.findAllGroup(course,teacher);
		return "findGroupSucccess";
		
	}
	
	
	/**
	 * 设置助教前，先获取所有的小组和助教列表
	 */
	public String setAssit1(){
		Teacher teacher = this.getTeacherFromSession();
		Course course = this.getCourseFromSession();
		/**
		 * 打桩已解决
		 */
		List<GroupAssit> groupAssitList = teacherService.setAssit1(teacher, course);
		ValueStack stack = ActionContext.getContext().getValueStack();
		stack.set("groupAssitList",groupAssitList);
		return "setAssit1Succcess";
	}
	
	/**
	 * 设置助教前，先获取所有的助教和小组列表
	 */
	public String setAssit2(){
		Teacher teacher = this.getTeacherFromSession();
		Course course = this.getCourseFromSession();
		/**
		 * 打桩已解决
		 */
		List<AssitGroup> assitGroupList = teacherService.setAssit2(teacher, course);
		ValueStack stack = ActionContext.getContext().getValueStack();
		stack.set("assitGroupList",assitGroupList);
		
		for (AssitGroup assitGroup : assitGroupList) {
			Assit assit = assitGroup.getAssit();
				System.out.println(assit);
		}
		return "setAssit2Succcess";
	}
	
	/**
	 * 为助教设置小组
	 * @return
	 */
	public String setAssistImpl2(){
		String id = ServletActionContext.getRequest().getParameter("id");
		String assitId = ServletActionContext.getRequest().getParameter("groupId");
		System.out.println(id);//小组id
		System.out.println(assitId);//助教id
		teacherService.setAssist2Impl(id,assitId);
		return "setAssistImpl2Success";
		
		
	}
	
	
	/**
	 * 为小组设置助教
	 * @return
	 */
	public String setAssistImpl1(){
		String id = ServletActionContext.getRequest().getParameter("id");
		String assitId = ServletActionContext.getRequest().getParameter("groupId");
		System.out.println(id);//助教id
		System.out.println(assitId);//小组id
		teacherService.setAssist2Impl(assitId,id);
		return "setAssistImpl2Success";
		
		
	}
	
	
	
	
	/**
	 * 查找老师的所有学生,用于点名签到
	 * @param teacher
	 * @param groupAccount
	 * @return
	 */
	public String findAllStudent(){
		Teacher teacher = this.getTeacherFromSession();
		System.out.println(teacher);
		Course course = this.getCourseFromSession();
		List<Student> list = teacherService.findAllStudent(course,teacher);
		for (Student student : list) {
			System.out.println(student);
		}
		ValueStack stack = ActionContext.getContext().getValueStack();
		stack.set("studentList",list);
		return "findAllStuSuccess";
		
	}
	
	
	/**
	 * 设置当前点名第几次
	 */
	
	public String setCallNumber(){
		
		System.out.println(callNumber);
		ActionContext actionContext = ActionContext.getContext();
		Map<String, Object> sessionAttribute = actionContext.getSession();
		sessionAttribute.put("callNumber", callNumber);
		Object o = (String)sessionAttribute.get("callNumber");
		
		System.out.println("session 中的当前点名次数是：" + o + "次");
		return "setCallNumberSuccess";
		
	}
	
	
	/**
	 * 点名签到
	 */
	public String callStudent(){
		
		Course course = this.getCourseFromSession();
		System.out.println("session中取出的课程对象是："+course);
//		Teacher teacher = this.getTeacherFromSession();
		String studentId = ServletActionContext.getRequest().getParameter("account");
		String isComing = ServletActionContext.getRequest().getParameter("isComing");
		/*System.out.println(account);
		System.out.println(isComing);*/
		
		ActionContext actionContext = ActionContext.getContext();
		Map<String, Object> sessionAttribute = actionContext.getSession();
		String o = (String)sessionAttribute.get("callNumber");
		System.out.println("session中取出的点名次数对象"+ o);
		
		
		teacherService.setCallLogs(studentId,isComing,course,o);
		return "callSuccess";
		
	}
	
	
	/**
	 * 
	 */
	public String setCallParmater(){
		Course course = this.getCourseFromSession();
		System.out.println(allCallNumber);
		System.out.println(onCallScore);
		course.setAllCallNumber(allCallNumber);
		course.setOnCallScore(onCallScore);
		teacherService.updaCourse(course);
		return "setCallParmaterSuccess";
	}

	/**
	 * Author: genglintong
	 * Date:2017年12月31日下午3:35:15
	 * Desc:导入学生名单并且解析
	 */
	public String importStudentList() {
		System.out.println("获得Excel表格的内容:");
		try {
			ExcelReader excelReader = new ExcelReader(studentListFileName);
			InputStream studentListInputStream = new FileInputStream(studentList);
			Map<Integer, String> map = excelReader.readExcelContent(studentListInputStream);
			System.out.println("获得Excel表格的内容:"); 
            for (int i=1; i<=map.size(); i++) {   
                System.out.println(map.get(i));   
            }
            studentService.importStudentList(map);
		} catch (FileNotFoundException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			System.out.println("dfgdfhdfghfd");
		}
		System.out.println("dfgdfhdfghfd");
		return "success1";
	}

	/**
	 * Author: genglintong
	 * Date:2017年12月31日下午6:24:16
	 * Desc:设置小组配置
	 */
	public String groupConfig() {
		//ActionContext actionContext = ActionContext.getContext();
		//Map<String, Object> sessionAttribute = actionContext.getSession();
		//Teacher teachers = (Teacher)sessionAttribute.get("teacher");
		
		//int teacherId = teachers.getTeacherId();
		this.request = ServletActionContext.getRequest();
		Integer max = Integer.parseInt(this.request.getParameter("max"));
		Integer min = Integer.parseInt(this.request.getParameter("min"));
		String class_code = this.request.getParameter("class_code");
		Teacher teacher = (Teacher)ActionContext.getContext().getSession().get("teacher");
		Course course = (Course)ActionContext.getContext().getSession().get("course");
		courseService.groupConfig(course.getCourseId(), teacher.getTeacherId(), max, min, "2018"+class_code);
		
		return "success";
	}
	
	public File getStudentList() {
		return studentList;
	}

	public void setStudentList(File studentList) {
		this.studentList = studentList;
	}

	public StudentService getStudentService() {
		return studentService;
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	public CourseService getCourseService() {
		return courseService;
	}

	public void setCourseService(CourseService courseService) {
		this.courseService = courseService;
	}
	
	public void SetHomeworkScore()
	{
		this.request = ServletActionContext.getRequest();
		Integer homeworkId = Integer.parseInt(this.request.getParameter("homeworkId"));
		System.out.println("homeworkId"+homeworkId);
		Double score = Double.parseDouble(this.request.getParameter("score"));
		homeworkService.setScore(homeworkId,score);
		//return "setHomeworkScoreSuccess";
	}
	public String setCurrentCourse()
	{
		Integer courseId = Integer.parseInt(this.chooseCourse);
		Course course = courseService.finfById(courseId);
		ActionContext.getContext().getSession().put("course", course);
		return "setCourse";
	}
	public String teacherlogout()
	{
		ActionContext.getContext().getSession().remove("teacher");
		ActionContext.getContext().getSession().remove("course");
		return "teacherlogout";
	}
	
}
