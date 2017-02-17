package com.rj.mobile.device.service;

import java.io.IOException;

public interface IDeviceService {
	
	public boolean checkDeviceAdbConnection(String deviceId) throws InterruptedException, IOException ;
	public boolean checkDeviceNetWorkConnection(String deviceId) throws InterruptedException, IOException ;
	public boolean launchDeviceVNCServer(String deviceId) throws InterruptedException, IOException ;
	public boolean startDeviceVNCServer(String deviceId) throws InterruptedException, IOException ;
	public boolean stopDeviceVNCServer(String deviceId) throws InterruptedException, IOException ;
	public boolean cleanDeviceVNCServer(String deviceId) throws InterruptedException, IOException ;
	public String getConnectedDevicesToServer() throws InterruptedException, IOException;
}
