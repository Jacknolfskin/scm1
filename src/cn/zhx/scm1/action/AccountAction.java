package cn.zhx.scm1.action;

import java.io.BufferedInputStream;
import java.io.OutputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.zhx.scm1.entity.Account;
import cn.zhx.scm1.entity.Page;
import cn.zhx.scm1.entity.Supplier;
import cn.zhx.scm1.service.AccountService;
import cn.zhx.scm1.util.RandomNumUtil;

/**
 * @author:胡飞
 * @date:2017-1-4 上午9:31:23
 *
 * 
 */
@Controller
@RequestMapping("/account")
public class AccountAction extends BaseAction {
@Resource
private AccountService accountService;

//登录验证
@RequestMapping(value="/login")
public String login(Account account,String accWord,HttpServletRequest request,HttpSession session)
{
	String random = (String) request.getSession().getAttribute("random");
	//System.out.println(random+"***************");
	//System.out.println("-----action.account:"+account);
	session.setAttribute("account", account);
	Account acc  = accountService.login(account);
	if (random.equalsIgnoreCase(accWord)) {
		if (acc!=null) {
			session.setAttribute("account", acc); 
			return "forward:/WEB-INF/main/index.jsp";
		}else {
			request.setAttribute("msg","用户名或密码错误!");
			return "forward:/WEB-INF/main/index.jsp";
		}
	}else {
		request.setAttribute("msg","验证码错误!");
		return "forward:/login.jsp";
	}
	}


//注册验证
@RequestMapping("/registerverity")
@ResponseBody
public boolean registerverity(HttpServletRequest request,HttpServletResponse response){
	Account account = null;
	try {
	
		String accName = request.getParameter("accName");
		String accLogin = request.getParameter("accLogin");
		
		account = accountService.findByNameLogin(accName);
		System.out.println("==========registerverity:"+account);
		if (account != null) {
			//数据库存在
			return false;
			
		}else if (accountService.findByNameLogin(accLogin) != null) {
			
			return false;
			
		}else{
			
			return true;
	    }
		}catch (Exception e) {
			
		    e.printStackTrace();
	}
		   return true;
}


//用户注册
@RequestMapping("/register")
public String register(Account account,HttpServletRequest request){
	System.out.println("=======account:"+account);
	int i = 0;
	try {
			i = accountService.insert(account);
			
		}catch (Exception e) {
		    e.printStackTrace();
	}
	return "forward:/return.jsp";
}

//用户信息修改
@RequestMapping("/update")
@ResponseBody
public int update(Account account){
	System.out.println("-----action.account:"+account);
	int i = 0;
	try {
		i = accountService.update(account);
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	return i;
}



//用户信息分页显示
@RequestMapping("/selectPageUseDyc")
@ResponseBody 
public Object selectPageUseDyc(Page<Account> page,Account account){
	page.setParamEntity(account);
	System.out.println("----page:"+page);
	Page p = accountService.selectPageUseDyc(page);
	return p.getPageMap();
}

//验证码生成
@RequestMapping(value="/randImage")
@ResponseBody
public void randImage(HttpServletRequest request,HttpServletResponse response) throws Exception{
	System.out.println("进入验证码后台");
	RandomNumUtil rdnu=RandomNumUtil.Instance(); 
	//this.setInputStream(rdnu.getImage());
	request.getSession().setAttribute("random", rdnu.getStr());
	System.out.println("================="+rdnu.getStr());
	//return "success";
	BufferedInputStream bis = null;
	OutputStream os = null;
    	bis = new BufferedInputStream(rdnu.getImage());  
        	byte[] buffer = new byte[512];  
            response.setCharacterEncoding("UTF-8");  
                        //不同类型的文件对应不同的MIME类型  
            response.setContentType("image/*");  
                        //文件以流的方式发送到客户端浏览器
            response.setContentLength(bis.available());  
            os = response.getOutputStream();  
            	int n;  
                while ((n = bis.read(buffer)) != -1) {  
                  os.write(buffer, 0, n);  
            }  
            bis.close();  
            os.flush();  
            os.close();
}

@RequestMapping("/doAjax")
@ResponseBody
public Object doAjax(Supplier supplier){
	System.out.println("---doAjax.supplier:"+supplier);
	supplier.setSupName("supName1");
	return supplier;
}


}
