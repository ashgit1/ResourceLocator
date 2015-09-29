package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.bean.Url;
import com.dao.UrlDao;
import com.google.gson.Gson;

/**
 * Servlet implementation class GetUrlServlet
 */
public class GetUrlServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    static final Logger logger = Logger.getLogger(GetUrlServlet.class);   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetUrlServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//String tenant = "ASDA";
		UrlDao urlDAO;
		
		String tenantName = request.getParameter("tenant");
		System.out.println("button presssed : " + tenantName);
		
		
		try {
        	urlDAO = new UrlDao();
            ArrayList<Url> obj = urlDAO.returnUrls(tenantName);
            
            String json = new Gson().toJson(obj);
            logger.info("json String : " + json);
            response.setContentType("application/json");
            response.getWriter().write(json);
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
}
