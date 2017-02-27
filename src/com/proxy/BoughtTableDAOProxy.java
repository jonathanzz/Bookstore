package com.proxy;

import java.util.List;

import com.dao.IBoughtTableDAO;
import com.dbc.DatabaseConnection;
import com.impl.BoughtTableDAOImpl;
import com.vo.BoughtTable;

public class BoughtTableDAOProxy implements IBoughtTableDAO {
	private DatabaseConnection dbc = null;
	private IBoughtTableDAO dao = null;

	public BoughtTableDAOProxy() throws Exception {
		this.dbc = new DatabaseConnection();
		this.dao = new BoughtTableDAOImpl(this.dbc.getConnection());
	}

	public boolean doCreate(BoughtTable boughtTable) throws Exception {
		boolean flag = false;
		try {
				flag = this.dao.doCreate(boughtTable);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return flag;
	}

	public List<BoughtTable> findAll(String keyWord) throws Exception {
		List<BoughtTable> all = null;
		try {
			all = this.dao.findAll(keyWord);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return all;
	}

	

	public BoughtTable findBoughtInf(String username, String book)
			throws Exception {
		BoughtTable boughtTable = null;
		try {
			boughtTable = this.dao.findBoughtInf(username, book);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return boughtTable;
	}

	public int updateBoughtInf(BoughtTable boughtIteam) throws Exception {
		int Count = 0;
		try {
			Count = this.dao.updateBoughtInf(boughtIteam);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return Count;
	}
}
