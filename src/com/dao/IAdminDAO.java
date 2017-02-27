package com.dao;

import com.vo.Admin;

public interface IAdminDAO {

	public Admin findByAdminName(String adminName) throws Exception;

	public int updateAdminInf(Admin admin) throws Exception;

}
