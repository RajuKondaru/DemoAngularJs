package com.rj.mobile.app.service;

public interface IVMLiteVNCServerService {
	public boolean startVNCServer(String deviceID);
	public boolean stopVNCServer(String deviceID);
}
