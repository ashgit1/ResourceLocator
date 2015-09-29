package com.util;

import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {

      private static final SessionFactory sessionFactory;
      final static Logger logger = Logger.getLogger(HibernateUtil.class);

      static {
          try {
              // Create the SessionFactory from hibernate.cfg.xml
              sessionFactory = new Configuration().configure().buildSessionFactory();
          } catch (Throwable ex) {
              // Make sure you log the exception, as it might be swallowed
        	  logger.error("Initial SessionFactory creation failed." + ex);
              throw new ExceptionInInitializerError(ex);
          }
      }

      public static SessionFactory getSessionFactory() {
    	  logger.info("sessionfactory created");
          return sessionFactory;
      }

}