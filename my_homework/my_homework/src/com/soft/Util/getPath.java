package com.soft.Util;

import org.apache.struts2.ServletActionContext;

/**
 * 
 * Project Name:my_homework 
 * File Name:getPath.java 
 * Package Name:com.soft.Util 
 * Author: genglintong
 * Date:2017年12月22日下午2:05:32  
 * Desc：获取文件共有路径
 */
public class getPath {

	public static String getFilePath() {
		String path = ServletActionContext.getServletContext().getRealPath("UploadImages");
		return path;
	}
	
	public static String getFileType(String fileName) {
		int pos = fileName.lastIndexOf(".");  
	    return fileName.substring(pos);
	}

}
