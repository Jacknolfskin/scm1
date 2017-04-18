package cn.zhx.scm1.action;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.zhx.scm1.entity.Account;

/**
 * @author:胡飞
 * @date:2017-1-3 下午4:06:06
 *
 * 
 */
@Controller
@RequestMapping("/base")
public class BaseAction {
@Resource
ServletContext application;

//方法参数folder通过@PathVariable指定其值可以从@RequestMapping的{folder}获取，同理file也一样
		@RequestMapping("/goURL/{folder}/{file}")
		public String goURL(@PathVariable String folder,@PathVariable String file) {
			//System.out.println("goURL.folder|file===" + folder+"/"+file);
			//Account account = (Account) session.getAttribute("account");
			//System.out.println("base.action:"+account);
			return "forward:/WEB-INF/"+folder+"/"+file+".jsp";
}

}
