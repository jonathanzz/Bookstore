package com.vo;
import java.io.Serializable;
public class Books implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String title;
	private String author;
	private String pubtype;
	private String bookkey;
	private String seller;
	private double price;
	private String img;
	private String venues;
	private String year;
	private String uploadDate;
	private Boolean isSeller;
	private Boolean isPause;
	private  int amount;
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPubtype() {
		return pubtype;
	}
	public void setPubtype(String pubtype) {
		this.pubtype = pubtype;
	}
	public String getBookkey() {
		return bookkey;
	}
	public void setBookkey(String bookkey) {
		this.bookkey = bookkey;
	}
	public String getSeller() {
		return seller;
	}
	public void setSeller(String seller) {
		this.seller = seller;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double i) {
		this.price = i;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getVenues() {
		return venues;
	}
	public void setVenues(String venues) {
		this.venues = venues;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}
	public Boolean getIsSeller() {
		return isSeller;
	}
	public void setIsSeller(Boolean isSeller) {
		this.isSeller = isSeller;
	}
	public Boolean getIsPause() {
		return isPause;
	}
	public void setIsPause(Boolean isPause) {
		this.isPause = isPause;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
}
