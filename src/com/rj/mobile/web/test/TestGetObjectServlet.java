package com.rj.mobile.web.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.amazonaws.util.json.JSONObject;
import com.rj.mobile.dao.ObjectSpyService;

/**
 * Servlet implementation class GetObjects.
 */
@WebServlet("/TestGetObject")
public class TestGetObjectServlet extends HttpServlet {

	/** The log. */
	private static final Logger log = Logger.getLogger(TestGetObjectServlet.class);

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/**
	 * Instantiates a new gets the objects.
	 * 
	 * @see HttpServlet#HttpServlet()
	 */
	public TestGetObjectServlet() {
		super();
	}

	/**
	 * Do get.
	 * 
	 * @param request
	 *            the request
	 * @param response
	 *            the response
	 * @throws ServletException
	 *             the servlet exception
	 * @throws IOException
	 *             Signals that an I/O exception has occurred.
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * Do post.
	 * 
	 * @param request
	 *            the request
	 * @param response
	 *            the response
	 * @throws ServletException
	 *             the servlet exception
	 * @throws IOException
	 *             Signals that an I/O exception has occurred.
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			PrintWriter pw = response.getWriter();
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Methods",
					"POST, GET, OPTIONS, PUT, DELETE, HEAD");
			response.addHeader("Access-Control-Allow-Headers",
					"X-PINGOTHER, Origin, X-Requested-With, Content-Type, Accept");
			response.addHeader("Access-Control-Max-Age", "1728000");
			response.setContentType("application/json");
			
			/*Approch 1*/
			/*To get data from database*/
			/*String pageName = request.getParameter("pageName");
			String userId = request.getParameter("userId");
			
			if ( pageName != null && userId != null) {
				Thread.sleep(10000);
				ObjectSpyService service= new ObjectSpyService();
				JSONObject object= service.getMobileObjTemp(pageName, userId);
				pw.print(object);	
				//service.deleteMobileObjTemp(sessionid);
			} else {
				
				//log.error("sessionid >> " +sessionid );
			}*/
			
			
			
			/*Approch 2*/
			/*To get data from ServletContext */
			JSONObject object = new JSONObject();
			
			String type =(String) getServletContext().getAttribute("type");
			String xpath =(String) 	getServletContext().getAttribute("xpath");
			
			log.info("type >> " + type);
			log.info("xpath >> " + xpath);
			
			object.put("type", type);
			object.put("xpath",xpath);
			pw.print(object);	
			
		} catch (Exception ex) {
			log.error(ex.toString());
		}
	}

}
