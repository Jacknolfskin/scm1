package cn.zhx.scm1.action;

import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.zhx.scm1.entity.SysParam;
import cn.zhx.scm1.service.SysParamService;

/**
 * @author:胡飞
 * @date:2017-1-12 上午10:03:14
 *
 * 
 */
//系统参数加载
@Controller
@RequestMapping("/sysParam")
public class SysParamAction extends BaseAction {
@Resource
private SysParamService sysParamService;
@RequestMapping(value="/insert")
@ResponseBody
public Object insert(SysParam sysParam){
	reloadSysParam();
	return null;
}
@RequestMapping(value="/reload")
@ResponseBody
public void reloadSysParam(){
	loadSysParam();
}
@PostConstruct
public void initSysParam(){
	loadSysParam();
}
public void loadSysParam(){
	Map<String, Object> sysParamMap = sysParamService.selectList();
	application.setAttribute("sysParam", sysParamMap);
	//System.out.println("=========系统参数加载成功2===============");
}
}
