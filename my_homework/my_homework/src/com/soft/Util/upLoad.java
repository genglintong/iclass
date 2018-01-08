package com.soft.Util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;

import org.apache.struts2.ServletActionContext;

/**
 * 
 * Project Name:my_homework 
 * File Name:upLoad.java 
 * Package Name:com.soft.Util 
 * Author: genglintong
 * Date:2017年12月22日下午2:05:55  
 * Desc:上传图片文件共有方法
 * 
 */
public class upLoad {
	 private static final int BUFFER_SIZE = 16 * 1024;  
	 private static void copy(File src, File dst) {  
	      try {  
	    	  		InputStream in = null;  
	    	  		OutputStream out = null;  
	    	  		try {  
	    	  			in = new BufferedInputStream(new FileInputStream(src),  
	    	  					BUFFER_SIZE);  
	    	  			out = new BufferedOutputStream(new FileOutputStream(dst),  
	    	  					BUFFER_SIZE);  
	    	  			byte[] buffer = new byte[BUFFER_SIZE];  
	    	  			while (in.read(buffer) > 0) {  
	    	  				out.write(buffer);  
	    	  			}  
	    	  		} finally {  
	               if (null != in) {  
	                 in.close();  
	               }  
	                if (null != out) {  
	                    out.close();  
	                }  
	           }  
	       } catch (Exception e) {  
          e.printStackTrace();  
          
	       }  
	    }  

  /*private static String getExtention(String fileName , String type) { 
	  if (type != "") {
		  type = "." + type;
		  return type;
	  }
	  int pos = fileName.lastIndexOf(".");  
	  return fileName.substring(pos);  
  }*/  
  
  
  public static String upload( File src ,String name,String path) {  
          if (src  == null)  
              return ""; 
          
          //System.out.println(name);
          
          //String tempName = new Date().getTime() +  getExtention( name ,type);
          String tempName = name;
          //System.out.println(getExtention( name ,type));
          if (path != "") {
			path = "/" + path;
          }
          String filePath = ServletActionContext.getServletContext()  //得到文件保存的位置(根据root来得到图片保存的路径在tomcat下的该工程里)     
                  .getRealPath("UploadImages")     
                  + path;
          
          //创建文件夹
          File fileDir = new File(filePath);   
          if (!fileDir.exists()) {
			 fileDir.mkdirs();
		  }
          
          File file  = new File(filePath + "/" + tempName);
          
          System.out.println(file.getAbsolutePath() );
          
          copy( src , file);  //把图片写入到上面设置的路径里  
          
          //2014.9.2 返回文件名
 
         // return  imageFile.getAbsolutePath() ;  
          
          //修改客户端显示图片bug 使用相对地址  直接返回文件名 mysql存储的文件名   
          return tempName ;
      }
}

