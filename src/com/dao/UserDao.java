package com.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.bean.UserData;

public class UserDao {
	
	final static Logger logger = Logger.getLogger(UrlDao.class);
	Configuration configuration;
	SessionFactory sessionFactory;
	Session session;
	Transaction transaction;
	
	
	@SuppressWarnings("unchecked")
	public ArrayList<UserData> getUser(){
		ArrayList<UserData> userresult = null;
		try{
			configuration = new Configuration().configure();
            sessionFactory = configuration.buildSessionFactory();
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            String retUser="FROM UserData";
            Query query = session.createQuery(retUser);
            userresult =  (ArrayList<UserData>) query.list();
            logger.info("Size in dao : " + userresult.size());
           
            for(UserData user : userresult){
            	logger.info("fname : " + user.getUser_first_name());
            }
            transaction.commit();
	}catch (HibernateException e) {
    	logger.error("add url exception : " +e.getMessage());
    	logger.error("error");
    	transaction.rollback();
    }finally{
    	session.flush();
    	session.close();
    }
		return userresult;
	}

}
