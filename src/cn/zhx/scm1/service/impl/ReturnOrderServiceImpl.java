package cn.zhx.scm1.service.impl;

import java.util.UUID;

import org.springframework.stereotype.Service;

import cn.zhx.scm1.dao.ReturnOrderMapper;
import cn.zhx.scm1.entity.AccountRecords;
import cn.zhx.scm1.entity.Page;
import cn.zhx.scm1.entity.ReturnOrder;
import cn.zhx.scm1.entity.ReturnOrderDetail;
import cn.zhx.scm1.service.ReturnOrderSerive;

/**
 * @author:胡飞
 * @date:2017-1-17 上午11:36:33
 *
 * 
 */
@Service("returnOrderService")
public class ReturnOrderServiceImpl extends BaseServiceImpl<ReturnOrder> implements
		ReturnOrderSerive {

	public int insert(ReturnOrder entity) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	public int delete(ReturnOrder entity) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteList(String[] pks) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	public int update(ReturnOrder entity) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	public ReturnOrder select(ReturnOrder entity) {
		// TODO Auto-generated method stub
		return null;
	}

	public Page<ReturnOrder> selectPage(Page<ReturnOrder> page) {
		// TODO Auto-generated method stub
		return null;
	}

	public Page<ReturnOrder> selectPageUseDyc(Page<ReturnOrder> page) {
		// TODO Auto-generated method stub
		return null;
	}

	public int insertReturnOrder(ReturnOrder returnOrder) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("service.returnOrder:"+returnOrder);
		int i = 0;
		String roId = "ro" + UUID.randomUUID().toString().replace("-", "");
		System.out.println("roIduuid"+roId);
		//设置采购单号
		returnOrder.setRoId(roId);		
		i = returnOrderMapper.insert(returnOrder);
		
		//设置采购明细主键及与采购单的外键
		for(ReturnOrderDetail rod : returnOrder.getReturnOrderDetails()){
			rod.setRodId(UUID.randomUUID().toString().replace("-", ""));
			rod.setRoId(roId);
		}
		
		returnOrderDetailMapper.insertList(returnOrder.getReturnOrderDetails());
		
		AccountRecords accountRecords = new AccountRecords();
		// 生成并设置账务记录的主键
		accountRecords.setArId(String.valueOf("ar"+UUID.randomUUID().toString().replace("-", "")));
		accountRecords.setArAttn(returnOrder.getRoAttn());
		accountRecords.setArArrears(returnOrder.getRoArrears());
		//bo表示商品采购，可以在参数表中加入相关内容
		accountRecords.setArBusType("Ro");
		accountRecords.setArDate(returnOrder.getRoDate());
		//优惠金额：用应付金额减去实付金额再减去欠款
		accountRecords.setArDiscount(returnOrder.getRoPayable().subtract(returnOrder.getRoPaid()).subtract(returnOrder.getRoArrears()));
		accountRecords.setArOperator(returnOrder.getRoOperator());
		//采购单号
		accountRecords.setArOrderId(returnOrder.getRoId());
		accountRecords.setArPaid(returnOrder.getRoPaid());
		accountRecords.setArPayable(returnOrder.getRoPayable());
		accountRecords.setArRemark(returnOrder.getRoRemark());
		accountRecords.setSupId(returnOrder.getSupId());
		System.out.println("---------accountRecords:"+accountRecords);
		accountRecordsMapper.insert(accountRecords);
		return i;
	}

}
