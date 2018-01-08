package com.soft.Util;

import java.io.File;
import java.io.FileInputStream;   
import java.io.FileNotFoundException;   
import java.io.IOException;   
import java.io.InputStream;   
import java.text.DecimalFormat;
import java.util.Date;   
import java.util.HashMap;   
import java.util.Map;   

import org.apache.poi.hssf.usermodel.HSSFCell;     
import org.apache.poi.hssf.usermodel.HSSFWorkbook;   
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 * 
 * Project Name:my_homework 
 * File Name:ExcelReader.java 
 * Package Name:com.soft.Util 
 * Author: genglintong
 * Date:2017年12月30日下午4:40:01  
 * Desc：excel文件读取公共类
 */
public class ExcelReader {
	private POIFSFileSystem fs;
	private OPCPackage opc;
	private  Workbook wb;
	private Sheet sheet;   
    private Row row;
    private boolean isExcel2003 = true;
    
    /**
     * 构造函数   动态兼容excel03 / 07
     * @param name
     */
    public ExcelReader(String name){
    	if (name.endsWith("xls")) {
			this.isExcel2003 = true;
		}else if (name.endsWith("xlsx")){
			this.isExcel2003 = false;
		}
    }
    
    /**  
     * 读取Excel表格表头的内容  
     * @param InputStream  
     * @return String 表头内容的数组  
     *   
     */  
    public String[] readExcelTitle(InputStream is) {   
        try {   
            //fs = new POIFSFileSystem(is);
            if (this.isExcel2003) {
            	wb = new HSSFWorkbook(is);
			}else {
				wb = new XSSFWorkbook(is);
			}
            sheet = wb.getSheetAt(0);   
            row = sheet.getRow(0);   
            //标题总列数   
            int colNum = row.getPhysicalNumberOfCells();   
            String[] title = new String[colNum];   
            for (int i=0; i<colNum; i++) {   
                title[i] = getStringCellValue(row.getCell((short) i));   
            }
            return title;
               
        } catch (IOException e) {   
            e.printStackTrace();   
        }   
           
        return null;   
    }   
       
    /**  
     * 读取Excel数据内容  
     * @param InputStream  
     * @return Map 包含单元格数据内容的Map对象  
     */  
    public Map<Integer,String> readExcelContent(InputStream is) {   
        Map<Integer,String> content = new HashMap<Integer,String>();   
        String str = "";   
        try {   
            //fs = new POIFSFileSystem(is);   
        	if (this.isExcel2003) {
        		fs = new POIFSFileSystem(is);
            	wb = new HSSFWorkbook(fs);
			}else {
				opc = OPCPackage.open(is);
				wb = new XSSFWorkbook(opc);
			}   
        } catch (IOException | InvalidFormatException e) {   
            e.printStackTrace();   
        }
        int sheetNum = wb.getNumberOfSheets();
        
        for (int z = 0; z < sheetNum; z++) {
        	
			sheet = wb.getSheetAt(z);
			System.out.println(sheet.getSheetName());
			//得到总行数   
			int rowNum = sheet.getLastRowNum();
			row = sheet.getRow(0);
			int colNum = row.getPhysicalNumberOfCells();
			//正文内容应该从第二行开始,第一行为表头的标题   
			for (int i = 1; i <= rowNum; i++) {
				row = sheet.getRow(i);
				int j = 0;
				while (j < colNum) {
					//每个单元格的数据内容用"$$"分割开，以后需要时用String类的replace()方法还原数据   
					//也可以将每个单元格的数据设置到一个javabean的属性中，此时需要新建一个javabean   
					str += getStringCellValue(row.getCell((short) j)).trim()
							+ ",";
					j++;
				}
				content.put(i, str);
				str = "";
			}
		}
		return content;   
    }   
       
    /**  
     * 获取单元格数据内容为字符串类型的数据  
     * @param cell Excel单元格  
     * @return String 单元格数据内容  
     */  
    @SuppressWarnings({ "deprecation", "unused" })
	private String getStringCellValue(Cell cell) {   
        String strCell = "";
        if (cell == null) {   
            return "";   
        } 
        switch (cell.getCellType()) {   
        case HSSFCell.CELL_TYPE_STRING:   
            strCell = cell.getStringCellValue();   
            break;   
        case HSSFCell.CELL_TYPE_NUMERIC:
        	//应对科学计数法
        	DecimalFormat df = new DecimalFormat("0"); 
            //strCell = String.valueOf(cell.getNumericCellValue());   
            strCell = df.format(cell.getNumericCellValue());
        	break;   
        case HSSFCell.CELL_TYPE_BOOLEAN:   
            strCell = String.valueOf(cell.getBooleanCellValue());   
            break;   
        case HSSFCell.CELL_TYPE_BLANK:   
            strCell = "";   
            break;   
        default:   
            strCell = "";   
            break;   
        }   
        if (strCell.equals("") || strCell == null) {   
            return "";   
        }   
          
        //System.out.println(strCell+"test");
        return strCell;   
    }   
       
    /**  
     * 获取单元格数据内容为日期类型的数据  
     * @param cell Excel单元格  
     * @return String 单元格数据内容  
     */  
    @SuppressWarnings({ "deprecation", "unused" })
	private String getDateCellValue(HSSFCell cell) {   
        String result = "";   
        try {
        	int cellType = cell.getCellType();   
            if (cellType == HSSFCell.CELL_TYPE_NUMERIC) {   
                Date date = cell.getDateCellValue();   
                result = (date.getYear() + 1900) + "-" + (date.getMonth() + 1)    
                + "-" + date.getDate();   
            } else if (cellType == HSSFCell.CELL_TYPE_STRING) {   
                String date = getStringCellValue(cell);   
                result = date.replaceAll("[年月]", "-").replace("日", "").trim();   
            } else if (cellType == HSSFCell.CELL_TYPE_BLANK) {   
                result = "";   
            }   
        } catch (Exception e) {   
            System.out.println("日期格式不正确!");   
            e.printStackTrace();   
        }   
        return result;   
    }  
}