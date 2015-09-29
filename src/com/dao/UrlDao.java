package com.dao;

import java.util.ArrayList;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.bean.Url;
import com.bean.UserData;

public class UrlDao {
	
	final static Logger logger = Logger.getLogger(UrlDao.class);
	Configuration configuration;
	SessionFactory sessionFactory;
	Session session;
	Transaction transaction;
	

	public void addUrlDetails(String tenantName, String description, String url) {

		try {
            // 1. configuring hibernate
             configuration = new Configuration().configure();
            // 2. create sessionfactory
             sessionFactory = configuration.buildSessionFactory();
            // 3. Get Session object
             session = sessionFactory.openSession();
			// session = HibernateUtil.getSessionFactory().getCurrentSession();
            // 4. Starting Transaction
            transaction = session.beginTransaction();
            
            Url insertUrl = new Url();
            insertUrl.setTenant_name(tenantName);
            insertUrl.setTenant_desc(description);
            insertUrl.setTenant_url(url);
            
            System.out.println("Saving the Url");
            
            session.save(insertUrl);
            transaction.commit();
            
            System.out.println("\n\n Url Details Added \n");
 
        } catch (HibernateException e) {
        	logger.error("add url exception : " +e.getMessage());
        	logger.error("error");
        }	finally{
        	//session.close();
        }
	}
	 
	/**
	 * Returns the url and description based on tenant
	*/
	
	@SuppressWarnings("unchecked")
	public ArrayList<Url> returnUrls(String tenant){
		
		ArrayList<Url> urlDetails = null;
		
		try{
				configuration = new Configuration().configure();
	            sessionFactory = configuration.buildSessionFactory();
	            session = sessionFactory.openSession();
	            transaction = session.beginTransaction();
	            String retUrlhql="FROM Url u where u.tenant_name = :tenantName";
	            Query query = session.createQuery(retUrlhql);
	            query.setParameter("tenantName", tenant);
	            urlDetails = (ArrayList<Url>) query.list();
	            logger.info("Size in dao : " + urlDetails.size());
	            
	            for(Url url : urlDetails){
	            	logger.info("Url for " + tenant + " : " + url.getTenant_url());
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
		return urlDetails;
		
	}
	
}