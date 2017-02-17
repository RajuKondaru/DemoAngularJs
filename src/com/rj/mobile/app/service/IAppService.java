package com.rj.mobile.app.service;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.rj.mobile.pojo.AppPojo;

public interface IAppService {
	public boolean appInstallService(String deviceId,  AppPojo app);
	public boolean appLaunchService( String deviceId, AppPojo app) ;
	public boolean appUnInstallService(String deviceId,  AppPojo app);
	public AppPojo getAppInfoService(  AppPojo app) throws IOException;
	public AppPojo getMultipartDataFromRequest(HttpServletRequest request, AppPojo app);
	public AppPojo getFileFromRequest(HttpServletRequest request, AppPojo app) throws IOException, ServletException;
	public void deleteAppFromTemp(AppPojo app);
	public void storeAppInMangoDB(AppPojo app)  throws ParseException;
	public void storeWebAppInMangoDB(AppPojo app)  throws IOException;
	public List<AppPojo> getAppInfoFromMangoDB(AppPojo app)  throws ParseException;
	public boolean updateAppInfoFromMangoDB(AppPojo app)  throws ParseException;
	
}
