package cn.zhx.scm1.service;

import java.util.Map;

import cn.zhx.scm1.entity.SysParam;

/**
 * @author:胡飞
 * @date:2017-1-12 上午9:09:27
 *
 * 
 */
public interface SysParamService extends BaseService<SysParam> {
   public Map<String, Object> selectList();
}
