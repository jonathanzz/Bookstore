package com.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.dao.IAdminDAO;
import com.vo.Admin;

public class AdminDAOImpl implements IAdminDAO{
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	public AdminDAOImpl(Connection conn){
		this.conn = conn;
	}
	
	public Admin findByAdminName(String adminName) throws Exception{
		Admin admin = null ;
		String sql = "SELECT adminName,password FROM admin WHERE adminName=?" ;
		this.pstmt = this.conn.prepareStatement(sql) ;
		this.pstmt.setString(1,adminName) ;
		ResultSet rs = this.pstmt.executeQuery() ;
		if(rs.next()){
			admin = new Admin() ;
			admin.setAdminName(rs.getString(1));
			admin.setPassword(rs.getString(2));
		}
		this.pstmt.close() ;
		return admin ;
	}
	
	
	 public int updateAdminInf(Admin admin) throws Exception{
		 int result = 0;
		 String sql = "update admin set password=? where adminName = ?";
		 pstmt=this.conn.prepareStatement(sql);
		 pstmt.setString(2, admin.getAdminName());
		 pstmt.setString(1, admin.getPassword());
		 result = pstmt.executeUpdate();
		 pstmt.close();
		 return result;
	 }

}
