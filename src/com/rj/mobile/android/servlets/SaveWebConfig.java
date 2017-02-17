package com.rj.mobile.android.servlets;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.rj.mobile.android.dao.DeviceDAO;
import com.rj.mobile.android.pogo.DeviceModel;
import com.rj.mobile.android.pogo.WebConfigModel;

/**
 * Servlet implementation class SaveWebConfigurationsServlet
 */
@WebServlet("/SaveWebConfig")
public class SaveWebConfig extends HttpServlet {
	protected WebConfigModel webConfigs;
	protected DeviceDAO deviceDao;
	protected List<WebConfigModel> webConfigsList;
	protected JSONObject jObj = null;
	protected String url = null;
	protected String name = null;
	protected String version = null;
    
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
	        try {
				jObj = new JSONObject(sb.toString());
				url = jObj.getString("url");
				name = jObj.getString("name");
				version = jObj.getString("version");
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println( url+" "+name+" "+ version);
			webConfigs= new WebConfigModel();
			webConfigs.setWebName(name);
			webConfigs.setWebUrl(url);
			webConfigs.setWebVersion(version);
			deviceDao= new DeviceDAO();
			int flag= deviceDao.saveWebConfigs(webConfigs);
			if(flag!=0){
				System.out.println("flag ::"+flag);
				request.getRequestDispatcher("/getAllWebConfigurations").forward(request, response);
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
