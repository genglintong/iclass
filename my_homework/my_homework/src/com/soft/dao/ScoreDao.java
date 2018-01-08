package com.soft.dao;


import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.soft.domain.score;

public class ScoreDao extends HibernateDaoSupport{

	public double getScore(Integer courseId, Integer studentId) {
		// TODO Auto-generated method stub
		String hql = "from score where studentId=? and courseId=?";
		List<score> scoreList = this.getHibernateTemplate().find(hql,studentId,courseId);
		if(scoreList.size() == 0) {
			return -1;
		}
		else {
			System.out.println(scoreList.get(0).getCourseId());
			return scoreList.get(0).getScore();
		}
		
	}
	

}
