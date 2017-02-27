package com.vo;

import java.io.Serializable;

public class ShoppingCart implements Serializable {
	
	private static final long serialVersionUID = 1L;

	private String username;
	private String book;
	private int count;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getBook() {
		return book;
	}
	public void setBook(String book) {
		this.book = book;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
}
