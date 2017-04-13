package cn.zhx.scm1.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.zhx.scm1.entity.Account;

public class LoginOutServlet extends HttpServlet {

		private static final long serialVersionUID = 1L;  
		  
	    public void doGet(HttpServletRequest request, HttpServletResponse response)  
	            throws ServletException, IOException {  
	        HttpSession session = request.getSession(false);//防止创建Session  
	        if(session == null){
	            response.sendRedirect("/scm1/login.jsp");
	            return;  
	        }  
	          
	        session.removeAttribute("account");
	        Account account = (Account) session.getAttribute("account");
	        System.out.println("========LoginOutServlet:"+account);
	        response.sendRedirect("/scm1/login.jsp");
	    }  
	  
	    public void doPost(HttpServletRequest request, HttpServletResponse response)  
	            throws ServletException, IOException {  
	  
	    }  
	    
	  
	}  