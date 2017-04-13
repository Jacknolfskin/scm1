package cn.zhx.scm1.service;

import cn.zhx.scm1.entity.Account;

/**
 * @author:胡飞
 * @date:2017-1-4 上午9:27:40
 *
 * 
 */
public interface AccountService extends BaseService<Account> {
public Account login(Account account);

public Account findByNameLogin(String acc);

public int  updateAccPass(Account account);

public int forget(Account account);

public Account find(Account account);
}
