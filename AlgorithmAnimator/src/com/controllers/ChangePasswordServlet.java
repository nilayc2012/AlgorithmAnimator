package com.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.models.UserDetails;
import com.models.ChangePasswordBean;

/**
 * Servlet implementation class ChangePasswordServlet
 */
@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session=request.getSession();
		
		String currentPassword= request.getParameter("current");
		String password=request.getParameter("pwd");
		UserDetails user=(UserDetails)session.getAttribute("user");
		
		ChangePasswordBean cb=new ChangePasswordBean();
		String status=cb.changePassword(user.getUserName(),currentPassword,password);
		
		request.setAttribute("status", status);
		RequestDispatcher rd= request.getRequestDispatcher("change_password.jsp");
		rd.forward(request, response);
	}

}
