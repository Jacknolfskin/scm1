package cn.zhx.scm1.dao;

import cn.zhx.scm1.entity.SysParam;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SysParamMapper extends BaseMapper<SysParam> {
    public List<SysParam> selectList(String type);
    public List<SysParam> selectOtherTable(String sql);
}