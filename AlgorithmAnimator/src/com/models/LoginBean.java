package com.models;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class LoginBean{

	public UserDetails loginUser(String userName, String password, String userType) {
		// TODO Auto-generated method stub
		
		SessionFactory sessionFactory=new Configuration().configure().buildSessionFactory();
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		
		UserDetails user=null;
		System.out.println(userName);
		user=(UserDetails)session.get(UserDetails.class,userName);
		
		if(user!=null)
		{
			if(user.getPassword().equals(password))
			{
				return user;
			}
			else
			{
				return null;
			}
		}
		
		return null;
	}

	

}
