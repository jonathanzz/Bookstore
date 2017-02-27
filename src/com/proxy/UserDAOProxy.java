package com.proxy;

import java.util.List;

import com.dao.IUserDAO;
import com.dbc.DatabaseConnection;
import com.impl.UserDAOImpl;
import com.vo.User;


public class UserDAOProxy implements IUserDAO {
	private DatabaseConnection dbc = null;
	private IUserDAO dao = null;

	public UserDAOProxy() throws Exception {
		this.dbc = new DatabaseConnection();
		this.dao = new UserDAOImpl(this.dbc.getConnection());
	}

	public boolean doCreate(User user) throws Exception {
		boolean flag = false;
		try {
			if (this.dao.findByUserName(user.getUsername()) == null) {
				flag = this.dao.doCreate(user);
			}
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return flag;
	}

	public List<User> findAll(String keyWord) throws Exception {
		List<User> all = null;
		try {
			all = this.dao.findAll(keyWord);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return all;
	}

	@Override
	public User findByUserName(String username) throws Exception {
		// TODO Auto-generated method stub
		User user = null;
		try {
			user = this.dao.findByUserName(username);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return user;
	}
	public User findByEmail(String email) throws Exception {
		// TODO Auto-generated method stub
		User user = null;
		try {
			user = this.dao.findByEmail(email);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return user;
	}
	public void deleteByUserName(String username) throws Exception {
		try {
			this.dao.deleteByUserName(username);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
	}
	public boolean findIsConfirm(String username) throws Exception{
		boolean flag = false;
		try {
			flag = this.dao.findIsConfirm(username);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return flag;
	}
	public int updateInf(User user) throws Exception{
		int result;
		try {
			result = this.dao.updateInf(user);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return result;
	}
	public List<String> getAllCostumers() throws Exception {
		List<String> allCustomers;
		try {
			allCustomers = this.dao.getAllCostumers();
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return allCustomers;
	}
}







