package cn.zhx.scm1.action;

import cn.zhx.scm1.entity.BuyOrder;
import cn.zhx.scm1.entity.BuyOrderDetail;
import cn.zhx.scm1.service.BuyOrderService;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Arrays;

@Controller
@RequestMapping("/buyOrder")
public class BuyOrderAction extends BaseAction {
	@Resource
	private BuyOrderService buyOrderService;
	
	@RequestMapping(value="/insert")
	@ResponseBody 
	public Object insert(BuyOrder buyOrder, String rows){
		System.out.println("---action.buyOrder:"+buyOrder);
		System.out.println("---action.rows:"+rows);
		/*Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
		String dateString = sdf.format(date);
		String data = buyOrder.getBoDate()+dateString;
		System.out.println("=====================date:"+data);*/
	    //buyOrder.setBoDate(new Timestamp(System.currentTimeMillis()));
		/*SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        // public final String format(Date date)
		String s = sdf.format(buyOrder.getBoDate());
		buyOrder.setBoDate(boDate)*/
		
		
		//提供json格式数据转java对象
		ObjectMapper  mapper = new ObjectMapper();
		
		int i = 0;
		try {
			BuyOrderDetail [] buyOrderDetails = mapper.readValue(rows, BuyOrderDetail[].class);
			buyOrder.setBuyOrderDetails(Arrays.asList(buyOrderDetails));
			i =buyOrderService.insertBuyOrder(buyOrder);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	
}
