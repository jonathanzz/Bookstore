package com.dao;

import java.util.List;

import com.vo.BoughtTable;

public interface IBoughtTableDAO {
	public boolean doCreate(BoughtTable boughtTable) throws Exception;

	public List<BoughtTable> findAll(String KeyWord) throws Exception;

	public int updateBoughtInf(BoughtTable boughtIteam) throws Exception;

	public BoughtTable findBoughtInf(String username, String book) throws Exception;
}
