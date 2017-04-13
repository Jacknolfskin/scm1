package cn.zhx.scm1.service;

import cn.zhx.scm1.entity.BuyOrder;

public interface BuyOrderService extends BaseService<BuyOrder> {
	
	public int insertBuyOrder(BuyOrder buyOrder) throws Exception;
	 
}
