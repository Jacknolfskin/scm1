package cn.zhx.scm1.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Service;

import cn.zhx.scm1.dao.GoodsMapper;
import cn.zhx.scm1.entity.Goods;
import cn.zhx.scm1.service.GoodsService;

/**
 * @author:胡飞
 * @date:2017-1-10 上午11:01:07
 *
 * 
 */
@Service("goodsService")
public class GoodsServiceImpl extends BaseServiceImpl<Goods> implements GoodsService {

	/*private SqlSessionFactory sqlSessionFactory;
	public SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}
	
	public List<Map<String, Object>> selectScore(String[] pks1)
			throws Exception {
		// TODO Auto-generated method stub
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = session.selectList("selectscore",pks1);
		session.close();
		return list;
	}*/

}
