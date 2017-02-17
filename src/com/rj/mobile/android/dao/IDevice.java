package com.rj.mobile.android.dao;

import java.sql.SQLException;
import java.util.List;

import com.rj.mobile.android.pogo.DeviceModel;
import com.rj.mobile.android.pogo.WebConfigModel;

public interface IDevice {
	
	public DeviceModel getDevice(String deviceName)throws SQLException;
	
	public List<DeviceModel> getAllDevices()throws SQLException;
	
	public int saveWebConfigs(WebConfigModel webConfigs)throws SQLException;
	public List<WebConfigModel> getAllWebConfigs( )throws SQLException;

}
