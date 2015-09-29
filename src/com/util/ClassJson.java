package com.util;

import java.util.ArrayList;

import org.apache.log4j.Logger;

import com.google.gson.Gson;

public class ClassJson {

	static final Logger logger = Logger.getLogger(ClassJson.class);
	
	public static void main(String[] args) {
		
		ArrayList<String> list = new ArrayList<String>();
		list.add("str1");
		list.add("str2");
		list.add("str3");
		String json = new Gson().toJson(list);
		logger.info(json);
		
		fillPlayers();
	}

	public static void fillPlayers(){
		
		Players p1= new Players();
		p1.setCountry("India");
		p1.setName("Sachin");
		p1.setSports("Cricket");
		
		Players p2= new Players();
		p2.setCountry("Brazil");
		p2.setName("Kaka");
		p2.setSports("Soccer");
		
		ArrayList<Players> playerList = new ArrayList<Players>();
		playerList.add(p1);
		playerList.add(p2);
		
		String playerJson  = new Gson().toJson(playerList);
		logger.info("playerJson : " + playerJson);
	}
}
