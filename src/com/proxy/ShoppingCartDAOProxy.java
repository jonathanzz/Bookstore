package com.proxy;

import java.util.List;

import com.dao.IShoppingCartDAO;
import com.dbc.DatabaseConnection;
import com.impl.ShoppingCartDAOImpl;
import com.vo.ShoppingCart;

public class ShoppingCartDAOProxy implements IShoppingCartDAO {
	private DatabaseConnection dbc = null;
	private IShoppingCartDAO dao = null;

	public ShoppingCartDAOProxy() throws Exception {
		this.dbc = new DatabaseConnection();
		this.dao = new ShoppingCartDAOImpl(this.dbc.getConnection());
	}

	public boolean doCreate(ShoppingCart shoppingCart) throws Exception {
		boolean flag = false;
		try {
			flag = this.dao.doCreate(shoppingCart);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return flag;
	}

	public List<ShoppingCart> findAllByUserName(String username)
			throws Exception {
		List<ShoppingCart> all = null;
		try {
			all = this.dao.findAllByUserName(username);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return all;
	}

	public int findCount(String username, String book) throws Exception {
		int Count = 0;
		try {
			Count = this.dao.findCount(username, book);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return Count;
	}

	public void deleteItem(String username, String book) throws Exception {
		try {
			this.dao.deleteItem(username, book);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
	}

	public int updateCartInf(ShoppingCart shoppoingcart) throws Exception {
		int Count = 0;
		try {
			Count = this.dao.updateCartInf(shoppoingcart);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return Count;
	}

	public void deleteAllbyUserName(String username) throws Exception {
		try {
			this.dao.deleteAllbyUserName(username);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
	}
}
