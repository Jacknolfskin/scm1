package cn.zhx.scm1.service;

import cn.zhx.scm1.entity.ReturnOrder;

/**
 * @author:胡飞
 * @date:2017-1-17 上午11:32:41
 *
 * 
 */
public interface ReturnOrderSerive extends BaseService<ReturnOrder> {
	
    public int insertReturnOrder(ReturnOrder returnOrder) throws Exception;
}
