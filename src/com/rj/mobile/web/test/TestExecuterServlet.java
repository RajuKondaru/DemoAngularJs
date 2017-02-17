package com.rj.mobile.web.test;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.rj.mobile.app.service.VMLiteVNCServerService;
import com.rj.mobile.dao.ObjectSpyService;


/**
 * Servlet implementation class ExecuterServlet
 */
@SuppressWarnings("serial")
@WebServlet("/TestExecuter")
public class TestExecuterServlet  extends HttpServlet  {
	private static final Logger log = Logger.getLogger(TestExecuterServlet.class);
	protected String userid;
	protected String projectId;
	protected String pageName;
	protected String browserName;
	protected String platformVersion;
	protected String platformName;
	protected String deviceID;
	protected String url;
	protected String version;
	protected String orientation;
	
	//private MobileConfigs configs;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	//userid=4&projectId=8&browserName=chrome&version=50&deviceName=4897bb00&platformVersion=6.0.1&platformName=Android&testURL=http://demo.opencart.com/index.php?route=account/login
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*response.setContentType("text/xml");
		response.addHeader("Access-Control-Allow-Origin", "*");
		response.addHeader("Access-Control-Allow-Methods",
				"POST, GET, OPTIONS, PUT, DELETE, HEAD");
		response.addHeader("Access-Control-Allow-Headers",
				"X-PINGOTHER, Origin, X-Requested-With, Content-Type, Accept");
		response.addHeader("Access-Control-Max-Age", "1728000");*/
		
		
		userid=request.getParameter("userid");
		projectId=request.getParameter("projectId");
		pageName=request.getParameter("pageName");
		browserName=request.getParameter("browserName");
		deviceID=request.getParameter("deviceName");
		platformVersion=request.getParameter("platformVersion");
		platformName=request.getParameter("platformName");
		url=request.getParameter("testURL");
		version=request.getParameter("version");
		orientation= request.getParameter("orientation");;
		// http://predevmobile.clictest.com:8080/ObjectSpyMobileService/Executer?userid=4&projectId=8&browserName=Chrome&version=50&deviceName=4897bb00&platformVersion=6.0.1&platformName=Android&testURL=http://demo.opencart.com/index.php?route=account/login

		log.info("User Id >> "+userid);
		log.info("Project Id >> "+projectId);
		log.info("Page Name >> "+pageName);
		log.info("Browser Name >> "+browserName);
		log.info("Device Id  >> "+deviceID );
		log.info("Platform Name >> "+platformName);
		log.info("Platform Version >> "+platformVersion);
		log.info("Url >> "+url);
		log.info("Browser Version >> "+version);
		log.info("Device Orientation >> "+orientation);
		ObjectSpyService service= new ObjectSpyService();
		Integer status = service.deviceStatus(deviceID);
		if(status==0){
			service.addPageName(userid, pageName);
			VMLiteVNCServerService vncService= new VMLiteVNCServerService();
			boolean isStart = vncService.startVNCServer(deviceID);
			if(isStart){
				
				try {
					Thread.sleep(5000*2);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				// 93 1 chrome 50 TA64301YVY Android 6.0  http://demo.opencart.com/index.php?route=account/login
				new Thread(new Executer(userid, projectId,pageName, browserName, version, deviceID,  platformName, platformVersion, url, orientation)).start();
				log.info("Executer thread started Successfully");
				service.updateDeviceStatus(deviceID, 1);
				
				
				request.setAttribute("userId", userid);
				request.setAttribute("url", url);
				request.setAttribute("platformName", platformName);
				request.setAttribute("platformVersion", platformVersion);
				request.setAttribute("pageName", pageName);
				request.setAttribute("deviceID", deviceID);
				request.setAttribute("browserName", browserName);
				request.setAttribute("version", version);
				request.setAttribute("orientation", orientation);
				
				request.getRequestDispatcher("/RecordingMobileView.jsp").forward(request, response);  
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
