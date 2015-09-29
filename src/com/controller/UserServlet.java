package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.bean.UserData;
import com.dao.UserDao;
import com.google.gson.Gson;

/**
 * Servlet implementation class UserServlet
 */
public class UserServlet extends HttpServlet {
	
	final static Logger logger = Logger.getLogger(UserServlet.class);
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		ArrayList<UserData> userData;
		
		UserDao userDao = new UserDao();
		userData = userDao.getUser();
		logger.info("size in Test : " + userData.size());
		
		String json = new Gson().toJson(userData);
        logger.info("json String in UserServlet : " + json);
        response.setContentType("application/json");
        response.getWriter().write(json);

	}

}
