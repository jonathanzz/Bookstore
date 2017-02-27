package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.factory.DAOFactory;
import com.util.EmailUtil;
import com.vo.*;

/**
 * Servlet implementation class CartServlet
 */
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String page;
	private String action;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		page = "cart.jsp";
		action = request.getParameter("cart");
		String username = (String) request.getSession()
				.getAttribute("username");
		try {
			if ("delete".equals(action)) {
				String[] books = request.getParameterValues("items");
				if (books != null) {
					for (int i = books.length - 1; i >= 0; i--) {
						String text = books[i];
						String book = "";
						int f = 0;
						for (int j = 0; j < text.length(); j++) {
							if (text.charAt(j) != ' ') {
								if (f == 1)
									book += text.charAt(j);
							} else {
								f = 1;
							}
						}
						DAOFactory.getIShpcDAOInstance().deleteItem(username,
								book);
					}
				}
			} else if ("deleteall".equals(action)) {

				DAOFactory.getIShpcDAOInstance().deleteAllbyUserName(username);
			} else if ("buy".equals(action)) {
				String[] books = request.getParameterValues("items");
				if (books != null) {
					page = "myorder.jsp";
					for (int i = books.length - 1; i >= 0; i--) {
						String num = "";
						String text = books[i];

						String book = "";
						int f = 0;
						for (int j = 0; j < text.length(); j++) {
							if (text.charAt(j) != ' ') {
								if (f == 0)
									num += text.charAt(j);
								else
									book += text.charAt(j);
							} else {
								f = 1;
							}
						}
						int count = Integer.parseInt(request.getParameter("num"
								+ num));
						Books a = DAOFactory.getIBooksDAOInstance()
								.findByBookkey(book);
						if (count != 0 && count <= a.getAmount()) {
							a.setAmount(a.getAmount() - count);
							DAOFactory.getIBooksDAOInstance().updateBook(a);
							if (DAOFactory.getIBgtDAOInstance().findBoughtInf(
									username, book) == null) {
								BoughtTable bought = new BoughtTable();
								bought.setBook(book);
								bought.setUsername(username);
								bought.setCount(count);
								DAOFactory.getIBgtDAOInstance()
										.doCreate(bought);
							} else {
								BoughtTable bought = DAOFactory
										.getIBgtDAOInstance().findBoughtInf(
												username, book);
								bought.setCount(bought.getCount() + count);
								DAOFactory.getIBgtDAOInstance()
										.updateBoughtInf(bought);
							}

							Books b = DAOFactory.getIBooksDAOInstance()
									.findByBookkey(book);
							if (b.getSeller() != null) {
								User u = DAOFactory.getIUsrDAOInstance()
										.findByUserName(b.getSeller());
//								EmailUtil.selledMail(username, b.getSeller(),
//										u.getEmail(), b.getTitle());
							}
							DAOFactory.getIShpcDAOInstance().deleteItem(
									username, book);
						} else if (count > a.getAmount()) {
							String error = "Sorry, the book " + a.getTitle()
									+ " only have " + a.getAmount()
									+ " in our warehouse.";
							request.setAttribute("status", error);
							page = "cart.jsp";
							break;
						}
					}
				} else
					page = "cart.jsp";
			} else if ("Add to Cart".equals(action)) {
				if (username == null)
					page = "login.jsp";
				else {
					page = "cart.jsp";
					String bookkey = request.getParameter("bookkey");
					String c = request.getParameter("count");
					int count;
					if (c != null)
						count = Integer.parseInt(c);
					else
						count = 1;
					List<ShoppingCart> cart = DAOFactory.getIShpcDAOInstance()
							.findAllByUserName(username);
					if (DAOFactory.getIShpcDAOInstance().findCount(username,
							bookkey) != 0) {
						for (ShoppingCart sc : cart) {
							if (sc.getBook().equals(bookkey)) {
								sc.setCount(sc.getCount() + count);
								DAOFactory.getIShpcDAOInstance().updateCartInf(
										sc);
							}
						}
					} else {
						ShoppingCart sc = new ShoppingCart();
						sc.setBook(bookkey);
						sc.setUsername(username);
						sc.setCount(count);
						DAOFactory.getIShpcDAOInstance().doCreate(sc);
					}
				}
			} else if ("save".equals(action)) {
				List<ShoppingCart> cart = DAOFactory.getIShpcDAOInstance()
						.findAllByUserName(username);
				for (int i = 1; i <= cart.size(); i++) {
					String num = request.getParameter("num" + i);
					cart.get(i - 1).setCount(Integer.parseInt(num));
					DAOFactory.getIShpcDAOInstance().updateCartInf(
							cart.get(i - 1));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		RequestDispatcher rd = request.getRequestDispatcher("/" + page);
		rd.forward(request, response);
	}
}
