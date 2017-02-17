package com.rj.mobile.android.servlets;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.google.gson.Gson;
import com.rj.mobile.app.service.AppService;
import com.rj.mobile.pojo.AppPojo;

/**
 * Servlet implementation class UpdateDashboard
 */
@WebServlet("/UpdateDashboard")
public class UpdateDashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AppService appservice;
	private AppPojo app;
	protected JSONObject jObj = null;
   
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		app = new AppPojo();
		appservice = new AppService();
		List applist = null;
		try {
			applist = appservice.getAppInfoFromMangoDB(app);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// create a new Gson instance
		 Gson gson = new Gson();
		 // convert your list to json
		 String jsonAppList = gson.toJson(applist);
		 // print your generated json
		 System.out.println("jsonAppList: " + jsonAppList);
		 response.setContentType("application/json; charset=UTF-8");
		response.getWriter().print(jsonAppList);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
