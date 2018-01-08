package com.soft.dao;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.soft.domain.Product;

public class ProductDao extends HibernateDaoSupport{
	public void save(Product product)
	{
		System.out.println("dao层被执行了");
	}

}
