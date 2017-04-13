package cn.zhx.scm1.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.zhx.scm1.dao.SupplierMapper;
import cn.zhx.scm1.entity.Page;
import cn.zhx.scm1.entity.Supplier;
import cn.zhx.scm1.service.SupplierService;

/**
 * @author:胡飞
 * @date:2017-1-3 下午3:58:37
 *
 * 
 */
@Service("supplierService")
public class SupplierServiceImpl extends BaseServiceImpl<Supplier> implements SupplierService {

	public List<Map<String, Object>> selectSupplier(Map<String, String> paramMap) {
		// TODO Auto-generated method stub
		return supplierMapper.selectSupplier(paramMap);
	}

	
	/*@Autowired
	private SupplierMapper supplierMapper;

	public int delete(Supplier entity) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	public int update(Supplier supplier) throws Exception {
		// TODO Auto-generated method stub
		return supplierMapper.update(supplier);
	}

	public Supplier select(Supplier entity) {
		// TODO Auto-generated method stub
		return null;
	}

	public int insert(Supplier supplier) {
		// TODO Auto-generated method stub
		return supplierMapper.insert(supplier);
	}

	public Page<Supplier> selectPage(Page<Supplier> page) {
		// TODO Auto-generated method stub
		page.setList(supplierMapper.selectPageList(page));
		page.setTotalRecord(supplierMapper.selectPageCount(page));
		return page;
	}

	public Page<Supplier> selectPageUseDyc(Page<Supplier> page) {
		// TODO Auto-generated method stub
		page.setList(supplierMapper.selectPageListUseDyc(page));
		page.setTotalRecord(supplierMapper.selectPageCountUseDyc(page));
		return page;
	}

	public int deleteList(String [] pks) throws Exception {
		// TODO Auto-generated method stub
		return supplierMapper.deleteList(pks);
	}*/

}
