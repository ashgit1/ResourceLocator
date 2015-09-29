package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.google.gson.Gson;
import com.model.PersonData;

public class AngularJsServlet extends HttpServlet {
	
	private static final long serialVersionUID = 3596709761076277483L;
	final static Logger logger = Logger.getLogger(AngularJsServlet.class);

	public AngularJsServlet() {
            super();
    }

    protected void doGet(HttpServletRequest request,
        HttpServletResponse response) throws ServletException, IOException {
    	
            PersonData personData = new PersonData();
            personData.setFirstName("AshishKumar");
            personData.setLastName("Gupta");

            String json = new Gson().toJson(personData);
            logger.info("json String : " + json);
            response.setContentType("application/json");
            response.getWriter().write(json);
    }
}