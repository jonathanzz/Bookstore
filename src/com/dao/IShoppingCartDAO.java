package com.dao;

import java.util.List;

import com.vo.ShoppingCart;

public interface IShoppingCartDAO {
	public boolean doCreate(ShoppingCart shoppingCart) throws Exception;
	public List<ShoppingCart> findAllByUserName(String username) throws Exception;
	public int findCount(String username, String book) throws Exception;
	public void deleteItem(String username, String book) throws Exception;
	public int updateCartInf(ShoppingCart shoppoingcart) throws Exception;
	public void deleteAllbyUserName(String username) throws Exception;
}
