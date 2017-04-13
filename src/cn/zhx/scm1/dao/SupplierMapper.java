package cn.zhx.scm1.dao;

import cn.zhx.scm1.entity.Supplier;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface SupplierMapper extends BaseMapper<Supplier>{
   List<Map<String, Object>> selectSupplier(Map<String, String> paramMap);
}