package cn.zhx.scm1.action;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.zhx.scm1.entity.Account;
import cn.zhx.scm1.service.AccountService;

@Controller
@RequestMapping("/foundPass")
public class FoundPassAcion extends BaseAction{
	@Resource
	private AccountService accountService;
	
	//修改密码
	@RequestMapping("/updateAccPass")
	public String updateAccPass(HttpSession session,Account account){
		System.out.println("-----action.account.update:"+account);
		System.out.println("进入修改密码后台方法");
		account.setAccLogin((String)session.getAttribute("accLogin"));
		System.out.println("-----action.account:"+account);
		int  i = 0;
		try {
			
			i = accountService.updateAccPass(account);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "forward:/WEB-INF/foundPass/return.jsp";
	}

	//忘记密码
	@RequestMapping("/forget")  
	@ResponseBody  
	public Map forget(HttpServletRequest request,Account acc){
		System.out.println("Action.forget:"+acc);
		String msg = "";  
		Map map = new HashMap<String ,String >();
		//用户名不存在  
		if(acc == null){              
	        msg = "用户名不存在,你不会忘记用户名了吧?";
	        map.put("msg", msg);
	        return map;
	    } 
		
		String accLogin = acc.getAccLogin();
		System.out.println("action.accLogin:"+accLogin);
		request.getSession().setAttribute("accLogin", accLogin);
	    Account account = accountService.findByNameLogin(accLogin);
	    
	    try{  
	        String secretKey= UUID.randomUUID().toString();//密钥
	        System.out.println("----------------"+secretKey);
	        Timestamp outDate = new Timestamp(System.currentTimeMillis()+30*60*1000);//30分钟后过期  
	        long date = outDate.getTime()/1000*1000;//忽略毫秒数  
	        account.setValidataCode(secretKey);  
	        account.setRegisterDate(outDate);  
	        accountService.update(account);//保存到数据库  
	        String key = account.getAccLogin()+"$"+date+"$"+secretKey;  
	        String digitalSignature = DigestUtils.md5Hex(key);//数字签名  
	  
	        String emailTitle = "进销存系统密码找回";  
	        String path = request.getContextPath();  
	        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
	        String resetPassHref =  basePath+"foundPass/resetpassword.action?sid="+digitalSignature+"&accLogin="+account.getAccLogin();  
	        String emailContent = "请勿回复本邮件.点击下面的链接,重设密码<br/><a href="+resetPassHref + " target='_BLANK'>点击我重新设置密码</a>" +  
	                "<br/>tips:本邮件超过30分钟,链接将会失效，需要重新申请'找回密码'"+key+"\t"+digitalSignature;  
	        System.out.println("=============链接："+resetPassHref);
	        System.out.println("==========account.getAccEamil:"+account.getAccEmail());
	        SendMail.sendHtmlMail(emailTitle,emailContent,account.getAccEmail());  
	        msg = "操作成功,已经发送找回密码链接到您邮箱。请在30分钟内重置密码";
	        //logInfo(request,acc,"申请找回密码");
	    }catch (Exception e){  
	        e.printStackTrace();  
	        msg="邮箱不存在？未知错误,联系管理员吧。";
	    }
		    map.put("msg",msg);
		    return map;
	
	}

	//重置密码
	@RequestMapping("/resetpassword")
	@ResponseBody
	public ModelAndView resetPassword(String sid,String accLogin){
		System.out.println("=============resertpassword.accLogin:"+accLogin);
		System.out.println("=======进入重置密码方法");
	    ModelAndView model = new ModelAndView("error");  
	    String msg = "";
	    System.out.println("==============进入修改页面后台");
	    if(sid.equals("") || accLogin.equals("")){  
	        msg="链接不完整,请重新生成";  
	        model.addObject("msg",msg) ;  
	        //logInfo(accLogin,"找回密码链接失效");  
	        return model;  
	    }  
	    Account acc = accountService.findByNameLogin(accLogin);  
	    if(acc == null){  
	        msg = "链接错误,无法找到匹配用户,请重新申请找回密码.";  
	        model.addObject("msg",msg) ;  
	        //logInfo(accLogin,"找回密码链接失效");  
	        return model;  
	    }  
	    Timestamp outDate = acc.getRegisterDate();  
	    if(outDate.getTime() <= System.currentTimeMillis()){//表示已经过期  
	        msg = "链接已经过期,请重新申请找回密码.";  
	        model.addObject("msg",msg) ;  
	        //logInfo(accLogin,"找回密码链接失效");  
	        return model;  
	    }  
	    String key = acc.getAccLogin()+"$"+outDate.getTime()/1000*1000+"$"+acc.getValidataCode();//数字签名  
	    String digitalSignature = DigestUtils.md5Hex(key);  
	    System.out.println(key+"\t"+digitalSignature);  
	    if(!digitalSignature.equals(sid)) {  
	        msg = "链接不正确,是否已经过期了?重新申请吧";  
	        model.addObject("msg",msg) ;  
	        //logInfo(accLogin,"找回密码链接失效");
	        System.out.println("==============进入最后三步啦！");
	        return model;  
	    }  
	    model.setViewName("resetpassword");//返回到修改密码的界面  
	    System.out.println("==============进入最后二步啦！！！");
	    model.addObject("accLogin",accLogin);  
	    System.out.println("==============进入最后一步啦！！！");
	    return model;
	}  

}
