package com.soft.action;

import static org.hamcrest.CoreMatchers.nullValue;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.Map;

import org.apache.struts2.util.StrutsTypeConverter;


public class DateConverter extends StrutsTypeConverter{

	private SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	@Override
	public Object convertFromString(Map context, String[] value, Class toType) {
		// TODO Auto-generated method stub
		String d = value[0]; 
		try {
			java.util.Date date= format.parse(d);
			return date;
		} catch (java.text.ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String convertToString(Map context, Object date) {
		// TODO Auto-generated method stub
		return format.format(date);
	}
	
}
