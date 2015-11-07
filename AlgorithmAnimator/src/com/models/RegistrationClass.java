package com.models;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;


public class RegistrationClass{

	public String storeUserDetails(String userName, String password,String cpassword, String userType, String firstName, String lastName,
			String emailId, String phoneNo) {
		
			
		SessionFactory sessionFactory=new Configuration().configure().buildSessionFactory();
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		
		
		UserDetails user=null;
		
		user=(UserDetails)session.get(UserDetails.class,userName);
		
		if(user==null)
		{
			user=new UserDetails();
			user.setUserName(userName);
			user.setPassword(password);
			user.setUserType(userType);
			user.setFirstName(firstName);
			user.setLastName(lastName);
			user.setEmailId(emailId);
			user.setPhoneNo(phoneNo);
		
			session.save(user);
			session.getTransaction().commit();
			session.close();
			return "success";
		}
		else
		{
			return "user exists";
		}
	
	}
}
