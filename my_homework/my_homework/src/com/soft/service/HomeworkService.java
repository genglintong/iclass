package com.soft.service;

import com.soft.dao.HomeworkDao;
import com.soft.domain.Homework;

public class HomeworkService {
	HomeworkDao homeworkDao;

	public void setHomeworkDao(HomeworkDao homeworkDao) {
		this.homeworkDao = homeworkDao;
	}

	public Homework findBySubIdAndGroupId(Integer subjectId, int groupId) {
		// TODO Auto-generated method stub
		Homework homework = homeworkDao.findBySubIdAndGroupId(subjectId,groupId);
		return homework;
	}

	public void save(Homework homework) {
		// TODO Auto-generated method stub
		homeworkDao.saveorupdate(homework);
	}


	public void setScore(Integer homeworkId, Double score) {
		// TODO Auto-generated method stub
		Homework homework = homeworkDao.findById(homeworkId);
		System.out.println("setsCORE"+homeworkId);
		homework.setScore(score);
		System.out.println(homework.getHomeworkId());
		homeworkDao.update(homework);
	}
	
}
