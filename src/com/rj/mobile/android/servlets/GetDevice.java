package com.rj.mobile.android.servlets;

import java.io.BufferedReader;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.rj.mobile.android.dao.DeviceDAO;
import com.rj.mobile.android.pogo.DeviceModel;

/**
 * Servlet implementation class GetDevice
 */
@SuppressWarnings("serial")
@WebServlet("/GetDevice")
public class GetDevice extends HttpServlet {
	protected DeviceModel device;
	protected DeviceDAO deviceDao;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("From GetDeviceServlet");
		 StringBuilder sb = new StringBuilder();
	        BufferedReader br = request.getReader();
	        String str = null;
	        while ((str = br.readLine()) != null) {
	            sb.append(str);
	        }
	        JSONObject jObj = null;
	        String deviceName = null;
			try {
				jObj = new JSONObject(sb.toString());
				deviceName = jObj.getString("deviceName");
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println(deviceName);
			deviceDao= new DeviceDAO();
			device=deviceDao.getDevice(deviceName);
			HttpSession session=request.getSession();
			session.setAttribute("deviceName", device.getDeviceName());
			
			System.out.println(device.getDeviceId());
			System.out.println(device.getDeviceName());
			System.out.println(device.getDeviceIp());
			System.out.println(device.getDeviceTcpPort());
			System.out.println(device.getDeviceForwardPort());
			System.out.println(device.getDeviceStatus());
			response.setContentType("application/json; charset=UTF-8");
			String deviceUrl="http://"+device.getDeviceIp()+":"+ device.getDeviceTcpPort()+"/novnc/vnc_auto.html?host="+device.getDeviceIp()+"&port="+device.getDeviceForwardPort()+"&true_color=1";
			try {
				jObj.put("deviceName", device.getDeviceName());
				jObj.put("deviceUrl", deviceUrl);
				
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
	        response.getWriter().print(jObj);
	 
	    }
	 
	

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
