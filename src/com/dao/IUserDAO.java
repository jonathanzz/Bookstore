package com.dao;
import java.util.List;

import com.vo.User;

public interface IUserDAO {
	public boolean doCreate(User user) throws Exception;
	public List<User> findAll(String KeyWord) throws Exception;
	public User findByUserName(String username) throws Exception;
	public void deleteByUserName(String username) throws Exception;
	public User findByEmail(String email) throws Exception;
	public boolean findIsConfirm(String username) throws Exception;
	public int updateInf(User user) throws Exception;
	public List<String> getAllCostumers() throws Exception;
}
