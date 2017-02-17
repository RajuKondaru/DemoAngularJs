package com.rj.mobile.android.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.rj.mobile.android.pogo.DeviceModel;
import com.rj.mobile.android.pogo.WebConfigModel;
import com.rj.mobile.android.utils.DataBase;

public class DeviceDAO implements IDevice{
	private DataBase db;
	private Connection con;
	private PreparedStatement statement;
	private ResultSet result;
	private DeviceModel device;
	private WebConfigModel webConfig;
	private List<DeviceModel> devicesList;
	private List<WebConfigModel> webConfigsList;
	@Override
	public DeviceModel getDevice(String deviceName)  {
		db= new DataBase("jdbc/mobiledb");
		try {
			con = db.getConnection();
			statement = con.prepareStatement("select * from vmlite_urls where Device_Name ='"+deviceName+"'");
			result = statement.executeQuery();
			if(result.next()){
				device= new DeviceModel();
				device.setDeviceId(result.getString("Device_Id"));
				device.setDeviceName(result.getString("Device_Name"));
				device.setDeviceIp(result.getString("Ip_Address"));
				device.setDeviceTcpPort(Integer.parseInt(result.getString("Tcp_Port")));
				device.setDeviceForwardPort(Integer.parseInt(result.getString("Forward_Port")));
				device.setDeviceStatus(Integer.parseInt(result.getString("Status")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(result!=null){
					result.close();
				}
				if(statement!=null){
					statement.close();
				}
				if(con!=null){
					con.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return device;
	}
	
	
	
	@Override
	public List<DeviceModel> getAllDevices()  {
		db= new DataBase("jdbc/mobiledb");
		try {
			con = db.getConnection();
			statement = con.prepareStatement("select * from vmlite_urls");
			result = statement.executeQuery();
			devicesList= new ArrayList<DeviceModel>();
			while(result.next()){
				device= new DeviceModel();
				device.setDeviceId(result.getString("Device_Id"));
				device.setDeviceName(result.getString("Device_Name"));
				device.setDeviceOs(result.getString("Device_OS"));
				device.setDeviceOsVersion(result.getString("Device_OS_Version"));
				device.setDeviceIp(result.getString("Ip_Address"));
				device.setDeviceTcpPort(Integer.parseInt(result.getString("Tcp_Port")));
				device.setDeviceForwardPort(Integer.parseInt(result.getString("Forward_Port")));
				device.setDeviceStatus(Integer.parseInt(result.getString("Status")));
				devicesList.add(device);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(result!=null){
					result.close();
				}
				if(statement!=null){
					statement.close();
				}
				if(con!=null){
					con.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		 
		return devicesList;
	}


	@Override
	public int saveWebConfigs(WebConfigModel webConfigs){
		int flag =0;
		db= new DataBase("jdbc/mobiledb");
		
		try {
			con = db.getConnection();
			String savewebconfigsQuery = "INSERT INTO weburlconfigds"
					+ "(web_name, web_url, web_version) VALUES"
					+ "(?,?,?)"; 
			statement = con.prepareStatement(savewebconfigsQuery);
			statement.setString(1, webConfigs.getWebName());
			statement.setString(2, webConfigs.getWebUrl());
			statement.setString(3, webConfigs.getWebVersion());
			flag = statement.executeUpdate();
			
		}catch(SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(statement!=null){
					statement.close();
				}
				if(con!=null){
					con.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return flag;
		
	}



	@Override
	public List<WebConfigModel> getAllWebConfigs() {
		db= new DataBase("jdbc/mobiledb");
			
			try {
				con = db.getConnection();
				statement = con.prepareStatement("select * from weburlconfigds");
				result = statement.executeQuery();
				webConfigsList= new ArrayList<WebConfigModel>();
				while(result.next()){
					webConfig= new WebConfigModel();
					webConfig.setWebName(result.getString("web_name"));
					webConfig.setWebUrl(result.getString("web_url"));
					webConfig.setWebVersion(result.getString("web_version"));
					webConfigsList.add(webConfig);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				try {
					if(result!=null){
						result.close();
					}
					if(statement!=null){
						statement.close();
					}
					if(con!=null){
						con.close();
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		return webConfigsList;
	}
	

}
