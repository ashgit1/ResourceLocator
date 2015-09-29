package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UrlDao;

/**
 * Servlet implementation class AddUrlServlet
 */
public class AddUrlServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUrlServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unused")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String tenantName = request.getParameter("tenantName");
        String description = request.getParameter("description");
        String url = request.getParameter("url");
        
        System.out.println(tenantName + " " + description + " " + url);
        
        if(tenantName!=null && description!=null && url!=null){
        	HttpSession session = request.getSession(true);
            try {
            	UrlDao urlDAO = new UrlDao();
                urlDAO.addUrlDetails(tenantName, description, url);
                response.sendRedirect("home1.jsp");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }        
	}
}