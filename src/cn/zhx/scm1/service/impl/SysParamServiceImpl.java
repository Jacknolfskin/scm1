package cn.zhx.scm1.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import cn.zhx.scm1.entity.Page;
import cn.zhx.scm1.entity.SysParam;
import cn.zhx.scm1.service.SysParamService;

/**
 * @author:胡飞
 * @date:2017-1-12 上午9:11:16
 *
 * 
 */
@Service("sysParamService")
public class SysParamServiceImpl extends BaseServiceImpl<SysParam> implements
		SysParamService {

	public int insert(SysParam entity) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	public int delete(SysParam entity) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteList(String[] pks) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	public int update(SysParam entity) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	public SysParam select(SysParam entity) {
		// TODO Auto-generated method stub
		return null;
	}

	public Page<SysParam> selectPage(Page<SysParam> page) {
		// TODO Auto-generated method stub
		return null;
	}

	public Page<SysParam> selectPageUseDyc(Page<SysParam> page) {
		// TODO Auto-generated method stub
		return null;
	}

	public Map<String, Object> selectList() {
		// TODO Auto-generated method stub
		List<SysParam> sysParams = sysParamMapper.selectList("");
		Map<String, Object> sysParamMap = new HashMap<String, Object>();
		Map<String, Object> fieldMap = null;
		for(SysParam sysParam : sysParams){
			if("1".equals(sysParam.getSysParamType()))
			{
				String sql = sysParam.getSysParamValue();
				System.out.println("======"+sql);
				List<SysParam> otherList = sysParamMapper.selectOtherTable(sql);
				fieldMap = new HashMap<String, Object>();
				for(SysParam otherSysParam : otherList){
					fieldMap.put(otherSysParam.getSysParamValue(),otherSysParam.getSysParamText());
				}
				sysParamMap.put(sysParam.getSysParamField(), fieldMap);
			}
			else {
				if(sysParamMap.get(sysParam.getSysParamField())==null)
				{
					fieldMap = new HashMap<String, Object>();
					fieldMap.put(sysParam.getSysParamValue(), sysParam.getSysParamText());
					sysParamMap.put(sysParam.getSysParamField(), fieldMap);
				}else {
					fieldMap = (Map<String, Object>) sysParamMap.get(sysParam.getSysParamField());
					fieldMap.put(sysParam.getSysParamValue(), sysParam.getSysParamText());
				}
			}
		}
		
		return sysParamMap;
	}

}
