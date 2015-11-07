package com.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.models.UserDetails;
import com.models.LoginBean;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String userName= request.getParameter("uname");
		String password=request.getParameter("pwd");
		String userType=request.getParameter("utype");
		
		LoginBean lb=new LoginBean();
		UserDetails user=lb.loginUser(userName, password, userType);
		
		if(user==null)
		{
			RequestDispatcher rd= request.getRequestDispatcher("index.jsp");
			request.setAttribute("status", "login failure");
			
			rd.forward(request, response);
		}
		else
		{System.out.println("hello");
			RequestDispatcher rd= request.getRequestDispatcher("learner_home.jsp");
			request.setAttribute("user", user);
		
			rd.forward(request, response);
		}
	}

}
