package com.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dao.IMonitorTableDAO;
import com.vo.MonitorTable;

public class MonitorTableDAOImpl implements IMonitorTableDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;

	public MonitorTableDAOImpl(Connection conn) {
		this.conn = conn;
	}

	@Override
	public boolean doCreate(MonitorTable monitorTable) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		String sql = "INSERT INTO monitorTable(username,book,processdate,added,removed,bought) VALUES(?,?,?,?,?,?)";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, monitorTable.getUsername());
		this.pstmt.setString(2, monitorTable.getBook());
		this.pstmt.setString(3, monitorTable.getProcessdate());
		this.pstmt.setBoolean(4, monitorTable.isAdded());
		this.pstmt.setBoolean(5, monitorTable.isRemoved());
		this.pstmt.setBoolean(6, monitorTable.isBought());
		if (this.pstmt.executeUpdate() > 0) {
			flag = true;
		}
		this.pstmt.close();
		return flag;
	}

	@Override
	public List<MonitorTable> findAll(String KeyWord) throws Exception {
		// TODO Auto-generated method stub
		List<MonitorTable> all = new ArrayList<MonitorTable>();
		String sql = "SELECT username,book,processdate,added,removed,bought FROM monitorTable WHERE processdate LIKE ?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, "%" + KeyWord + "%");
		ResultSet rs = this.pstmt.executeQuery();
		MonitorTable monitorTable = null;
		while (rs.next()) {
			monitorTable = new MonitorTable();
			monitorTable.setUsername(rs.getString(1));
			monitorTable.setBook(rs.getString(2));
			monitorTable.setProcessdate(rs.getString(3));
			monitorTable.setAdded(rs.getBoolean(4));
			monitorTable.setRemoved(rs.getBoolean(5));
			monitorTable.setBought(rs.getBoolean(6));
		}
		return all;
	}

	public List<MonitorTable> findByUserName(String username) throws Exception {
		List<MonitorTable> monitorTable = new ArrayList<MonitorTable>();
		MonitorTable m = null;
		String sql = "SELECT username,book,processdate,added,removed,bought FROM monitorTable WHERE username=?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, username);
		ResultSet rs = this.pstmt.executeQuery();
		while (rs.next()) {
			m = new MonitorTable();
			m.setUsername(rs.getString(1));
			m.setBook(rs.getString(2));
			m.setProcessdate(rs.getString(3));
			m.setAdded(rs.getBoolean(4));
			m.setRemoved(rs.getBoolean(5));
			m.setBought(rs.getBoolean(6));
			monitorTable.add(m);
		}
		this.pstmt.close();
		return monitorTable;
	}

	public void deleteAllItems() throws Exception {
		String sql = "truncate table monitorTable";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.executeUpdate();
	}

	public List<String> getCostumers() throws Exception {
		List<String> customers = new ArrayList<String>();
		String sql = "SELECT DISTINCT username from monitorTable";
		this.pstmt = this.conn.prepareStatement(sql);
		ResultSet rs = this.pstmt.executeQuery();
		while (rs.next()) {
			String m = null;
			m = rs.getString(1);
			customers.add(m);
		}
		this.pstmt.close();
		return customers;
	}
}
