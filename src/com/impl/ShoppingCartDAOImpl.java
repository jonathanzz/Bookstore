package com.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dao.IShoppingCartDAO;
import com.factory.DAOFactory;
import com.util.DateUtil;
import com.vo.MonitorTable;
import com.vo.ShoppingCart;

public class ShoppingCartDAOImpl implements IShoppingCartDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;

	public ShoppingCartDAOImpl(Connection conn) {
		this.conn = conn;
	}

	@Override
	public boolean doCreate(ShoppingCart shoppingCart) throws Exception {
		boolean flag = false;
		String sql = "INSERT INTO shoppingCart(username,book,count) VALUES(?,?,?)";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, shoppingCart.getUsername());
		this.pstmt.setString(2, shoppingCart.getBook());
		this.pstmt.setInt(3, shoppingCart.getCount());
		if (this.pstmt.executeUpdate() > 0) {
			flag = true;
		}
		this.pstmt.close();
		MonitorTable monitor = new MonitorTable();
		monitor.setBought(false);
		monitor.setRemoved(false);
		monitor.setAdded(true);
		monitor.setBook(shoppingCart.getBook());
		monitor.setUsername(shoppingCart.getUsername());
		monitor.setProcessdate(DateUtil.getCurrentDate());
		DAOFactory.getIMonDAOInstance().doCreate(monitor);
		return flag;
	}

	@Override
	public List<ShoppingCart> findAllByUserName(String username)
			throws Exception {
		// TODO Auto-generated method stub
		List<ShoppingCart> all = new ArrayList<ShoppingCart>();
		String sql = "SELECT username,book,count FROM shoppingCart WHERE username LIKE ?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, "%" + username + "%");
		ResultSet rs = this.pstmt.executeQuery();
		ShoppingCart shoppingCart = null;
		while (rs.next()) {
			shoppingCart = new ShoppingCart();
			shoppingCart.setUsername(rs.getString(1));
			shoppingCart.setBook(rs.getString(2));
			shoppingCart.setCount(rs.getInt(3));
			all.add(shoppingCart);
		}
		return all;
	}

	public int findCount(String username, String book) throws Exception {
		int Count = 0;
		String sql = "SELECT count FROM shoppingCart WHERE username=? AND book =?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, username);
		this.pstmt.setString(2, book);
		ResultSet rs = this.pstmt.executeQuery();
		if (rs.next()) {
			Count = rs.getInt(1);
		}
		return Count;
	}

	@Override
	public void deleteItem(String username, String book) throws Exception {
		String sql = "DELETE FROM shoppingCart WHERE username= ? AND book =?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, username);
		this.pstmt.setString(2, book);
		this.pstmt.executeUpdate();
		this.pstmt.close();
		MonitorTable monitor = new MonitorTable();
		monitor.setBought(false);
		monitor.setRemoved(true);
		monitor.setAdded(false);
		monitor.setBook(book);
		monitor.setUsername(username);
		monitor.setProcessdate(DateUtil.getCurrentDate());
		DAOFactory.getIMonDAOInstance().doCreate(monitor);
	}

	public int updateCartInf(ShoppingCart shoppoingcart) throws Exception {
		int result;
		String sql = "update shoppingCart set count =? where username =? and book =?";
		pstmt = this.conn.prepareStatement(sql);
		pstmt.setInt(1, shoppoingcart.getCount());
		pstmt.setString(2, shoppoingcart.getUsername());
		pstmt.setString(3, shoppoingcart.getBook());
		result = pstmt.executeUpdate();
		pstmt.close();
		return result;
	}

	public void deleteAllbyUserName(String username) throws Exception {
		List<ShoppingCart> all = findAllByUserName(username);
		ShoppingCart sc = null;
		for (int i = all.size() - 1; i >= 0; i--) {
			sc = all.get(i);
			deleteItem(username, sc.getBook());
		}
	}
}
