package com.util;

import java.util.ArrayList;

import org.apache.log4j.Logger;

import com.bean.Url;
import com.bean.UserData;
import com.dao.UrlDao;
import com.dao.UserDao;
import com.google.gson.Gson;

public class Test {

	static final Logger logger = Logger.getLogger(Test.class);
	
	@SuppressWarnings("unused")
	public static void main(String[] args) {
		DBUtil con = new DBUtil();
		DBUtil.getCon();
		
		// Testing UserData
		ArrayList<UserData> userData;
		UserDao userDao = new UserDao();
		userData = userDao.getUser();
		logger.info("size in Test : " + userData.size());
		
		String json = new Gson().toJson(userData);
        logger.info("json String in Test : " + json);
        
		// Testing Url
        UrlDao urlDAO = new UrlDao();
        ArrayList<Url> obj = urlDAO.returnUrls("Asda");
        
        String json1 = new Gson().toJson(obj);
        logger.info("json String : " + json1);
		
	}

}
