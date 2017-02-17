package com.rj.mobile.app.service;


import java.io.File;
import java.io.IOException;
import java.net.UnknownHostException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import com.mongodb.MongoException;
import com.mongodb.WriteResult;
import com.mongodb.gridfs.GridFS;
import com.mongodb.gridfs.GridFSDBFile;
import com.mongodb.gridfs.GridFSInputFile;
import com.rj.mobile.pojo.AppPojo;
import com.rj.mobile.util.CommandPrompt;
import com.rj.mobile.util.Utils;


public class AppService implements IAppService {
	private static final Logger log = Logger.getLogger(AppService.class);
	private CommandPrompt cmd ;
	private String appPackage;
	private AppPojo app;
	private String buildToolPath;
	private int maxFileSize = 50000 * 1024;
	private int maxMemSize = 4000 * 1024;
	private File file ;
	
	
	public AppService() throws IOException{
		Properties prop = new Properties();
		prop.load(AppService.class.getClassLoader().getResourceAsStream("config.properties"));
		buildToolPath= prop.getProperty("buildToolPath");
	}
		
	@Override
	public boolean appInstallService(String deviceId, AppPojo app) {
		boolean status=false;
		try {
			cmd = new CommandPrompt();
			
			String apkFile= app.getDownloadedAppPath();
			String apkName = app.getFileName();
			
			log.info("App Name >> " + apkName);
			//log.info("app Package >> " + appPackage);
			String installCommand = "adb -s "+deviceId+" install "+apkFile; // 0123456789ABCD // // adb -s 0123456789ABCD install D:/RedBus.apk
			
			
			log.info("Command >> " + installCommand);
			
			cmd.runCommand(installCommand);
			/*Thread.sleep(5000);
			List<String> resultList= cmd.runCommand("adb shell pm list packages");
			for (String result : resultList) {
				//log.info("result >> " + result);
				if(result.contains(apkName.toLowerCase())){
					//System.out.println(result);
					String[] temp=result.split(":");
					appPackage = temp[1];
					log.info(appPackage);
				}
			}*/
			
			status = true;
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			
			log.warn(e);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			
			log.warn(e);
		}
		catch (Exception e) {
			// TODO Auto-generated catch block
			
			log.warn(e);
		}
		return status;
	}

	@Override
	public boolean appUnInstallService(String deviceId, AppPojo app) {
		// TODO Auto-generated method stub
		boolean status=false;
		String appPackage = app.getPackageName();
		cmd = new CommandPrompt();
		try {
			String clearCommand = "adb shell pm clear "+appPackage; // 0123456789ABCD // // adb shell pm clear in.redbus.android
		
			cmd.runCommand(clearCommand);
		
			String uninstallCommand = "adb -s "+deviceId+" uninstall "+appPackage; // 0123456789ABCD // // adb -s TA93300GXV uninstall in.redbus.android
		
			cmd.runCommand(uninstallCommand);
			status = true;
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
		
			log.warn(e);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			
			log.warn(e);
		}catch (Exception e) {
			// TODO Auto-generated catch block
			
			log.warn(e);
		}
		return status;
	}

