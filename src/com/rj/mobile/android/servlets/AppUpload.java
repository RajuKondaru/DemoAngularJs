package com.rj.mobile.android.servlets;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.json.JSONException;
import org.json.JSONObject;

import com.rj.mobile.app.service.AppService;
import com.rj.mobile.pojo.AppPojo;
import com.rj.mobile.util.FindFileInZipFile;
import com.rj.mobile.util.Utils;


@WebServlet("/AppUpload")
@MultipartConfig(fileSizeThreshold=1024*1024*10,	// 2MB 
				 maxFileSize=1024*1024*50,		// 10MB
				 maxRequestSize=1024*1024*70)	// 50MB
public class AppUpload extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * Name of the directory where uploaded files will be saved, relative to
	 * the web application directory.
	 */
	private static final String SAVE_DIR = "uploadFiles";
	private String fileName;
	private AppService appservice;
	private AppPojo app;
	protected JSONObject jObj = null;
	/**
	 * handles file upload
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		app = new AppPojo();
		appservice = new AppService();
		String appName=request.getParameter("appName");
		String appVersion=request.getParameter("appVersion");
		String apptype=request.getParameter("apptype");
		
		System.out.println(appName);
		System.out.println(appVersion);
		app.setAppName(appName);
		app.setVersion(appVersion);
		app.setAppType(apptype);
		if (ServletFileUpload.isMultipartContent(request)) {
			app = appservice.getFileFromRequest(request, app);
			if(app.getFileName().contains(".apk")){
				appservice.getAppInfoService( app);
				FindFileInZipFile zipFile = new FindFileInZipFile();
				BufferedImage icon=zipFile.getImage(app.getDownloadedAppPath(), app.getIconPath());
				
				String imgBase64String=Utils.encodeImgTobase64String(icon, "png");
				app.setIcon("data:image/jpeg;base64,"+imgBase64String);
				app.setStatus("Active");
				jObj = new JSONObject();
				try {
					appservice.storeAppInMangoDB(app);
				} catch (ParseException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				try {
					jObj.put("activityName", app.getActivityName());
					jObj.put("packageName", app.getPackageName());
					jObj.put("appName", app.getAppName());
					jObj.put("imgBase64String", imgBase64String);
					jObj.put("version", app.getVersion());
					jObj.put("buildno", app.getBuildId());
					jObj.put("uploadtime", app.getUploadedDate());
					jObj.put("appid", app.getId());
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			File temp= new File(app.getDownloadedAppPath());
			temp.delete();
			response.setContentType("application/json; charset=UTF-8");
			response.getWriter().print(jObj);
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