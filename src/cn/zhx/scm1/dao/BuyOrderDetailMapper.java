package cn.zhx.scm1.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import cn.zhx.scm1.entity.BuyOrderDetail;

public interface BuyOrderDetailMapper extends BaseMapper<BuyOrderDetail> {
	public int insertList(List<BuyOrderDetail> buyOrderDetails);
}