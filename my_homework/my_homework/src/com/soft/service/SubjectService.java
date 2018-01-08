package com.soft.service;

import com.soft.dao.SubjectDao;
import com.soft.domain.Subject;

public class SubjectService {
	SubjectDao subjectDao;

	public SubjectDao getSubjectDao() {
		return subjectDao;
	}

	public void setSubjectDao(SubjectDao subjectDao) {
		this.subjectDao = subjectDao;
	}

	public Subject findById(Integer subjectId) {
		// TODO Auto-generated method stub
		Subject subject = subjectDao.findById(subjectId);
		return subject;
	}
	
}
