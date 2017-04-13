package cn.zhx.scm1.service;

import java.util.List;
import java.util.Map;

import cn.zhx.scm1.entity.BuyOrder;
import cn.zhx.scm1.entity.Page;

/**
 * @author:胡飞
 * @date:2017-1-3 下午3:55:33
 *
 * 
 */
public interface BaseService<T> {
	//添加单个信息
		public int insert(T entity) throws Exception;
	//删除单个信息
		public int delete(T entity) throws Exception;
	//通过主键(数组)批量删除数据
		public int deleteList(String [] pks) throws Exception;
	//修改单个信息
		public int update(T entity) throws Exception;
	//查询单个信息
		public T select(T entity);
	//通过关键字分页查询
		public Page<T> selectPage(Page<T> page);
	//通过多条件分页查询
		public Page<T> selectPageUseDyc(Page<T> page);
	//导出页面所选项
        //public List<GoodsBean> selectScore(String [] pks) throws Exception;
		public List<Map<String, Object>> selectScore(String [] pks);
	
}
