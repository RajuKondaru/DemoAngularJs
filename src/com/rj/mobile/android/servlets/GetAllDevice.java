package com.rj.mobile.android.servlets;
 
import java.io.BufferedReader;
import java.io.IOException;
 
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.rj.mobile.android.dao.DeviceDAO;
import com.rj.mobile.android.pogo.DeviceModel;
import com.rj.mobile.device.service.DeviceService;

/**
 * Servlet implementation class GetDevice
 */
@SuppressWarnings("serial")
@WebServlet("/GetAllDevices")
public class GetAllDevice extends HttpServlet {
	protected List<DeviceModel> devices;
	protected DeviceDAO deviceDao;
	protected  JSONObject deviceJson;
	protected DeviceService deviceService;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		System.out.println("From GetAllDevices");
		 StringBuilder sb = new StringBuilder();
	        BufferedReader br = request.getReader();
	        String str = null;
	        while ((str = br.readLine()) != null) {
	            sb.append(str);
	        }
	        JSONObject jObj = null;
	        String appName = null;
			try {
				jObj = new JSONObject(sb.toString());
				appName = jObj.getString("appid");
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println(appName);
		HttpSession session=request.getSession();
		session.setAttribute("appid", appName);
		deviceService = new DeviceService();
		deviceDao= new DeviceDAO();
		devices=deviceDao.getAllDevices();
		JSONArray devicejsonArray =null;
		try {
			String devicesresult=deviceService.getConnectedDevicesToServer();
			if(devicesresult.equalsIgnoreCase("List of devices attached")){
				System.out.println(devicesresult);
			} else {
				devicejsonArray = new JSONArray();
				System.out.println(devicesresult);
				try {
					for (DeviceModel device : devices) {
						/*System.out.println(device.getDeviceId());
						System.out.println(device.getDeviceName());
						System.out.println(device.getDeviceOs());
						System.out.println(device.getDeviceOsVersion());
						System.out.println(device.getDeviceIp());
						System.out.println(device.getDeviceTcpPort());
						System.out.println(device.getDeviceForwardPort());
						System.out.println(device.getDeviceStatus());*/
						deviceJson = new JSONObject();
						deviceJson.put("deviceId", device.getDeviceId());
						deviceJson.put("deviceName", device.getDeviceName());
						deviceJson.put("deviceOs", device.getDeviceOs());
						deviceJson.put("deviceOsVersion", device.getDeviceOsVersion());
						deviceJson.put("deviceIp", device.getDeviceIp());
						deviceJson.put("deviceTcpPort", device.getDeviceTcpPort());
						deviceJson.put("deviceForwardPort", device.getDeviceForwardPort());
						if(device.getDeviceStatus()==0){
							deviceJson.put("deviceStatus", "Available");
						}else {
							deviceJson.put("deviceStatus", "InUse");
						}
						
						devicejsonArray.put(deviceJson);
					}
					response.setContentType("application/json; charset=UTF-8");
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
		       
			}
		} catch (InterruptedException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		 response.getWriter().print(devicejsonArray);
	 
	}
	 
	

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
