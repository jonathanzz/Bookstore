package com.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dao.IUserDAO;
import com.vo.User;

public class UserDAOImpl implements IUserDAO{
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	public UserDAOImpl(Connection conn){
		this.conn = conn;
	}
	@Override
	public boolean doCreate(User user) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		String sql = "INSERT INTO user(username,password,nickname,firstName,lastName,email,birth,address,cardNum,isconfirm) VALUES(?,?,?,?,?,?,?,?,?,?)";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, user.getUsername());
		this.pstmt.setString(2, user.getPassword());
		this.pstmt.setString(3, user.getNickname());
		this.pstmt.setString(4, user.getFirstName());
		this.pstmt.setString(5, user.getLastName());
		this.pstmt.setString(6, user.getEmail());
		this.pstmt.setString(7, user.getBirth());   //confused
		this.pstmt.setString(8, user.getAddress());
		this.pstmt.setString(9, user.getCardNum());
		this.pstmt.setBoolean(10, user.isConfirm());
		if(this.pstmt.executeUpdate() > 0){
			flag = true;
		}
		this.pstmt.close();
		return flag;
	}
	@Override
	public List<User> findAll(String KeyWord) throws Exception {
		// TODO Auto-generated method stub
		List<User> all = new ArrayList<User>();
		String sql = "SELECT username,password,nickname,firstName,lastName,email,birth,address,cardNum isconfirm FROM user WHERE username LIKE ?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, "%" + KeyWord + "%");
		ResultSet rs = this.pstmt.executeQuery();
		User user = null;
		while(rs.next()){
			user = new User();
			user.setUsername(rs.getString(1));
			user.setPassword(rs.getString(2));
			user.setNickname(rs.getString(3));
			user.setFirstName(rs.getString(4));
			user.setLastName(rs.getString(5));
			user.setEmail(rs.getString(6));
			user.setBirth(rs.getString(7));
			user.setAddress(rs.getString(8));
			user.setCardNum(rs.getString(9));
			user.setConfirm(rs.getBoolean(10));
		}
		return all;
	}
	public User findByUserName(String username) throws Exception{
		User user = null ;
		String sql = "SELECT username,password,nickname,firstName,lastName,email,birth,address,cardNum,isconfirm FROM user WHERE username=?" ;
		this.pstmt = this.conn.prepareStatement(sql) ;
		this.pstmt.setString(1,username) ;
		ResultSet rs = this.pstmt.executeQuery() ;
		if(rs.next()){
			user = new User() ;
			user.setUsername(rs.getString(1));
			user.setPassword(rs.getString(2));
			user.setNickname(rs.getString(3));
			user.setFirstName(rs.getString(4));
			user.setLastName(rs.getString(5));
			user.setEmail(rs.getString(6));
			user.setBirth(rs.getString(7));
			user.setAddress(rs.getString(8));
			user.setCardNum(rs.getString(9));
			user.setConfirm(rs.getBoolean(10));
		}
		this.pstmt.close() ;
		return user ;
	}
	
	public User findByEmail(String email) throws Exception{
		User user = null ;
		String sql = "SELECT username,password,nickname,firstName,lastName,email,birth,address,cardNum,isconfirm FROM user WHERE email=?" ;
		this.pstmt = this.conn.prepareStatement(sql) ;
		this.pstmt.setString(1,email) ;
		ResultSet rs = this.pstmt.executeQuery() ;
		if(rs.next()){
			user = new User() ;
			user.setUsername(rs.getString(1));
			user.setPassword(rs.getString(2));
			user.setNickname(rs.getString(3));
			user.setFirstName(rs.getString(4));
			user.setLastName(rs.getString(5));
			user.setEmail(rs.getString(6));
			user.setBirth(rs.getString(7));
			user.setAddress(rs.getString(8));
			user.setCardNum(rs.getString(9));
			user.setConfirm(rs.getBoolean(10));
		}
		this.pstmt.close() ;
		return user ;
	}
	@Override
	public void deleteByUserName(String username) throws Exception {
		// TODO Auto-generated method stub
		String sql = "DELETE FROM user WHERE username= ?" ;
		this.pstmt = this.conn.prepareStatement(sql) ;
		this.pstmt.setString(1,username) ;
		this.pstmt.executeUpdate() ;
		this.pstmt.close() ;
	}
	
	public boolean findIsConfirm(String username) throws Exception{
		String sql = "SELECT isConfirm FROM user WHERE username= ?";
		this.pstmt = this.conn.prepareStatement(sql) ;
		this.pstmt.setString(1,username) ;
		ResultSet rs = this.pstmt.executeQuery() ;
		boolean flag;
		flag = rs.first();
		this.pstmt.close() ;
		return flag;
	}
	
	 public int updateInf(User user) throws Exception{
		 int result = 0;
		 String sql = "update user set password=?,nickname=?,firstName=?,lastName=?,email=?,birth=?,address=?,cardNum=?,isconfirm=? where username = ?";
		 pstmt=this.conn.prepareStatement(sql);
		 pstmt.setString(10, user.getUsername());
		 pstmt.setString(1, user.getPassword());
		 pstmt.setString(2, user.getNickname());
		 pstmt.setString(3, user.getFirstName());
		 pstmt.setString(4, user.getLastName());
		 pstmt.setString(5, user.getEmail());
		 pstmt.setString(6, user.getBirth());
		 pstmt.setString(7, user.getAddress());
		 pstmt.setString(8, user.getCardNum());
		 pstmt.setBoolean(9, user.isConfirm());
		 result = pstmt.executeUpdate();
		 pstmt.close();
		 return result;
	 }
	 
	 public List<String> getAllCostumers() throws Exception {
			List<String> customers = new ArrayList<String>();
			String sql = "SELECT DISTINCT username from user";
			this.pstmt = this.conn.prepareStatement(sql);
			ResultSet rs = this.pstmt.executeQuery();
			while (rs.next()) {
				String m = null;
				m = rs.getString(1);
				customers.add(m);
			}
			this.pstmt.close();
			return customers;
		}

	
}
