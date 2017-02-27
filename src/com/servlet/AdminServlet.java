package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.factory.DAOFactory;
import com.vo.Admin;
import com.vo.User;

/**
 * Servlet implementation class AdminServlet
 */
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String page;
	private String action;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		page = "adminindex.jsp";
		action = request.getParameter("admin");
		try {
			if ("login".equals(action)) {
				page = "adminlogin.jsp";
				String adminname = request.getParameter("name");
				String password = request.getParameter("password");
				if (adminname == "")
					request.setAttribute("status",
							"You must input an username.");
				else if (password == "")
					request.setAttribute("status", "You must input a password");
				else if (DAOFactory.getIAdmDAOInstance().findByAdminName(
						adminname) == null)
					request.setAttribute("status", "Admin does not exist!");
				else {
					Admin admin = DAOFactory.getIAdmDAOInstance()
							.findByAdminName(adminname);
					if (!password.equals(admin.getPassword()))
						request.setAttribute("status", "Password is incorrect!");
					else {
						request.getSession().setAttribute("admin", adminname);
						page = "adminindex.jsp";

					}
				}
			} else if ("deleteall".equals(action)) {
				DAOFactory.getIMonDAOInstance().deleteAllItems();
			} else if ("pwdchange".equals(action)) {
				String oldpwd = request.getParameter("current");
				String pwd = request.getParameter("new");
				String cfpwd = request.getParameter("confirm");
				String username = (String) request.getSession().getAttribute(
						"admin");
				Admin admin = DAOFactory.getIAdmDAOInstance().findByAdminName(
						username);
				if (!pwd.equals(cfpwd)) {
					request.setAttribute("status",
							"The two passwords you typed do not match!");
					page = "adminchanged.jsp";
				} else if (!admin.getPassword().equals(oldpwd)) {
					request.setAttribute("status",
							"The current password is incorrect!");
					page = "adminchanged.jsp";
				} else {
					admin.setPassword(pwd);
					DAOFactory.getIAdmDAOInstance().updateAdminInf(admin);
				}
			} else if ("Ban".equals(action) || "Active".equals(action)) {
				String banuser = request.getParameter("banuser");
				User user = DAOFactory.getIUsrDAOInstance().findByUserName(
						banuser);
				if (user.isConfirm()) {
					user.setConfirm(false);
				} else {
					user.setConfirm(true);
				}

				DAOFactory.getIUsrDAOInstance().updateInf(user);
			} else if ("Delete".equals(action)) {
				String bookkey = request.getParameter("delitem");
				DAOFactory.getIBooksDAOInstance().deleteBook(bookkey);
				String seller = request.getParameter("sellerlname");
				if (DAOFactory.getIBooksDAOInstance().findByOneArgs("seller",
						seller) != null)
					page = "sellerBooks.jsp?sellerlname=" + seller;
				else
					page="showAllSellers.jsp";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("/" + page);
		rd.forward(request, response);
	}
}
