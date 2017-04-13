package cn.zhx.scm1.servlets;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.mail.iap.Response;

import cn.zhx.scm1.entity.Account;

public class LoginFilter implements Filter {
	
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	public void doFilter(ServletRequest request, ServletResponse response,FilterChain chain) throws IOException, ServletException {
		
		//获得request、reponse、session对象
		HttpServletRequest servletRequest = (HttpServletRequest) request;
		HttpServletResponse servletResponse = (HttpServletResponse) response;
		HttpSession session = servletRequest.getSession();
		
		//获得用户请求的URL
		String path = servletRequest.getRequestURI();
		
		//从session里取用户信息
		Account account = (Account) session.getAttribute("account");
		System.out.println("=====LoginFilter:"+account);
		
		//登录页面不过滤
		if(path.indexOf("/login.jsp") > -1){
			chain.doFilter(servletRequest, servletResponse);
			return;
		}
		
		//判断如果用户信息为空，就跳转到登录页面
		if (account == null || "".equals(account)) {
			
			servletResponse.sendRedirect("/scm1/login.jsp?error=yes");
			
		}else {
			
			chain.doFilter(request, response);
		}

	}

	
	public void destroy() {
		
	}



	

}
