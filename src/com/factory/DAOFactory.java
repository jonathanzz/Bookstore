package com.factory;

import com.dao.IAdminDAO;
import com.dao.IBooksDAO;
import com.dao.IBoughtTableDAO;
import com.dao.IMonitorTableDAO;
import com.dao.IShoppingCartDAO;
import com.dao.IUserDAO;
import com.proxy.AdminDAOProxy;
import com.proxy.BooksDAOProxy;
import com.proxy.BoughtTableDAOProxy;
import com.proxy.MonitorTableDAOProxy;
import com.proxy.ShoppingCartDAOProxy;
import com.proxy.UserDAOProxy;

public class DAOFactory {
	public static IUserDAO getIUsrDAOInstance() throws Exception {
		return new UserDAOProxy();
	}

	public static IMonitorTableDAO getIMonDAOInstance() throws Exception {
		return new MonitorTableDAOProxy();
	}

	public static IShoppingCartDAO getIShpcDAOInstance() throws Exception {
		return new ShoppingCartDAOProxy();
	}

	public static IBoughtTableDAO getIBgtDAOInstance() throws Exception {
		return new BoughtTableDAOProxy();
	}
	public static IAdminDAO getIAdmDAOInstance() throws Exception {
		return new AdminDAOProxy();
	}
	public static IBooksDAO getIBooksDAOInstance() throws Exception {
		return new BooksDAOProxy();
	}
	
}
