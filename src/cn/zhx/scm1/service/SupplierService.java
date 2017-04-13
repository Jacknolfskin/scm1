package cn.zhx.scm1.service;

import java.util.List;
import java.util.Map;

import cn.zhx.scm1.entity.Supplier;

/**
 * @author:胡飞
 * @date:2017-1-3 下午3:55:18
 *
 * 
 */
public interface SupplierService extends BaseService<Supplier> {
	List<Map<String, Object>> selectSupplier(Map<String, String> paramMap);
}
