package com.rj.mobile.web.test;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.rj.mobile.dao.ObjectSpyService;

/**
 * Servlet implementation class GetObjects.
 */
@WebServlet("/TestSendObject")
public class TestSendObjectServlet extends HttpServlet {

	/** The log. */
	private static final Logger log = Logger.getLogger(TestSendObjectServlet.class);

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/**
	 * Instantiates a new gets the objects.
	 * 
	 * @see HttpServlet#HttpServlet()
	 */
	public TestSendObjectServlet() {
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
		
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Methods",
					"POST, GET, OPTIONS, PUT, DELETE, HEAD");
			response.addHeader("Access-Control-Allow-Headers",
					"X-PINGOTHER, Origin, X-Requested-With, Content-Type, Accept");
			response.addHeader("Access-Control-Max-Age", "1728000");
			String userid = request.getParameter("userid");
			String type = request.getParameter("type");
			String xpath = request.getParameter("xpath");
			String pageName = request.getParameter("pageName");
			log.info("userid >> " + userid);
			log.info("type >> " + type);
			log.info("xpath >> " + xpath);
			log.info("pageName >> " + pageName);
			/*Approch 1*/
			/*To store every object into database*/
			/*if (xpath != null && pageName != null ) {
				ObjectSpyService service= new ObjectSpyService();
				String page=service.getSessionMobileObjTemp(pageName, userid);
				if(page!=null){
					service.updateMobileObjTemp(pageName, type, xpath);
				}else {
					service.insertMobileObjTemp(pageName, type, xpath, userid);
				}
					
					
			} else {
				log.error("xpath >> " +xpath );
				log.error("pageName >> " +pageName );
			}*/
			
			
			/*Approch 2*/
			/*To store every object into ServletContext obejct*/
			getServletContext().setAttribute("type", type);
			getServletContext().setAttribute("xpath", xpath);
			
			
		} catch (Exception ex) {
			log.error(ex.toString());
		}
	}

}
