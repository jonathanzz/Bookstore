package com.vo;

import java.io.Serializable;


public class MonitorTable implements Serializable {
	
	private static final long serialVersionUID = 1L;
	private String username;
	private String book;
	private String processdate;
	private boolean added;
	private boolean removed;
	private boolean bought;
	
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
	public String getProcessdate() {
		return processdate;
	}
	public void setProcessdate(String processdate) {
		this.processdate = processdate;
	}
	public boolean isAdded() {
		return added;
	}
	public void setAdded(boolean added) {
		this.added = added;
	}
	public boolean isRemoved() {
		return removed;
	}
	public void setRemoved(boolean removed) {
		this.removed = removed;
	}
	public boolean isBought() {
		return bought;
	}
	public void setBought(boolean bought) {
		this.bought = bought;
	}
}
