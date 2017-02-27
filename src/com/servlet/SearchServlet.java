package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.factory.DAOFactory;
import com.vo.Books;

/**
 * Servlet implementation class SearchServlet
 */
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String page;
	private String action;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchServlet() {
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
		page = "results.jsp";
		action = request.getParameter("search");
		List<Books> results = new ArrayList<Books>();
		try {
			if ("search".equals(action)) {
				String text = request.getParameter("text");
				String keyword = request.getParameter("keyword");

				if ("Authors".equals(keyword)) {
					results = DAOFactory.getIBooksDAOInstance().findByOneArgs(
							"author", text);
				} else if ("Title".equals(keyword)) {
					results = DAOFactory.getIBooksDAOInstance().findByOneArgs(
							"title", text);
				} else if ("Publication type".equals(keyword)) {
					results = DAOFactory.getIBooksDAOInstance().findByOneArgs(
							"pubtype", text);
				} else if ("Venues".equals(keyword)) {
					results = DAOFactory.getIBooksDAOInstance().findByOneArgs(
							"venues", text);
				}
			} else if ("adsearch".equals(action)) {
				List<String> input = new ArrayList<String>();
				String title = request.getParameter("title");
				if (!title.equals("")) {
					input.add("title");
					input.add(title);
				}
				String author = request.getParameter("author");
				if (!author.equals("")) {
					input.add("author");
					input.add(author);
				}
				String pubtype = request.getParameter("pubtype");
				if (!pubtype.equals("")) {
					input.add("pubtype");
					input.add(pubtype);
				}
				String venues = request.getParameter("venues");
				if (!venues.equals("")) {
					input.add("venues");
					input.add(venues);
				}
				String seller = request.getParameter("seller");
				if (!seller.equals("")) {
					input.add("seller");
					input.add(seller);
				}
				String year = request.getParameter("year");
				if (!year.equals("please select")) {
					input.add("year");
					input.add(year);
				}
				double from = 0, to = 99999;
				String fromprice = request.getParameter("fromprice");
				if (fromprice!="")
					from = Double.parseDouble(fromprice);
				String toprice = request.getParameter("toprice");
				if (toprice!="")
					to = Double.parseDouble(toprice);
				int length = input.size();
				if (length == 0) {
					if (from == 0 && to == 9999)
						request.setAttribute("status",
								"You must input something to search.");
					else
						results = DAOFactory.getIBooksDAOInstance()
								.findByPrice(from, to);
				} else if (length == 2){
					results = DAOFactory.getIBooksDAOInstance().findByOneArgs(
							input.get(0), input.get(1));
				}
				else if (length == 4)
					results = DAOFactory.getIBooksDAOInstance().findByTwoArgs(
							input.get(0), input.get(1), input.get(2),
							input.get(3));
				else if (length == 6)
					results = DAOFactory.getIBooksDAOInstance()
							.findByThreeArgs(input.get(0), input.get(1),
									input.get(2), input.get(3), input.get(4),
									input.get(5));
				else if (length == 8)
					results = DAOFactory.getIBooksDAOInstance().findByFourArgs(
							input.get(0), input.get(1), input.get(2),
							input.get(3), input.get(4), input.get(5),
							input.get(6), input.get(7));
				else if (length == 10)
					results = DAOFactory.getIBooksDAOInstance().findByFiveArgs(
							input.get(0), input.get(1), input.get(2),
							input.get(3), input.get(4), input.get(5),
							input.get(6), input.get(7), input.get(8),
							input.get(9));
				else if (length == 12)
					results = DAOFactory.getIBooksDAOInstance().findBySixArgs(
							input.get(0), input.get(1), input.get(2),
							input.get(3), input.get(4), input.get(5),
							input.get(6), input.get(7), input.get(8),
							input.get(9), input.get(10), input.get(11));
				if ((from != 0 || to != 9999) && length != 0) {
					for (int i = results.size() - 1; i >= 0; i--) {
						if (results.get(i).getPrice() < from
								|| results.get(i).getPrice() > to)
							results.remove(i);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		for (int i = results.size() - 1; i >= 0; i--) {
			if (results.get(i).getIsPause())
				results.remove(i);
		}
		request.getSession().setAttribute("results", results);
		RequestDispatcher rd = request.getRequestDispatcher("/" + page);
		rd.forward(request, response);
	}
}
