package com.soft.action;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.soft.domain.Student;

public class firstInterceptor extends AbstractInterceptor{

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		// TODO Auto-generated method stub
		String actionName=invocation.getProxy().getActionName();
        if(actionName.indexOf("showInfo") != -1 || actionName.indexOf("Password") != -1){
            return invocation.invoke();
                    
        }
        String login_type = (String)invocation.getInvocationContext().getSession().get("Login_type");
        if(login_type == null || !login_type.equals("student") )
        {
        	return invocation.invoke();
        }
        //如果不是login.则判断是否已登录,及检测session中key为user的值是否存在,如果不存在,跳回到登录页面
        Student student=(Student)invocation.getInvocationContext().getSession().get("existStudent");
        if(student==null){
        	return invocation.invoke();
        }
        if(student.getIsFirstLogin() == 1)
        {
        	System.out.println("第一次登录");
        	return "changePassword";
        }
        else
        {
        	return invocation.invoke();
        }
        //进行到这里.说明用户已登录,则跳转到下一个拦截器
	}

}
