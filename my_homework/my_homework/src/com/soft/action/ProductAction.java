package com.soft.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.soft.domain.Product;
import com.soft.service.ProductService;

public class ProductAction extends ActionSupport implements ModelDriven<Product>{
	
	private Product product = new Product();
	
	@Override
	public Product getModel() {
		// TODO Auto-generated method stub
		return this.product;
	}
	
	
	private ProductService productService;

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	
	public String save()
	{
		System.out.println("action 被执行了");
		productService.save(product);
		return NONE;
	}

	
	 

}
