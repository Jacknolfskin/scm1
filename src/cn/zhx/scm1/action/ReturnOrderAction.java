package cn.zhx.scm1.action;

import java.util.Arrays;

import javax.annotation.Resource;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.zhx.scm1.entity.BuyOrderDetail;
import cn.zhx.scm1.entity.ReturnOrder;
import cn.zhx.scm1.entity.ReturnOrderDetail;
import cn.zhx.scm1.service.ReturnOrderSerive;

/**
 * @author:胡飞
 * @date:2017-1-17 下午1:54:47
 *
 * 
 */@Controller
 @RequestMapping("/returnOrder")
public class ReturnOrderAction extends BaseAction {
@Resource
private ReturnOrderSerive returnOrderSerive;


@RequestMapping("/insert")
@ResponseBody
public Object insert(ReturnOrder returnOrder,String rows)
{
	System.out.println("-----action.buyOrder:"+returnOrder);
	System.out.println("-----action.rows:"+rows);
	ObjectMapper mapper = new ObjectMapper();
	int i = 0;
	try {
		ReturnOrderDetail[] returnOrderDetails = mapper.readValue(rows, ReturnOrderDetail[].class);
		returnOrder.setReturnOrderDetails(Arrays.asList(returnOrderDetails));
		i=returnOrderSerive.insertReturnOrder(returnOrder);
	} catch (Exception e) {
		// TODO: handle exception
	}
	return i;
	}
}
