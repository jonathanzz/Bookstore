package com.servlet;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.factory.DAOFactory;
import com.util.EmailUtil;
import com.util.Md5Util;
import com.vo.Admin;
import com.vo.User;

/**
 * Servlet implementation class userServlet
 */
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String page;
	private String action;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserServlet() {
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
		page = "login.jsp";
		action = request.getParameter("user");
		try {
			if ("login".equals(action)) {
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				if (username == "")
					request.setAttribute("status",
							"You must input an username.");
				else if (password == "")
					request.setAttribute("status", "You must input a password");
				else if (DAOFactory.getIUsrDAOInstance().findByUserName(
						username) == null)
					request.setAttribute("status", "User does not exist!");
				else {
					User user = DAOFactory.getIUsrDAOInstance().findByUserName(
							username);
					if (!password.equals(user.getPassword()))
						request.setAttribute("status", "Password is incorrect!");
					else if (!user.isConfirm())
						request.setAttribute("status",
								"This user has not confirmed!");
					else {
						request.getSession().setAttribute("username", username);
						page = "index.jsp";
					}
				}
			} else if ("logout".equals(action))
				request.getSession().removeAttribute("username");
			else if ("register".equals(action)) {
				String username = request.getParameter("rusername");
				String password = request.getParameter("rpassword");
				String email = request.getParameter("email");
				String nickname = request.getParameter("nickname");
				String firstName = request.getParameter("firstName");
				String lastName = request.getParameter("lastName");
				String birth = request.getParameter("birth");
				String address = request.getParameter("address");
				String cardNum = request.getParameter("cardNum");
				boolean isConfirm = false;
				if ((DAOFactory.getIUsrDAOInstance().findByUserName(username)) == null) {
					if ((DAOFactory.getIUsrDAOInstance().findByEmail(email)) == null) {
						User user = new User();
						user.setUsername(username);
						user.setPassword(password);
						user.setEmail(email);
						user.setConfirm(isConfirm);
						user.setNickname(nickname);
						user.setFirstName(firstName);
						user.setLastName(lastName);
						user.setBirth(birth);
						user.setAddress(address);
						user.setCardNum(cardNum);
						DAOFactory.getIUsrDAOInstance().doCreate(user);
						page = "congra.jsp";
						String md5 = Md5Util.getMd5(username);
						EmailUtil.registerMail(username, email, md5);
						request.getSession().setAttribute("newuser", username);
						request.getSession().setAttribute("md5", md5);
					} else {
						request.setAttribute("status",
								"Sorry,this Email address have been registed!");
						page = "register.jsp";
					}
				} else {
					request.setAttribute("status",
							"Sorry,this username is alreay existed!");
					page = "register.jsp";
				}

			} else if ("accountedit".equals(action)) {
				String email = request.getParameter("chemail");
				String nickname = request.getParameter("chnickname");
				String firstName = request.getParameter("chfirstName");
				String lastName = request.getParameter("chlastName");
				String birth = request.getParameter("chbirth");
				String address = request.getParameter("chaddress");
				String cardNum = request.getParameter("chcardNum");
				String username = (String) request.getSession().getAttribute(
						"username");
				User user = DAOFactory.getIUsrDAOInstance().findByUserName(
						username);
				if (email != "")
					user.setEmail(email);
				if (nickname != "")
					user.setNickname(nickname);
				if (firstName != "")
					user.setFirstName(firstName);
				if (lastName != "")
					user.setLastName(lastName);
				if (birth != "")
					user.setBirth(birth);
				if (address != "")
					user.setAddress(address);
				if (cardNum != "")
					user.setCardNum(cardNum);
				DAOFactory.getIUsrDAOInstance().updateInf(user);
				page = "accountinfo.jsp";
			} else if ("pwdchange".equals(action)) {
				String oldpwd = request.getParameter("oldpwd");
				String pwd = request.getParameter("newpwd");
				String cfpwd = request.getParameter("cfpwd");
				String username = (String) request.getSession().getAttribute(
						"username");
				User user = DAOFactory.getIUsrDAOInstance().findByUserName(
						username);
				if (!pwd.equals(cfpwd)) {
					request.setAttribute("status",
							"The two passwords you typed do not match!");
					page = "changepass.jsp";
				} else if (!user.getPassword().equals(oldpwd)) {
					request.setAttribute("status",
							"The current password is incorrect!");
					page = "changepass.jsp";
				} else {
					user.setPassword(pwd);
					page = "index.jsp";
					DAOFactory.getIUsrDAOInstance().updateInf(user);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		RequestDispatcher rd = request.getRequestDispatcher("/" + page);
		rd.forward(request, response);
	}
}
