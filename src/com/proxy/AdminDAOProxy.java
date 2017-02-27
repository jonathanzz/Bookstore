package com.proxy;



import com.dao.IAdminDAO;
import com.dbc.DatabaseConnection;
import com.impl.AdminDAOImpl;
import com.vo.Admin;


public class AdminDAOProxy implements IAdminDAO{
	private DatabaseConnection dbc = null;
	private IAdminDAO dao = null;

	public AdminDAOProxy() throws Exception {
		this.dbc = new DatabaseConnection();
		this.dao = new AdminDAOImpl(this.dbc.getConnection());
	}

	

	public Admin findByAdminName(String adminName) throws Exception {
		// TODO Auto-generated method stub
		Admin admin = null;
		try {
			admin = this.dao.findByAdminName(adminName);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return admin;
	}
	
	public int updateAdminInf(Admin admin) throws Exception{
		int result;
		try {
			result = this.dao.updateAdminInf(admin);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return result;
	}
}
