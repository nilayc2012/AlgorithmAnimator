package com.models;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class ChangePasswordBean {

	public String changePassword(String username,String currentPassword, String password)
	{
		SessionFactory sessionFactory=new Configuration().configure().buildSessionFactory();
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		
		UserDetails user=null;
		user=(UserDetails)session.get(UserDetails.class,username);
		

			if(user.getPassword().equals(currentPassword))
			{
				user.setPassword(password);
				session.save(user);
				session.getTransaction().commit();
				return "success";
			}
			else
			{
				return "failure";
			}

		
	
	}
}