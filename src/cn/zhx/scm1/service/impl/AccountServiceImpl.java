package cn.zhx.scm1.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.zhx.scm1.dao.AccountMapper;
import cn.zhx.scm1.entity.Account;
import cn.zhx.scm1.entity.Page;
import cn.zhx.scm1.service.AccountService;

/**
 * @author:胡飞
 * @date:2017-1-4 上午9:29:03
 *
 * 
 */
@Service("accountService")
public class AccountServiceImpl extends BaseServiceImpl<Account> implements AccountService {
	
	/*public int insert(Account entity) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	public int delete(Account entity) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	public int update(Account entity) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	public Account select(Account entity) {
		// TODO Auto-generated method stub
		return null;
	}
*/
	public Account login(Account account) {
		// TODO Auto-generated method stub
		return accountMapper.login(account);
	}

	public Account findByNameLogin(String acc) {
		// TODO Auto-generated method stub
		return accountMapper.findByNameLogin(acc);
	}

	public int  updateAccPass(Account account) {
		// TODO Auto-generated method stub
		return accountMapper.updateAccPass(account);
	}

	public int forget(Account account) {
		// TODO Auto-generated method stub
		return accountMapper.forget(account);
	}
	
	public Account find(Account account) {
		// TODO Auto-generated method stub
		return accountMapper.find(account);
	}

	/*public Page<Account> selectPage(Page<Account> page) {
		// TODO Auto-generated method stub
		return null;
	}

	public Page<Account> selectPageUseDyc(Page<Account> page) {
		// TODO Auto-generated method stub
		return null;
	}

	public int deleteList(String[] pks) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}*/

}
