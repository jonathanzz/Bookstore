package com.proxy;

import java.util.ArrayList;
import java.util.List;

import com.dao.IMonitorTableDAO;
import com.dbc.DatabaseConnection;
import com.impl.MonitorTableDAOImpl;
import com.vo.MonitorTable;


public class MonitorTableDAOProxy implements IMonitorTableDAO{
	private DatabaseConnection dbc = null;
	private IMonitorTableDAO dao = null;

	public MonitorTableDAOProxy() throws Exception {
		this.dbc = new DatabaseConnection();
		this.dao = new MonitorTableDAOImpl(this.dbc.getConnection());
	}

	public boolean doCreate(MonitorTable monitorTable) throws Exception {
		boolean flag = false;
		try {
			flag = this.dao.doCreate(monitorTable);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return flag;
	}

	public List<MonitorTable> findAll(String keyWord) throws Exception {
		List<MonitorTable> all = null;
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
	public List<MonitorTable> findByUserName(String username) throws Exception {
		// TODO Auto-generated method stub
		List<MonitorTable> monitorTable = new ArrayList<MonitorTable>();
		try {
			monitorTable = this.dao.findByUserName(username);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return monitorTable;
	}
	
	public void deleteAllItems() throws Exception{
		try {
			this.dao.deleteAllItems();
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
	}
	
	public List<String> getCostumers() throws Exception {
		List<String> customers = new ArrayList<String>();
		try {
			customers = this.dao.getCostumers();
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return customers;
	}
}
