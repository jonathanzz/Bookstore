package com.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dao.IBoughtTableDAO;
import com.factory.DAOFactory;
import com.util.DateUtil;
import com.vo.BoughtTable;
import com.vo.MonitorTable;

public class BoughtTableDAOImpl implements IBoughtTableDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;

	public BoughtTableDAOImpl(Connection conn) {
		this.conn = conn;
	}

	@Override
	public boolean doCreate(BoughtTable boughtTable) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		String sql = "INSERT INTO boughtTable(username,book,count) VALUES(?,?,?)";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, boughtTable.getUsername());
		this.pstmt.setString(2, boughtTable.getBook());
		this.pstmt.setInt(3, boughtTable.getCount());
		if (this.pstmt.executeUpdate() > 0) {
			flag = true;
		}
		this.pstmt.close();
		MonitorTable monitor = new MonitorTable();
		monitor.setBought(true);
		monitor.setRemoved(false);
		monitor.setAdded(false);
		monitor.setBook(boughtTable.getBook());
		monitor.setUsername(boughtTable.getUsername());
		monitor.setProcessdate(DateUtil.getCurrentDate());
		DAOFactory.getIMonDAOInstance().doCreate(monitor);
		return flag;
	}

	@Override
	public List<BoughtTable> findAll(String KeyWord) throws Exception {
		// TODO Auto-generated method stub
		List<BoughtTable> all = new ArrayList<BoughtTable>();
		String sql = "SELECT username,book,count FROM boughtTable WHERE username LIKE ?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, "%" + KeyWord + "%");
		ResultSet rs = this.pstmt.executeQuery();
		BoughtTable boughtTable = null;
		while (rs.next()) {
			boughtTable = new BoughtTable();
			boughtTable.setUsername(rs.getString(1));
			boughtTable.setBook(rs.getString(2));
			boughtTable.setCount(rs.getInt(3));
			all.add(boughtTable);
		}
		return all;
	}


	public BoughtTable findBoughtInf(String username, String book)
			throws Exception {
		BoughtTable boughtTable = null;
		String sql = "SELECT count FROM boughtTable WHERE username=? AND book =?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, username);
		this.pstmt.setString(2, book);
		ResultSet rs = this.pstmt.executeQuery();
		if (rs.next()) {
			boughtTable = new BoughtTable();
			boughtTable.setUsername(rs.getString(1));
			boughtTable.setBook(rs.getString(2));
			boughtTable.setCount(rs.getInt(3));
		}
		return boughtTable;
	}

	public int updateBoughtInf(BoughtTable boughtIteam) throws Exception {
		int result;
		String sql = "update boughtTable set count =? where username =? and book =?";
		pstmt = this.conn.prepareStatement(sql);
		pstmt.setInt(1, boughtIteam.getCount());
		pstmt.setString(2, boughtIteam.getUsername());
		pstmt.setString(3, boughtIteam.getBook());
		result = pstmt.executeUpdate();
		pstmt.close();
		return result;
	}

}
