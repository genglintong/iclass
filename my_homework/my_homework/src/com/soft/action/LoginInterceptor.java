package com.soft.action;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.soft.domain.Student;
import com.soft.domain.Teacher;

import javafx.scene.control.Tab;

public class LoginInterceptor extends AbstractInterceptor{

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		// TODO 自动生成的方法存根
		String actionName=invocation.getProxy().getActionName();
        if(actionName.indexOf("login") != -1 || actionName.indexOf("Login") != -1){
            return invocation.invoke();
                    
        }
        //如果不是login.则判断是否已登录,及检测session中key为user的值是否存在,如果不存在,跳回到登录页面
        Student student=(Student)invocation.getInvocationContext().getSession().get("existStudent");
        Teacher teacher=(Teacher)invocation.getInvocationContext().getSession().get("teacher");
        if(student==null && teacher == null){
            System.out.println("未登录");
            return "login";
        }
        //进行到这里.说明用户已登录,则跳转到下一个拦截器
        return invocation.invoke();
	}

}
