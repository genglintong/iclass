package com.soft.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.catalina.tribes.util.Logs;

import com.soft.dao.SubjectDao;
import com.soft.dao.TeacherDao;
import com.soft.domain.*;

public class TeacherService {
	private TeacherDao teacherDao = null;
	private SubjectDao subjectDao;
	
	public SubjectDao getSubjectDao() {
		return subjectDao;
	}

	public void setSubjectDao(SubjectDao subjectDao) {
		this.subjectDao = subjectDao;
	}

	public TeacherDao getTeacherDao() {
		return teacherDao;
	}

	public void setTeacherDao(TeacherDao teacherDao) {
		this.teacherDao = teacherDao;
	}

	/**
	 * 登录
	 * @param teacher
	 * @return
	 */
	public Teacher loginService(Teacher teacher) {
		return teacherDao.findTeacherByNameAndPwd(teacher);	
	}

	public void setSubject(Subject subject) {
		teacherDao.setSubject(subject);
		
	}

	public void updateUserInfo(Teacher teacherFromSession) {
		teacherDao.updateUserInfo(teacherFromSession);
		
	}
	
	public Group findGroupById(int id){
		return teacherDao.findGroupById(id);
	}
	
	public Subject findSubjectById(int id){
		return teacherDao.findSubjectById(id);
	}

	public List<HomeworkInfo> findHomework(Course course,String subjectTitle, Date commitDate, String groupAccount) {
		List<HomeworkInfo> list = new ArrayList<HomeworkInfo>();
		List<Homework> homeworkList = teacherDao.findHomework(course, subjectTitle,commitDate,groupAccount);
		for (Homework homework : homeworkList) {
			HomeworkInfo homeworkInfo = new HomeworkInfo();
			homeworkInfo.setHomework(homework);
			Group group = this.findGroupById(homework.getGroupId());
			homeworkInfo.setAuthorName(group.getGroupName());//设置上传小组名字
			Subject subject = this.findSubjectById(homework.getSubjectId());
			homeworkInfo.setSubject(subject.getSubjectTitle());//设置作业名字
			list.add(homeworkInfo);
			
			System.out.println("作业信息是：" + homeworkInfo.getSubject());
		}
		
		return list;
	}

	
	
	/*******************************************************/
	public List<Homework> findAllHomeWorkByCourseStu(Course course, Student student){
		List<StudentGroup> studentGroupList = teacherDao.findAllStudentGroup(student);
		List<Group> groupList = teacherDao.findAllGroupBygroupStu(course, studentGroupList);
		List<Homework> homeworkList = teacherDao.findAllHomeworkByGrup(groupList);
		return homeworkList;
	}
	
	public List<logs> findAllLogsByStudentAndCourse(Course course, Student student){
		return teacherDao.findAllLogs(course,student);
	}
	public Double getHomeworkscores(List<Homework> homeworkList) {
		// TODO Auto-generated method stub
		Double sum = 0.0;
		System.out.println("获取成绩");
		if(homeworkList.size()>0)
		{
			for(int i=0;i<homeworkList.size();i++)
			{
				Double currscore = homeworkList.get(i).getScore();
				Integer subjectId = homeworkList.get(i).getSubjectId();
				System.out.println(subjectId);
				Subject subject = subjectDao.findById(subjectId);
				System.out.println(subject.getQuanzhong());
				sum = sum + subject.getQuanzhong() * currscore / 100.0;
			}
		}
		return sum;
		
	}
	/**
	 * 查询所有学生，用于展示老师的所有学生信息
	 * @param AllScorePublic
	 * @param course
	 * @param teacher
	 * @param groupAccount
	 * @return
	 */
	public List<studentWithScore> findStudent(int AllScorePublic,Course course, Teacher teacher,String groupAccount) {
		System.out.println(AllScorePublic);
		List<Student> studentList = teacherDao.findStudent(course,teacher,groupAccount);
		
		List<studentWithScore> studentWithScoreList = new ArrayList<studentWithScore>();
		
		for (Student student : studentList) {
			Double logsAccount = 0.0;
			/*List<StudentGroup> studentGroupList = teacherDao.findAllStudentGroup(student);
			List<Group> groupList = teacherDao.findAllGroupBygroupStu(course, studentGroupList);
			List<Homework> homeworkList = teacherDao.findAllHomeworkByGrup(groupList);*/
			List<Homework> homeworkList = findAllHomeWorkByCourseStu(course,student);
			studentWithScore studentWithScore = new studentWithScore();
			//计算作业成绩
			studentWithScore.setStudent(student);
			studentWithScore.setHomeWorkScore(this.getHomeworkscores(homeworkList));
			
			studentWithScore.setHomeworkList(homeworkList);
			List<logs> logsList = findAllLogsByStudentAndCourse(course,student);
			
			//计算点名成绩
			for (logs logs : logsList) {
				if(logs.getIsComing() == 0){
					logsAccount = logsAccount + course.getOnCallScore();
				}
			}
			studentWithScore.setLogsList(logsList);
			studentWithScore.setCallScore(logsAccount);
			studentWithScore.setAllScore(studentWithScore.getHomeWorkScore()-logsAccount);
			studentWithScoreList.add(studentWithScore);
		}
		
		return studentWithScoreList;
		 
	}
	
