package com.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.models.LoginBean;
import com.models.RegistrationClass;

/**
 * Servlet implementation class RegSevlet
 */
@WebServlet("/RegServlet")
public class RegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    /**
     * Default constructor. 
     */
    public RegServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
		// TODO Auto-generated method stub
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userName= request.getParameter("uname");
		String password=request.getParameter("pwd");
		String cpassword=request.getParameter("cpwd");
		String fName=request.getParameter("fname");
		String lName=request.getParameter("lname");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		
		RequestDispatcher rd= request.getRequestDispatcher("index.jsp");
		
		if(password!=cpassword)
		{
			request.setAttribute("status", "Password Mismatch");
		}
		
		RegistrationClass reg=new RegistrationClass();
		
		String status=reg.storeUserDetails(userName, password,cpassword, "learner", fName, lName,email, phone);
		
		
		request.setAttribute("status", status);
		
		rd.forward(request, response);
		
		
	}

}
