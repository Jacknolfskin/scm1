package cn.zhx.scm1.dao;

import cn.zhx.scm1.entity.ReturnOrderDetail;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ReturnOrderDetailMapper extends BaseMapper<ReturnOrderDetail> {
   public int insertList(List<ReturnOrderDetail> returnOrderDetails);
}