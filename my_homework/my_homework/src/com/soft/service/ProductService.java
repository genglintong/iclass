package com.soft.service;

import com.soft.dao.ProductDao;
import com.soft.domain.Product;

public class ProductService { 
	private ProductDao productDao;

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}
	
	public void save(Product product)
	{
		System.out.println("service 被执行了");
		productDao.save(product);
	}
	
 
}
