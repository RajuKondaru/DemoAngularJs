package com.rj.mobile.android.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.rj.mobile.android.dao.DeviceDAO;
import com.rj.mobile.android.pogo.WebConfigModel;

/**
 * Servlet implementation class getAllWebConfigurationsServlet
 */
@WebServlet("/getAllWebConfigurations")
public class GetAllWebConfigurationsServlet extends HttpServlet {
	protected WebConfigModel webConfigs;
	protected DeviceDAO deviceDao;
	protected List<WebConfigModel> webConfigsList;
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		deviceDao= new DeviceDAO();
		webConfigsList = deviceDao.getAllWebConfigs();
		System.out.println("webConfigsList  ::  "+ webConfigsList);
		response.setContentType("application/json; charset=UTF-8");
		JSONArray webConfigjsonArray = new JSONArray();
		try {
			for (WebConfigModel webConfigModel : webConfigsList) {
				System.out.println("webConfigModel  ::  "+ webConfigModel);
				 JSONObject webConfigJson = new JSONObject();
				 webConfigJson.put("weburl", webConfigModel.getWebUrl());
				 webConfigJson.put("webname", webConfigModel.getWebName());
				 webConfigJson.put("webversion", webConfigModel.getWebVersion());
				 webConfigjsonArray.put(webConfigJson);
			}
			
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("webConfigjsonArray   ::  "+webConfigjsonArray);
        response.getWriter().print(webConfigjsonArray);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
