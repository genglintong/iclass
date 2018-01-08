package com.soft.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import java.io.File;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.soft.Util.upLoad;
import com.soft.Util.getPath;
public class upload extends ActionSupport { 
	private String usename ;  
    private List<File> file1 ;  
    private List<String> file1FileName ;  
    private List<String> file1ContentType ;  
    private String filePath;
    
    public String getFilepath() {
		return filePath;
	}
	public void setFilepath(String filepath) {
		this.filePath = filepath;
	}
	public String getUsename() {  
        return usename;  
    }  
    public void setUsename(String usename) {  
        this.usename = usename;  
    }  
    public List<File> getFile1() {  
        return file1;  
    }  
    public void setFile1(List<File> file1) {  
        this.file1 = file1;  
    }  
    public List<String> getFile1FileName() {  
        return file1FileName;  
    }  
    public void setFile1FileName(List<String> file1FileName) {  
        this.file1FileName = file1FileName;  
    }  
    public List<String> getFile1ContentType() {  
        return file1ContentType;  
    }  
    public void setFile1ContentType(List<String> file1ContentType) {  
        this.file1ContentType = file1ContentType;  
    }  
      
    @Override  
    public String execute() throws Exception {  
    	System.out.println("test");
    	for(int i=0;i<file1.size();i++)
    	{
    		filePath = upLoad.upload(file1.get(i),"txt",file1FileName.get(i));
    	}
		//System.out.println("文件类型："+getPath.getFileType(filePath));
		System.out.println(filePath);
		return "success";  
    }  
}