	@Override
	public AppPojo getAppInfoService( AppPojo app) throws IOException {
		// TODO Auto-generated method stub
		//File apkFile= new File(appLocation);
		CommandPrompt cmd = new CommandPrompt();
		
		List<String> resultList = null;
		try {
			resultList = cmd.runCommand(buildToolPath+"/aapt dump badging "+app.getDownloadedAppPath());
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String packageName = null;
		String activityName = null;
		String versionName = null;
		String iconPath = null;
		for (String result : resultList) {
			//log.info(result);
			int ind = result.indexOf("package: name=");
            if (ind >= 0) {
            	log.debug(result);
            	String[] temp=result.split("=");
            	String[] temp2=temp[1].split(" ");
            	packageName = temp2[0];
            	packageName=packageName.replace("'","");
            	
               
            }
            int ind1 = result.indexOf("versionName=");
            if (ind1 >= 0) {
            	log.debug(result);
            	String[] temp=result.split("=");
            	String[] temp2=temp[3].split(" ");
            	versionName = temp2[0];
            	versionName=versionName.replace("'","");
            	
               
            }
           
            int ind2 = result.indexOf("launchable-activity: name=");
            if (ind2 >= 0) {
            	log.debug(result);
            	String[] temp=result.split("=");
            	String[] temp2=temp[1].split(" ");
            	activityName = temp2[0];
            	activityName=activityName.replace("'","");
            	
               
            }
            int ind3 = result.indexOf("icon=");
            if (ind3 >= 0) {
            	log.debug(result);
            	String[] temp=result.split(" ");
            	try{
            		String[] temp2=temp[2].split("=");
	            	iconPath = temp2[1];
	            	iconPath=iconPath.replace("'","");
	            	
            	}catch(ArrayIndexOutOfBoundsException e ){
            		log.warn(e);
            	}
            	
               
            }
	            
		}
		app.setBuildId(versionName);
		app.setPackageName(packageName);
		app.setActivityName(activityName);
		app.setIconPath(iconPath);
		log.info("Package Name	>>>>>>>>"+packageName);
		log.info("Activity Name	>>>>>>>>"+activityName);
		log.info("Icon Path	>>>>>>>>"+iconPath);
		log.info("App Build No	>>>>>>>>"+versionName);
		return app;
	}

	@Override
	public AppPojo getMultipartDataFromRequest(HttpServletRequest request, AppPojo app) {
		
		// TODO Auto-generated method stub
		log.info("You are trying to upload");

		DiskFileItemFactory factory = new DiskFileItemFactory();
		// maximum size that will be stored in memory
	    factory.setSizeThreshold(maxMemSize);
	    // Location to save data that is larger than maxMemSize.
	    factory.setRepository(new File(FileUtils.getUserDirectory()+"/AppData/Local/Temp/"));
		ServletFileUpload upload = new ServletFileUpload(factory);
		// maximum file size to be uploaded.
	    upload.setSizeMax( maxFileSize );
		try {
			
			List<FileItem> fields = upload.parseRequest(request);
			//System.out.println("Number of fields: " + fields.size() );
			Iterator<FileItem> it = fields.iterator();
			FileItem fileItem= null;
			if (!it.hasNext()) {
				log.warn("No fields found");
			//	return;
			}else {
				while (it.hasNext()) {
					
					fileItem = it.next();
					boolean isFormField = fileItem.isFormField();
					if (isFormField) {
						log.info("regular form fields \n FIELD NAME: " + fileItem.getFieldName() + 
								" " + fileItem.getString()
								);
						if(fileItem.getFieldName().contains("userId")){
							app.setUserid(fileItem.getString());
							
						}else if (fileItem.getFieldName().contains("projectId")) {
							app.setProjectId(fileItem.getString());
							
						}else if (fileItem.getFieldName().contains("fileType")) {
							app.setFileType(fileItem.getString());
							
						}else if (fileItem.getFieldName().contains("appName")) {
							app.setAppName(fileItem.getString());
							
						}else if (fileItem.getFieldName().contains("appVersion")) {
							app.setVersion(fileItem.getString());
							
						}
						
					} else {
						log.info("file form fields \n FIELD NAME: " + fileItem.getFieldName() +
								"   " + fileItem.getName() 
								);
						
						app.setFileName(fileItem.getName());
					}
				}
			}
			
			
			// Write the file
            if( app.getFileName()!= null){
               file = new File( factory.getRepository()+"/"+app.getAppName());
               app.setFilePath(file.getAbsolutePath());
               app.setDownloadedAppPath(file.getAbsolutePath());
            }else{
            	log.warn("File Name Null");
            }
            fileItem.write( file ) ;
		} catch (FileUploadException e) {
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return app;
	}
	@Override
	public void deleteAppFromTemp(AppPojo app) {
		// TODO Auto-generated method stub
		File file = new File(app.getDownloadedAppPath());

		if(file.delete()){
			log.info(file.getName() + " is deleted!");
		}else{
			log.warn("Delete operation is failed.");
		}
	}

	@Override
	public boolean appLaunchService(String deviceId,  AppPojo app)  {
		boolean status=false;
		try {
			appPackage = app.getPackageName();
			String launchCommand = "adb -s "+deviceId+" shell monkey -p "+appPackage+" -c android.intent.category.LAUNCHER 1";
			//"adb shell am start -W "+appPackage; // 0123456789ABCD // // adb shell am start -w in.redbus.android
			// adb shell monkey -p com.instagram.android -c android.intent.category.LAUNCHER 1
			// for multiple devices
			// adb -s 0123456789ABCD shell monkey -p in.redbus.android -c android.intent.category.LAUNCHER 1
			log.info("Command >> " + launchCommand);
			cmd.runCommand(launchCommand);
			status= true;
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return status;
	}

	@Override
	public void storeAppInMangoDB(AppPojo app) throws ParseException {
		// TODO Auto-generated method stub
		try {

			Mongo mongo = new Mongo("localhost", 27017);
			DB db = mongo.getDB("mobile");
			String newFileName = app.getFileName();

			File appFile = new File(app.getDownloadedAppPath());

			// create a "photo" namespace
			GridFS gfsPhoto = new GridFS(db, "appfile");

			// get image file from local drive
			GridFSInputFile gfsFile = gfsPhoto.createFile(appFile);
			
			BasicDBObject whereQuery = new BasicDBObject();
			whereQuery.put("UserID", "1");
			DBCollection collection = db.getCollection("appfile.files");
			
			DBCursor cursor = collection.find(whereQuery);
			DBObject appinfo;
			int appid = 0;
			while(cursor.hasNext()) {
				 appinfo=cursor.next();
				 String id=appinfo.get("AppId").toString();
				 appid=Integer.parseInt(id);
			}
			// set a new filename for identify purpose
			gfsFile.setFilename(newFileName);
			gfsFile.setContentType("multipart");
			gfsFile.put("UserID", "1");
			gfsFile.put("AppId", appid+1);
			gfsFile.put("AppName", app.getAppName());
			gfsFile.put("AppType", app.getAppType());
			gfsFile.put("Package", app.getPackageName());
			gfsFile.put("Activity", app.getActivityName());
			gfsFile.put("Icon", app.getIcon());
			gfsFile.put("Version", app.getVersion());
			gfsFile.put("BuildId", app.getBuildId());
			gfsFile.put("Status", app.getStatus());
			DateFormat simpleDateFormat =
	                new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String uploaddate = simpleDateFormat.format(new Date());
			
		
			gfsFile.put("UploadTime", uploaddate);
			
			// save the image file into mongoDB
			gfsFile.save();

			// print the result
			
			while (cursor.hasNext()) {
				System.out.println(cursor.next());
			}
			mongo.close();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		} catch (MongoException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<AppPojo> getAppInfoFromMangoDB(AppPojo app) throws ParseException {
		List<AppPojo> applist = new ArrayList<AppPojo>();
		try {
			Mongo mongo = new Mongo("localhost", 27017);
			DB db = mongo.getDB("mobile");
			DBCollection collection = db.getCollection("appfile.files");
			BasicDBObject whereQuery = new BasicDBObject();
			whereQuery.put("UserID", "1");
			DBCursor cursor = collection.find(whereQuery);
			DBObject appinfo;
			while(cursor.hasNext()) {
				 appinfo=cursor.next();
				 String icon;
				 String weburl;
				 String filename = null;
				 String appType=appinfo.get("AppType").toString();
				 app = new AppPojo();
				if( appType.equalsIgnoreCase("webapp")){
					 icon=appinfo.get("Icon").toString();
					 System.out.println(icon);
					 app.setIcon(icon);
					 weburl=appinfo.get("Weburl").toString();
					 app.setWebUrl(weburl);
					 
				} else {
					 icon=appinfo.get("Icon").toString();
					 
					 app.setIcon(icon);
					 filename=appinfo.get("filename").toString();
					 app.setFileName(filename);
				}
				 String userid=appinfo.get("UserID").toString();
				
				 String appName=appinfo.get("AppName").toString();
				 String version=appinfo.get("Version").toString();
				
				 String status=appinfo.get("Status").toString();
				 String uploadTime=appinfo.get("UploadTime").toString();
				 int id=(int) appinfo.get("AppId");
				 DateFormat simpleDateFormat =
			                new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				 Date upTime=simpleDateFormat.parse(uploadTime);
				 
				 app.setUserid(userid);
				
				 app.setAppName(appName);
				 
				 app.setUploadedDate(upTime);
				 app.setVersion(version);
				 app.setStatus(status);
				 app.setId(id);
				 applist.add(app); 
			}
			mongo.close();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		} catch (MongoException e) {
			System.out.println(e.toString());
			//e.printStackTrace();
		} 
		return applist;
	}

	@Override
	public boolean updateAppInfoFromMangoDB(AppPojo app) throws ParseException {
		
		try {
			Mongo mongo = new Mongo("localhost", 27017);
			DB db = mongo.getDB("mobile");
			DBCollection collection = db.getCollection("appfile.files");
			BasicDBObject newDocument = new BasicDBObject();
			newDocument.append("$set", new BasicDBObject().append("Status", app.getStatus()));

			BasicDBObject searchQuery = new BasicDBObject().append("AppId", app.getId());

			WriteResult result=collection.update(searchQuery, newDocument);
			System.out.println(result);
			
			mongo.close();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		} catch (MongoException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} 
		return true;
	}

	@Override
	public AppPojo getFileFromRequest(HttpServletRequest request, AppPojo app) throws IOException, ServletException {
		// TODO Auto-generated method stub
		String savePath=FileUtils.getUserDirectory()+"/AppData/Local/Temp/";
		for (Part part : request.getParts()) {
			app.setFileName(Utils.extractFileName(part));
			app.setDownloadedAppPath(savePath + File.separator + app.getAppName());
			
			part.write(app.getDownloadedAppPath());
		}
		
		return app;
	}

	@Override
	public void storeWebAppInMangoDB(AppPojo app) throws IOException {
		// TODO Auto-generated method stub
		Mongo mongo = new Mongo("localhost", 27017);
		DB db = mongo.getDB("mobile");
		
		BasicDBObject whereQuery = new BasicDBObject();
		whereQuery.put("UserID", "1");
		DBCollection collection = db.getCollection("appfile.files");
		
		DBCursor cursor = collection.find(whereQuery);
		DBObject appinfo;
		int appid = 0;
		while(cursor.hasNext()) {
			 appinfo=cursor.next();
			 String id=appinfo.get("AppId").toString();
			 appid=Integer.parseInt(id);
		}
		// set a new filename for identify purpose
		BasicDBObject document = new BasicDBObject();
			document.put("UserID", "1");
		document.put("AppId", appid+1);
		document.put("AppName", app.getWebName());
		document.put("Weburl", app.getWebUrl());
		document.put("AppType", app.getAppType());
		document.put("Icon", app.getIcon());
		document.put("Version", app.getWebVersion());
		document.put("Status", app.getStatus());
		DateFormat simpleDateFormat =
                new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String uploaddate = simpleDateFormat.format(new Date());
		
	
		document.put("UploadTime", uploaddate);
		
		// save the data document into mongoDB
		collection.insert(document);

		
		mongo.close();
		
	}
	
	

}
