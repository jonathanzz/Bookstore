package com.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dao.IBooksDAO;
import com.vo.Books;

public class BooksDAOImpl implements IBooksDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;

	public BooksDAOImpl(Connection conn) {
		this.conn = conn;
	}

	@Override
	public boolean doCreate(Books books) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		String sql = "INSERT INTO books(title,author,pubtype,bookkey,seller,price,img,venues,year,uploadDate,isSeller,isPause,amount) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, books.getTitle());
		this.pstmt.setString(2, books.getAuthor());
		this.pstmt.setString(3, books.getPubtype());
		this.pstmt.setString(4, books.getBookkey());
		this.pstmt.setString(5, books.getSeller());
		this.pstmt.setDouble(6, books.getPrice());
		this.pstmt.setString(7, books.getImg());
		this.pstmt.setString(8, books.getVenues());
		this.pstmt.setString(9, books.getYear());
		this.pstmt.setString(10, books.getUploadDate());
		this.pstmt.setBoolean(11, books.getIsSeller());
		this.pstmt.setBoolean(12, books.getIsPause());
		this.pstmt.setInt(13, books.getAmount());
		if (this.pstmt.executeUpdate() > 0) {
			flag = true;
		}
		this.pstmt.close();
		return flag;
	}

	@Override
	public List<Books> findByOneArgs(String a, String v) throws Exception {
		List<Books> all = new ArrayList<Books>();
		String sql = "SELECT * FROM books WHERE " + a + " LIKE ?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, "%" + v + "%");
		ResultSet rs = this.pstmt.executeQuery();
		Books books = null;
		while (rs.next()) {
			books = new Books();
			books.setTitle(rs.getString(1));
			books.setAuthor(rs.getString(2));
			books.setPubtype(rs.getString(3));
			books.setBookkey(rs.getString(4));
			books.setSeller(rs.getString(5));
			books.setPrice(rs.getDouble(6));
			books.setImg(rs.getString(7));
			books.setVenues(rs.getString(8));
			books.setYear(rs.getString(9));
			books.setUploadDate(rs.getString(10));
			books.setIsSeller(rs.getBoolean(11));
			books.setIsPause(rs.getBoolean(12));
			books.setAmount(rs.getInt(13));
			all.add(books);
		}
		this.pstmt.close();
		return all;
	}

	public List<Books> findByTwoArgs(String a1, String v1, String a2, String v2)
			throws Exception {
		List<Books> all = new ArrayList<Books>();
		String sql = "SELECT * FROM books WHERE " + a1 + " LIKE ? AND " + a2
				+ " LIKE ?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, "%" + v1 + "%");
		this.pstmt.setString(2, "%" + v2 + "%");
		ResultSet rs = this.pstmt.executeQuery();
		Books books = null;
		while (rs.next()) {
			books = new Books();
			books.setTitle(rs.getString(1));
			books.setAuthor(rs.getString(2));
			books.setPubtype(rs.getString(3));
			books.setBookkey(rs.getString(4));
			books.setSeller(rs.getString(5));
			books.setPrice(rs.getDouble(6));
			books.setImg(rs.getString(7));
			books.setVenues(rs.getString(8));
			books.setYear(rs.getString(9));
			books.setUploadDate(rs.getString(10));
			books.setIsSeller(rs.getBoolean(11));
			books.setIsPause(rs.getBoolean(12));
			books.setAmount(rs.getInt(13));
			all.add(books);
		}
		this.pstmt.close();
		return all;
	}

	public List<Books> findByThreeArgs(String a1, String v1, String a2,
			String v2, String a3, String v3) throws Exception {
		List<Books> all = new ArrayList<Books>();
		String sql = "SELECT * FROM books WHERE " + a1 + " LIKE ? AND " + a2
				+ " LIKE ? AND " + a3 + " LIKE ?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, "%" + v1 + "%");
		this.pstmt.setString(2, "%" + v2 + "%");
		this.pstmt.setString(3, "%" + v3 + "%");
		ResultSet rs = this.pstmt.executeQuery();
		Books books = null;
		while (rs.next()) {
			books = new Books();
			books.setTitle(rs.getString(1));
			books.setAuthor(rs.getString(2));
			books.setPubtype(rs.getString(3));
			books.setBookkey(rs.getString(4));
			books.setSeller(rs.getString(5));
			books.setPrice(rs.getDouble(6));
			books.setImg(rs.getString(7));
			books.setVenues(rs.getString(8));
			books.setYear(rs.getString(9));
			books.setUploadDate(rs.getString(10));
			books.setIsSeller(rs.getBoolean(11));
			books.setIsPause(rs.getBoolean(12));
			books.setAmount(rs.getInt(13));
			all.add(books);
		}
		this.pstmt.close();
		return all;
	}

	public List<Books> findByFourArgs(String a1, String v1, String a2,
			String v2, String a3, String v3, String a4, String v4)
			throws Exception {
		List<Books> all = new ArrayList<Books>();
		String sql = "SELECT * FROM books WHERE " + a1 + " LIKE ? AND " + a2
				+ " LIKE ? AND " + a3 + " LIKE ? AND " + a4 + " LIKE ?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, "%" + v1 + "%");
		this.pstmt.setString(2, "%" + v2 + "%");
		this.pstmt.setString(3, "%" + v3 + "%");
		this.pstmt.setString(4, "%" + v4 + "%");
		ResultSet rs = this.pstmt.executeQuery();
		Books books = null;
		while (rs.next()) {
			books = new Books();
			books.setTitle(rs.getString(1));
			books.setAuthor(rs.getString(2));
			books.setPubtype(rs.getString(3));
			books.setBookkey(rs.getString(4));
			books.setSeller(rs.getString(5));
			books.setPrice(rs.getDouble(6));
			books.setImg(rs.getString(7));
			books.setVenues(rs.getString(8));
			books.setYear(rs.getString(9));
			books.setUploadDate(rs.getString(10));
			books.setIsSeller(rs.getBoolean(11));
			books.setIsPause(rs.getBoolean(12));
			books.setAmount(rs.getInt(13));
			all.add(books);
		}
		this.pstmt.close();
		return all;
	}

	@Override
	public List<Books> findByFiveArgs(String a1, String v1, String a2,
			String v2, String a3, String v3, String a4, String v4, String a5,
			String v5) throws Exception {
		List<Books> all = new ArrayList<Books>();
		String sql = "SELECT * FROM books WHERE " + a1 + " LIKE ? AND " + a2
				+ " LIKE ? AND " + a3 + " LIKE ? AND " + a4 + " LIKE ? AND "
				+ a5 + " LIKE ?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, "%" + v1 + "%");
		this.pstmt.setString(2, "%" + v2 + "%");
		this.pstmt.setString(3, "%" + v3 + "%");
		this.pstmt.setString(4, "%" + v4 + "%");
		this.pstmt.setString(5, "%" + v5 + "%");
		ResultSet rs = this.pstmt.executeQuery();
		Books books = null;
		while (rs.next()) {
			books = new Books();
			books.setTitle(rs.getString(1));
			books.setAuthor(rs.getString(2));
			books.setPubtype(rs.getString(3));
			books.setBookkey(rs.getString(4));
			books.setSeller(rs.getString(5));
			books.setPrice(rs.getDouble(6));
			books.setImg(rs.getString(7));
			books.setVenues(rs.getString(8));
			books.setYear(rs.getString(9));
			books.setUploadDate(rs.getString(10));
			books.setIsSeller(rs.getBoolean(11));
			books.setIsPause(rs.getBoolean(12));
			books.setAmount(rs.getInt(13));
			all.add(books);
		}
		this.pstmt.close();
		return all;
	}

	@Override
	public List<Books> findBySixArgs(String a1, String v1, String a2,
			String v2, String a3, String v3, String a4, String v4, String a5,
			String v5, String a6, String v6) throws Exception {
		List<Books> all = new ArrayList<Books>();
		String sql = "SELECT * FROM books WHERE " + a1 + " LIKE ? AND " + a2
				+ " LIKE ? AND " + a3 + " LIKE ? AND " + a4 + " LIKE ? AND "
				+ a5 + " LIKE ? AND " + a6 + " LIKE ?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, "%" + v1 + "%");
		this.pstmt.setString(2, "%" + v2 + "%");
		this.pstmt.setString(3, "%" + v3 + "%");
		this.pstmt.setString(4, "%" + v4 + "%");
		this.pstmt.setString(5, "%" + v5 + "%");
		this.pstmt.setString(6, "%" + v6 + "%");
		ResultSet rs = this.pstmt.executeQuery();
		Books books = null;
		while (rs.next()) {
			books = new Books();
			books.setTitle(rs.getString(1));
			books.setAuthor(rs.getString(2));
			books.setPubtype(rs.getString(3));
			books.setBookkey(rs.getString(4));
			books.setSeller(rs.getString(5));
			books.setPrice(rs.getDouble(6));
			books.setImg(rs.getString(7));
			books.setVenues(rs.getString(8));
			books.setYear(rs.getString(9));
			books.setUploadDate(rs.getString(10));
			books.setIsSeller(rs.getBoolean(11));
			books.setIsPause(rs.getBoolean(12));
			books.setAmount(rs.getInt(13));
			all.add(books);
		}
		this.pstmt.close();
		return all;
	}

	@Override
	public List<Books> findByPrice(double a, double b) throws Exception {
		List<Books> all = new ArrayList<Books>();
		String sql = "SELECT * FROM books WHERE price between ? and ?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setDouble(1, a);
		this.pstmt.setDouble(2, b);
		ResultSet rs = this.pstmt.executeQuery();
		Books books = null;
		while (rs.next()) {
			books = new Books();
			books.setTitle(rs.getString(1));
			books.setAuthor(rs.getString(2));
			books.setPubtype(rs.getString(3));
			books.setBookkey(rs.getString(4));
			books.setSeller(rs.getString(5));
			books.setPrice(rs.getDouble(6));
			books.setImg(rs.getString(7));
			books.setVenues(rs.getString(8));
			books.setYear(rs.getString(9));
			books.setUploadDate(rs.getString(10));
			books.setIsSeller(rs.getBoolean(11));
			books.setIsPause(rs.getBoolean(12));
			books.setAmount(rs.getInt(13));
			all.add(books);
		}
		this.pstmt.close();
		return all;
	}

	public List<String> getSellers() throws Exception {
		List<String> sellers = new ArrayList<String>();
		String sql = "SELECT DISTINCT seller from books WHERE seller != '' and seller is not null ";
		this.pstmt = this.conn.prepareStatement(sql);
		ResultSet rs = this.pstmt.executeQuery();
		while (rs.next()) {
			String m = null;
			m = rs.getString(1);
			sellers.add(m);
		}
		this.pstmt.close();
		return sellers;
	}

	public void deleteBook(String bookkey) throws Exception {
		String sql = "DELETE FROM books WHERE bookkey = ?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, bookkey);
		this.pstmt.executeUpdate();
		this.pstmt.close();
	}

	public List<Books> getTenRandomBooks() throws Exception {
		List<Books> all = new ArrayList<Books>();
		Books books = null;
		String sql = "SELECT * FROM books ORDER BY RAND() LIMIT 12";
		this.pstmt = this.conn.prepareStatement(sql);
		ResultSet rs = this.pstmt.executeQuery();
		while (rs.next()) {
			books = new Books();
			books.setTitle(rs.getString(1));
			books.setAuthor(rs.getString(2));
			books.setPubtype(rs.getString(3));
			books.setBookkey(rs.getString(4));
			books.setSeller(rs.getString(5));
			books.setPrice(rs.getDouble(6));
			books.setImg(rs.getString(7));
			books.setVenues(rs.getString(8));
			books.setYear(rs.getString(9));
			books.setUploadDate(rs.getString(10));
			books.setIsSeller(rs.getBoolean(11));
			books.setIsPause(rs.getBoolean(12));
			books.setAmount(rs.getInt(13));
			all.add(books);
		}
		this.pstmt.close();
		return all;
	}

	public Books findByBookkey(String bookkey) throws Exception{
		Books books = null;
		String sql = "SELECT * FROM books WHERE bookkey = ?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, bookkey);
		ResultSet rs = this.pstmt.executeQuery();
		if (rs.next()) {
			books = new Books();
			books.setTitle(rs.getString(1));
			books.setAuthor(rs.getString(2));
			books.setPubtype(rs.getString(3));
			books.setBookkey(rs.getString(4));
			books.setSeller(rs.getString(5));
			books.setPrice(rs.getDouble(6));
			books.setImg(rs.getString(7));
			books.setVenues(rs.getString(8));
			books.setYear(rs.getString(9));
			books.setUploadDate(rs.getString(10));
			books.setIsSeller(rs.getBoolean(11));
			books.setIsPause(rs.getBoolean(12));
			books.setAmount(rs.getInt(13));
		}
		this.pstmt.close();
		return books;
	}
	
	
	public int updateBook(Books book) throws Exception{
		int result;
		String sql = "update Books set title =?, author =?, pubtype =?, price =?,img=?, venues =?, isPause =?, amount =? where bookkey =?";
		pstmt = this.conn.prepareStatement(sql);
		pstmt.setString(1, book.getTitle());
		pstmt.setString(2, book.getAuthor());
		pstmt.setString(3, book.getPubtype());
		pstmt.setDouble(4, book.getPrice());
		pstmt.setString(5, book.getImg());
		pstmt.setString(6, book.getVenues());
		pstmt.setBoolean(7, book.getIsPause());
		pstmt.setInt(8,book.getAmount());
		pstmt.setString(9, book.getBookkey());
		result = pstmt.executeUpdate();
		pstmt.close();
		return result;
	}
	
}







