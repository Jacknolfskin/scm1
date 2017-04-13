package cn.zhx.scm1.service.impl;

import java.util.UUID;

import org.springframework.stereotype.Service;

import cn.zhx.scm1.entity.AccountRecords;
import cn.zhx.scm1.entity.BuyOrder;
import cn.zhx.scm1.entity.BuyOrderDetail;
import cn.zhx.scm1.entity.Page;
import cn.zhx.scm1.service.BaseService;
import cn.zhx.scm1.service.BuyOrderService;

/**
 * @author:胡飞
 * @date:2017-1-11 下午4:25:39
 *
 * 
 */
@Service("buyOrderService")
public class BuyOrderServiceImpl extends BaseServiceImpl<BuyOrder> implements
		BuyOrderService {

	public int insert(BuyOrder entity) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	public int delete(BuyOrder entity) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	public int update(BuyOrder entity) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	public BuyOrder select(BuyOrder entity) {
		// TODO Auto-generated method stub
		return null;
	}

	public Page<BuyOrder> selectPage(Page<BuyOrder> page) {
		// TODO Auto-generated method stub
		return null;
	}

	public Page<BuyOrder> selectPageUseDyc(Page<BuyOrder> page) {
		// TODO Auto-generated method stub
		return null;
	}

	public int insertBuyOrder(BuyOrder buyOrder) throws Exception {
		// TODO Auto-generated method stub
				System.out.println("service.buyOrder:"+buyOrder);
				int i = 0;		
				//生成采购单号,bo表示采购业务
				
				//bo --商品采购
				//ro --商品退货
				//
				String boId ="bo"+UUID.randomUUID().toString().replace("-", "");
				System.out.println("boIduuid:"+boId);
				//设置采购单号
				buyOrder.setBoId(boId);		
				i = buyOrderMapper.insert(buyOrder);
				
				//设置采购明细主键及与采购单的外键
				for(BuyOrderDetail bod : buyOrder.getBuyOrderDetails()){
					bod.setBodId(UUID.randomUUID().toString().replace("-", ""));
					bod.setBoId(boId);
				}
				buyOrderDetailMapper.insertList(buyOrder.getBuyOrderDetails());
				
				AccountRecords accountRecords = new AccountRecords();
				// 生成并设置账务记录的主键
				accountRecords.setArId(String.valueOf("ar"+UUID.randomUUID().toString().replace("-", "")));
				accountRecords.setArAttn(buyOrder.getBoAttn());
				accountRecords.setArArrears(buyOrder.getBoArrears());
				//bo表示商品采购，可以在参数表中加入相关内容
				accountRecords.setArBusType("Bo");
				accountRecords.setArDate(buyOrder.getBoDate());
				//优惠金额：用应付金额减去实付金额再减去欠款
				accountRecords.setArDiscount(buyOrder.getBoPayable().subtract(buyOrder.getBoPaid()).subtract(buyOrder.getBoArrears()));
				accountRecords.setArOperator(buyOrder.getBoOperator());
				//采购单号
				accountRecords.setArOrderId(buyOrder.getBoId());
				accountRecords.setArPaid(buyOrder.getBoPaid());
				accountRecords.setArPayable(buyOrder.getBoPayable());
				accountRecords.setArRemark(buyOrder.getBoRemark());
				accountRecords.setSupId(buyOrder.getSupId());
				System.out.println("accountRecords:"+accountRecords);
				accountRecordsMapper.insert(accountRecords);
				return i;
			}
	}

