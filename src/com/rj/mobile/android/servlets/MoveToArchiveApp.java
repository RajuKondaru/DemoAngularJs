package com.rj.mobile.android.servlets;

import java.io.BufferedReader;
import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

import com.google.gson.Gson;
import com.rj.mobile.app.service.AppService;
import com.rj.mobile.pojo.AppPojo;

/**
 * Servlet implementation class MoveToArchiveAppServlet
 */
@WebServlet("/MoveToArchiveApp")
public class MoveToArchiveApp extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AppService appservice;
	private AppPojo app;
	protected JSONObject jObj = null;
   
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StringBuilder sb = new StringBuilder();
        BufferedReader br = request.getReader();
        String str = null;
        while ((str = br.readLine()) != null) {
            sb.append(str);
        }
        JSONObject jObj = null;
        String appid = null;
        String status = null;
		try {
			jObj = new JSONObject(sb.toString());
			appid = jObj.getString("appid");
			status = jObj.getString("status");
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(appid);
		
		int id= Integer.parseInt(appid);
		app = new AppPojo();
		app.setId(id);
		app.setStatus(status);
		appservice = new AppService();
		
		try {
			appservice.updateAppInfoFromMangoDB(app);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

