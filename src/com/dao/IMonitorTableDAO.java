package com.dao;

import java.util.List;

import com.vo.MonitorTable;

public interface IMonitorTableDAO {
	public boolean doCreate(MonitorTable monitorTable) throws Exception;
	public List<MonitorTable> findAll(String KeyWord) throws Exception;
	public List<MonitorTable> findByUserName(String username) throws Exception;
	public void deleteAllItems() throws Exception;
	public List<String> getCostumers() throws Exception;
}
