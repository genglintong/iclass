package com.soft.Util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.soft.domain.HomeworkInfo;
import com.soft.domain.studentWithScore;

/**
 * Project Name:my_homework 
 * File Name:iclassUtil.java 
 * Package Name:com.soft.Util 
 * Author: genglintong
 * Date:2017年12月31日下午5:49:09  
 * Desc: 共有函数
 */
public class iclassUtil {
	
	/**
	 * Author: genglintong
	 * Date:2017年12月31日下午5:53:13
	 * Desc:加密算法
	 */
	public static String MD5(String str) {
		try {
			// 生成一个MD5加密计算摘要
	        MessageDigest md = MessageDigest.getInstance("MD5");
	        // 计算md5函数
	        md.update(str.getBytes());
	        // digest()最后确定返回md5 hash值，返回值为8为字符串。因为md5 hash值是16位的hex值，实际上就是8位的字符
	        // BigInteger函数则将8位的字符串转换成16位hex值，用字符串来表示；得到字符串形式的hash值
	        return new BigInteger(1, md.digest()).toString(16);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "";
	}
	/**
	 * Author: genglintong
	 * Date:2018年1月1日下午12:29:52
	 * Desc:获取目录下所有文件名
	 */
	public static String[] getFileName(String dirName) {
		if (dirName != "") {
			dirName = "/" + dirName;
		}
		String path = getPath.getFilePath() + dirName;
		//System.out.println(path);
		File dirFile = new File(path);
		String[] strings = dirFile.list();
		
		path = path + "/";
		
		if(strings == null){
			return strings;
		}
		for (int i = 0; i < strings.length; i++) {
			//strings[i] = "http://111.230.233.124:8080/my_homework/UploadImages" + dirName + "/" + strings[i];
			strings[i] =  strings[i];
			String string = strings[i];
			
			System.out.println(string);
		}
		return strings;
	}
	
	/**
	 * Author: genglintong
	 * Date:2018年1月1日下午1:34:19
	 * Desc:获取当前日期
	 * parse:day获取距今天数日期
	 */
	public static String getTime(int day) {
		Calendar   cal   =   Calendar.getInstance();
		cal.add(Calendar.DATE,   day);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String string = df.format(cal.getTime());
		System.out.println(string);// new Date()为获取当前系统时间
		return string;
	}
	
	/**
	 * Author: genglintong
	 * Date:2018年1月1日下午3:15:08
	 * Desc:以excel形式导出学生成绩单
	 */
	public static String creatExcel(List<studentWithScore> studentWithScoreList,String name) {
		HSSFWorkbook wb = new HSSFWorkbook();
		
		HSSFSheet sheet = wb.createSheet("成绩单");
		
		HSSFRow row = sheet.createRow(0);  
        HSSFCellStyle  style = wb.createCellStyle();
          
        HSSFCell cell = row.createCell(0);         //第一个单元格  
        cell.setCellValue("姓名");                  //设定值  
        cell.setCellStyle(style);                   //内容居中  
          
        cell = row.createCell(1);                   //第二个单元格     
        cell.setCellValue("学号");  
        cell.setCellStyle(style);  
          
        cell = row.createCell(2);                   //第三个单元格    
        cell.setCellValue("成绩");  
        cell.setCellStyle(style);  
        
        for (int i = 0; i < studentWithScoreList.size(); i++) {
			row = sheet.createRow(i+1);
			row.createCell(0).setCellValue(studentWithScoreList.get(i).getStudent().getStudentName());
			row.createCell(1).setCellValue(studentWithScoreList.get(i).getStudent().getAccount());
			row.createCell(2).setCellValue(studentWithScoreList.get(i).getAllScore());
		}
        
        //写入excel
        String path = getPath.getFilePath() + "/" + name + ".xls";
        try {
			FileOutputStream fout = new FileOutputStream(path);
			wb.write(fout);
			fout.close();
			System.out.printf("导出成功");
		} catch (IOException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return path;
	}


/**
 * 导出作业
 * @param studentWithScoreList
 * @param name
 * @return
 */
public static String creatHomeworkExcel(List<HomeworkInfo> homeworkList,String name) {
	HSSFWorkbook wb = new HSSFWorkbook();
	
	HSSFSheet sheet = wb.createSheet("作业列表");
	
	HSSFRow row = sheet.createRow(0);  
    HSSFCellStyle  style = wb.createCellStyle();
      
    HSSFCell cell = row.createCell(0);         //第一个单元格  
    cell.setCellValue("学生姓名");                  //设定值  
    cell.setCellStyle(style);                   //内容居中  
      
    cell = row.createCell(1);                   //第二个单元格     
    cell.setCellValue("作业路径");  
    cell.setCellStyle(style);  
      
    cell = row.createCell(2);                   //第三个单元格    
    cell.setCellValue("作业题目");  
    cell.setCellStyle(style);  
    
    for (int i = 0; i < homeworkList.size(); i++) {
		row = sheet.createRow(i+1);
		row.createCell(0).setCellValue(homeworkList.get(i).getAuthorName());
		row.createCell(1).setCellValue(homeworkList.get(i).getHomework().getAddress());
		row.createCell(2).setCellValue(homeworkList.get(i).getSubject());
	}
    
    //写入excel
    String path = getPath.getFilePath() + "/" + name + ".xls";
    try {
		FileOutputStream fout = new FileOutputStream(path);
		wb.write(fout);
		fout.close();
		System.out.printf("导出成功");
	} catch (IOException e) {
		// TODO 自动生成的 catch 块
		e.printStackTrace();
	}
	return path;
}
}