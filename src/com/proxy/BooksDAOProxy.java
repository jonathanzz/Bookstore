package com.proxy;

import java.util.List;

import com.dao.IBooksDAO;
import com.dbc.DatabaseConnection;
import com.impl.BooksDAOImpl;
import com.vo.Books;

public class BooksDAOProxy implements IBooksDAO {
	private DatabaseConnection dbc = null;
	private IBooksDAO dao = null;

	public BooksDAOProxy() throws Exception {
		this.dbc = new DatabaseConnection();
		this.dao = new BooksDAOImpl(this.dbc.getConnection());
	}

	public boolean doCreate(Books books) throws Exception {
		boolean flag = false;
		try {
			flag = this.dao.doCreate(books);

		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return flag;
	}

	@Override
	public List<Books> findByOneArgs(String a, String v) throws Exception {
		List<Books> all = null;
		try {
			all = this.dao.findByOneArgs(a, v);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return all;
	}

	@Override
	public List<Books> findByTwoArgs(String a1, String v1, String a2, String v2)
			throws Exception {
		List<Books> all = null;
		try {
			all = this.dao.findByTwoArgs(a1, v1, a2, v2);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return all;
	}

	public List<Books> findByThreeArgs(String a1, String v1, String a2,
			String v2, String a3, String v3) throws Exception {
		List<Books> all = null;
		try {
			all = this.dao.findByThreeArgs(a1, v1, a2, v2, a3, v3);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return all;
	}

	public List<Books> findByFourArgs(String a1, String v1, String a2,
			String v2, String a3, String v3, String a4, String v4)
			throws Exception {
		List<Books> all = null;
		try {
			all = this.dao.findByFourArgs(a1, v1, a2, v2, a3, v3, a4, v4);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return all;
	}

	public List<Books> findByFiveArgs(String a1, String v1, String a2,
			String v2, String a3, String v3, String a4, String v4, String a5,
			String v5) throws Exception {
		List<Books> all = null;
		try {
			all = this.dao.findByFiveArgs(a1, v1, a2, v2, a3, v3, a4, v4, a5,
					v5);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return all;
	}

	public List<Books> findBySixArgs(String a1, String v1, String a2,
			String v2, String a3, String v3, String a4, String v4, String a5,
			String v5, String a6, String v6) throws Exception {
		List<Books> all = null;
		try {
			all = this.dao.findBySixArgs(a1, v1, a2, v2, a3, v3, a4, v4, a5,
					v5, a6, v6);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return all;
	}

	public List<Books> findByPrice(double a, double b) throws Exception {
		List<Books> all = null;
		try {
			all = this.dao.findByPrice(a, b);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return all;
	}

	public List<String> getSellers() throws Exception {
		List<String> sellers = null;
		try {
			sellers = this.dao.getSellers();
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return sellers;
	}

	public void deleteBook(String bookkey) throws Exception {
		try {
			this.dao.deleteBook(bookkey);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
	}

	public List<Books> getTenRandomBooks() throws Exception {
		List<Books> all = null;
		try {
			all = this.dao.getTenRandomBooks();
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return all;
	}
	
	public Books findByBookkey(String bookkey) throws Exception{
		Books book = new Books();
		try {
			book = this.dao.findByBookkey(bookkey);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return book;
	}
	
	public int updateBook(Books book) throws Exception{
		int result;
		try {
			result = this.dao.updateBook(book);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return result;
	}

}
