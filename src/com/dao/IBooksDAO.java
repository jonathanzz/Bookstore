package com.dao;

import java.util.List;

import com.vo.Books;

public interface IBooksDAO {

	public boolean doCreate(Books books) throws Exception;
	public List<Books> findByOneArgs(String a, String v) throws Exception;
	public List<Books> findByTwoArgs(String a1, String v1, String a2, String v2)
			throws Exception;
	public List<Books> findByThreeArgs(String a1, String v1, String a2, String v2,
			String a3, String v3) throws Exception;
	public List<Books> findByFourArgs(String a1, String v1, String a2, String v2,
			String a3, String v3, String a4, String v4) throws Exception;
	public List<Books> findByFiveArgs(String a1, String v1, String a2, String v2,
			String a3, String v3, String a4, String v4, String a5, String v5) throws Exception;
	public List<Books> findBySixArgs(String a1, String v1, String a2, String v2,
			String a3, String v3, String a4, String v4, String a5, String v5,
			String a6, String v6) throws Exception;
	public List<Books> findByPrice(double a, double b) throws Exception;
	public List<String> getSellers() throws Exception;
	public void deleteBook(String bookkey) throws Exception;
	public List<Books> getTenRandomBooks() throws Exception;
	public Books findByBookkey(String bookkey) throws Exception;
	public int updateBook(Books book) throws Exception;

}
