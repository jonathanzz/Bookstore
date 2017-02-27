package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.factory.DAOFactory;
import com.util.DateUtil;
import com.util.EmailUtil;
import com.util.UploadUtil;
import com.vo.Books;

/**
 * Servlet implementation class SellServlet
 */
public class SellServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String page;
	private String action;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SellServlet() {
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
		page = "onsell.jsp";
		action = request.getParameter("sell");
		String seller = (String) request.getSession().getAttribute("username");
		try {
			if (action == null) {
				String bookkey = (String) request.getSession().getAttribute(
						"addbook");
				Books book = DAOFactory.getIBooksDAOInstance().findByBookkey(
						bookkey);
				UploadUtil.uploadFile(request, response, bookkey);
				book.setImg("assets/images/bookimg/"
						+ bookkey + ".jpg");
				book.setUploadDate(DateUtil.getCurrentDate());
				DAOFactory.getIBooksDAOInstance().updateBook(book);
			} else if ("add".equals(action)) {
				String title = request.getParameter("title");
				String author = request.getParameter("author");
				String pubtype = request.getParameter("pubtype");
				String bookkey = request.getParameter("bookkey");
				String price = request.getParameter("price");
				String venues = request.getParameter("venues");
				int amount = Integer.parseInt(request.getParameter("amount"));
				if (title == "" || bookkey == "" || price == "") {
					request.setAttribute("status",
							"The marked information can't be empty");
					page = "addBook.jsp";
				} else if (DAOFactory.getIBooksDAOInstance().findByBookkey(
						bookkey) != null) {
					request.setAttribute("status", "This book key is existed!");
					page = "addBook.jsp";
				} else {
					Books book = new Books();
					book.setTitle(title);
					book.setPrice(Double.parseDouble(price));
					book.setBookkey(bookkey);
					book.setSeller(seller);
					book.setAmount(amount);
					book.setIsSeller(true);
					book.setIsPause(false);
					if (author != "")
						book.setAuthor(author);
					if (pubtype != "")
						book.setPubtype(pubtype);
					if (venues != "")
						book.setVenues(venues);
					DAOFactory.getIBooksDAOInstance().doCreate(book);
					request.getSession().setAttribute("addbook", bookkey);
					page = "upload.jsp";
				 //   EmailUtil.adminMail(seller, bookkey);
				}
			} else if ("Remove".equals(action)) {
				String bookkey = request.getParameter("key");
				DAOFactory.getIBooksDAOInstance().deleteBook(bookkey);
			} else if ("Pause".equals(action) || "OnSale".equals(action)) {
				String bookkey = request.getParameter("key");
				Books book = DAOFactory.getIBooksDAOInstance().findByBookkey(
						bookkey);
				if (!book.getIsPause())
					book.setIsPause(true);
				else
					book.setIsPause(false);
				DAOFactory.getIBooksDAOInstance().updateBook(book);
			} else if ("Save".equals(action)) {
				String title = request.getParameter("title");
				String author = request.getParameter("author");
				String pubtype = request.getParameter("pubtype");
				String bookkey = request.getParameter("key");
				String price = request.getParameter("price");
				String venues = request.getParameter("venues");
				String amount = request.getParameter("amount");
				Books book = DAOFactory.getIBooksDAOInstance().findByBookkey(
						bookkey);
				if (amount != "")
					book.setAmount(Integer.parseInt(amount));
				if (title != "")
					book.setTitle(title);
				if (price != "")
					book.setPrice(Double.parseDouble(price));
				if (author != "")
					book.setAuthor(author);
				if (pubtype != "")
					book.setPubtype(pubtype);
				if (venues != "")
					book.setVenues(venues);
				DAOFactory.getIBooksDAOInstance().updateBook(book);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("/" + page);
		rd.forward(request, response);
	}
}
