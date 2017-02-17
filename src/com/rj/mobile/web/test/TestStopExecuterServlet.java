package com.rj.mobile.web.test;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.amazonaws.util.json.JSONException;
import com.amazonaws.util.json.JSONObject;
import com.rj.mobile.app.service.VMLiteVNCServerService;
import com.rj.mobile.dao.ObjectSpyService;

/**
 * Servlet implementation class StopExecuterServlet
 */
@SuppressWarnings("serial")
@WebServlet("/TestStopExecuter")
public class TestStopExecuterServlet extends HttpServlet {
	private static final Logger log = Logger.getLogger(TestStopExecuterServlet.class);
	protected String deviceID;
	protected String userid;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/xml");
		/*response.addHeader("Access-Control-Allow-Origin", "*");
		response.addHeader("Access-Control-Allow-Methods",
				"POST, GET, OPTIONS, PUT, DELETE, HEAD");
		response.addHeader("Access-Control-Allow-Headers",
				"X-PINGOTHER, Origin, X-Requested-With, Content-Type, Accept");
		response.addHeader("Access-Control-Max-Age", "1728000");*/
		userid=request.getParameter("userid");
		deviceID=request.getParameter("deviceName");
		log.info("User Id >> "+userid);
		log.info("Device Id >> "+deviceID);
		
		ObjectSpyService service= new ObjectSpyService();
		Integer status = service.deviceStatus(deviceID);
		if(status==1){
			VMLiteVNCServerService vncService= new VMLiteVNCServerService();
			boolean isStop = vncService.stopVNCServer(deviceID);
			
			if(isStop){
				service.updateDeviceStatus(deviceID, 0);
				log.info("Executer thread stoped Successfully");
				JSONObject jobj = new JSONObject();
				String urlToRedirect = "test.jsp";
				try {
					jobj.put("url",urlToRedirect);
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				response.getWriter().write(jobj.toString());
				
			}else {
				
				log.error("Failure");
			}
		}else {
			
			log.error("Failure");
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