	public List<Homework> getHKByStudentId(int studentId){
		
		return null;
	}
	
	public List<Homework> getCallByStudentId(int studentId){
		
		return null;
	}
	

	public List<Group> findAllGroup(Course course, Teacher teacher) {
		return teacherDao.findAllGroup(course,teacher);
	}

	public List<Subject> findAllSubject(Teacher teacherFromSession,Course course) {
		return teacherDao.findAllSubject(teacherFromSession,course);
	}

	public List<Student> findAllStudent(Course course, Teacher teacher) {
		
		return teacherDao.findAllStudent(course,teacher);
	}

	public void setCallLogs(String studentIdStr, String isComingstr,Course course,String callNumberStr) {
		int studentId = Integer.parseInt(studentIdStr);
		int callNumber = Integer.parseInt(callNumberStr);
		int isComing = 0;
		if(isComingstr.equals("yes")){
			isComing = 1;
		}
		if(isComingstr.equals("no")){
			isComing = 0;
		}
		logs log = new logs();
		log.setCallNumber(callNumber);
		log.setCourseId(course.getCourseId());
		log.setIsComing(isComing);
		log.setStudentId(studentId);
		Date creatDate = new Date();
		log.setCreatDate(creatDate);
		teacherDao.setCallLogs(log);
		
	}

	public List<GroupAssit> setAssit1(Teacher teacher, Course course) {
		List<Group> groupList = teacherDao.findAllGroupByCourse(course);
		List<Assit> assitList = teacherDao.findAllAssit(course);
		
		List<GroupAssit> groupAssitList = new ArrayList<GroupAssit>();
		
		for (Group group : groupList) {
			GroupAssit groupAssit = new GroupAssit();
			groupAssit.setGroup(group);
			groupAssit.setAssitList(assitList);
			groupAssitList.add(groupAssit);
		}
		for (GroupAssit groupAssit : groupAssitList) {
			System.out.println(groupAssit);
		}
		
		return groupAssitList;
	}

	/**
	 * 设置助教2
	 * @param teacher
	 * @param course
	 * @return
	 */
	public List<AssitGroup> setAssit2(Teacher teacher, Course course) {
		List<Group> groupList = teacherDao.findAllGroupByCourse(course);
		List<Assit> assitList = teacherDao.findAllAssit(course);
		
		List<AssitGroup> assitGroupList = new ArrayList<AssitGroup>();
		for (Assit assit : assitList) {
			AssitGroup assitGroup = new AssitGroup();
			assitGroup.setAssit(assit);
			assitGroup.setGroupList(groupList);
			assitGroupList.add(assitGroup);
		}
		for (AssitGroup assitGroup : assitGroupList) {
			System.out.println(assitGroup);
		}
		return assitGroupList;
	}

	public List<Course> getAllCourse(Teacher teacherFromSession) {
		return teacherDao.getAllCourse(teacherFromSession);
	}

	public Course getCourseByName(String courseIdStr) {
		int courseId = Integer.parseInt(courseIdStr);
		System.out.println("课程id是："+courseId);
		return teacherDao.getCourseByName(courseId);
	}

	public void updaCourse(Course course) {
		teacherDao.updateCourse(course);
		
	}

	public List<Teacher> findteachers(List<Course> courses) {
		// TODO Auto-generated method stub
		List<Teacher> teachers =  new ArrayList<Teacher>();
		for(int i=0 ;i< courses.size();i++)
		{
			Integer tid = courses.get(i).getTeacherId();
			Teacher teacher= teacherDao.findById(tid);
			teachers.add(teacher);
		}
		return teachers;
	}

	public void setAssist2Impl(String groupId, String assitId) {
		teacherDao.setAssist2Impl(groupId,assitId);
		
	}
	
	public void setAssist1Impl(String groupId, String assitId) {
		teacherDao.setAssist2Impl(groupId,assitId);
		
	}
	
	
}
