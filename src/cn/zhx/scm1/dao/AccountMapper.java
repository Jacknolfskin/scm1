package cn.zhx.scm1.dao;

import cn.zhx.scm1.entity.Account;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AccountMapper extends BaseMapper<Account> {
    public Account login(Account account);
    
    public Account findByNameLogin(String acc);
    
    public int  updateAccPass(Account account);
    
    public int forget(Account account);
    
    public Account find(Account account);
}