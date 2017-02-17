package com.rj.mobile.device.service;

import java.io.IOException;
import java.util.List;

import org.apache.log4j.Logger;

import com.rj.mobile.util.CommandPrompt;

public class DeviceService implements IDeviceService {
	private static final Logger log = Logger.getLogger(DeviceService.class);
	private static CommandPrompt cmd ;
	@Override
	public boolean checkDeviceAdbConnection(String deviceId) throws InterruptedException, IOException {
		// TODO Auto-generated method stub
		boolean connection= false;
		cmd = new CommandPrompt();
		String adbCommand ="adb devices";
		List<String> results =cmd.runCommand(adbCommand);
		StringBuilder sb = new StringBuilder();
		for (String string : results) {
			sb.append(string);
		}
		String totalResult=sb.toString();
	
		if(totalResult.contains(deviceId) && totalResult.contains("device")){
			log.info(deviceId+ " device is connected");
			connection= true;
		}else if(totalResult.contains(deviceId) && totalResult.contains("offline")){
			log.error(deviceId+ " device is offline");
		}if(totalResult.contains(deviceId) && totalResult.contains("unautherized")){
			log.error(deviceId+ " device is unautherized");
		}
		if(!connection){
			log.error(deviceId+ " device not connected, Please check adb connection");
		}
		
		return connection;
	}

	


	@Override
	public boolean checkDeviceNetWorkConnection(String deviceId) throws InterruptedException, IOException {
		// TODO Auto-generated method stub
		boolean connection= false;
		cmd = new CommandPrompt();
		String adbCommand ="adb -s "+deviceId+" shell ip -f inet addr show";
		// adb -s TA93300GXV shell ip -f inet addr show
		List<String> results =cmd.runCommand(adbCommand);
		for (String string : results) {
			if(string.contains("inet") && string.contains("scope global wlan0")  ){
				String[] srt=string.split(" ");
				String[] srt2=srt[5].split("/");
				String ip= srt2[0];
				//log.info(srt2[0]);
				connection= true;
				log.info(deviceId+ " is connected through global host :: "+ip);
			}else if(string.contains("inet") && string.contains("scope host lo")){
				String[] srt=string.split(" ");
				String[] srt2=srt[5].split("/");
				String ip= srt2[0];
				//log.info(srt2[0]);
				connection= false;
				log.info(deviceId+ " is connected through local host :: "+ip);
			}
			//log.info(string);
		}
		if(!connection){
			log.error(deviceId+ " device not connected to wifi network, Please check device wifi network connection");
		}
		return connection;
	}
	

	@Override
	public boolean launchDeviceVNCServer(String deviceId) throws InterruptedException, IOException {
		// TODO Auto-generated method stub
		boolean connection= false;
		cmd = new CommandPrompt();
		String adbCommand ="adb -s "+deviceId+" shell am start -a android.intent.action.MAIN -n com.vmlite.vncserver/.MainActivity";
		//adb -s TA93300GXV shell am start -a android.intent.action.MAIN -n com.vmlite.vncserver/.MainActivity
		List<String> results =cmd.runCommand(adbCommand);
		StringBuilder sb = new StringBuilder();
		for (String string : results) {
			sb.append(string);
		}
		String totalResult=sb.toString();
		if(totalResult.contains("Starting")) {
			connection = true;
			if(totalResult.contains("Warning: Activity not started")) {
				log.info(deviceId +" device VMLite VNC Srever already Launched");
			}else {
				log.info(deviceId+ " device VMLite VNC Srever is Successfully Launched");
			}
		}
		if(!connection){
			log.error(deviceId+ " device VMLite VNC Server is not Launched, Please conatct network admin");
		}
		return connection;
	}

	@Override
	public boolean startDeviceVNCServer(String deviceId) throws InterruptedException, IOException {
		// TODO Auto-generated method stub
		boolean connection= false;
		cmd = new CommandPrompt();
		String adbCommand ="adb -s "+deviceId+" shell /data/data/com.vmlite.vncserver/files/vmlitevncserver";
		//adb -s TA93300GXV shell /data/data/com.vmlite.vncserver/files/vmlitevncserver
		List<String> results =cmd.runCommand(adbCommand);
		StringBuilder sb = new StringBuilder();
		for (String string : results) {
			sb.append(string);
		}
		String totalResult=sb.toString();
		if(totalResult.contains("init_flinger")) {
			connection = true;
			log.info(deviceId+ " device VMLite VNC Server is started successfully ");
		}
		if(!connection) {
			log.error(deviceId+ " device VMLite VNC Server is not started, Please conatct network admin");
		}
		return connection;
	}




	
	@Override
	public boolean stopDeviceVNCServer(String deviceId) throws InterruptedException, IOException {
		// TODO Auto-generated method stub
		boolean connection= false;
		cmd = new CommandPrompt();
		String adbCommand ="adb -s "+deviceId+" shell /data/data/com.vmlite.vncserver/files/vmlitevncserver --stop";
		//  adb -s TA93300GXV shell /data/data/com.vmlite.vncserver/files/vmlitevncserver --stop
		List<String> results =cmd.runCommand(adbCommand);
		StringBuilder sb = new StringBuilder();
		for (String string : results) {
			sb.append(string);
		}
		String totalResult=sb.toString();
		log.info(totalResult);
		if(totalResult.contains("udp port")) {
			connection = true;
			log.info(deviceId+" device VMLite VNC server has to be stoped successfully");
		}
		if(!connection) {
			log.error(deviceId+" device VMLite VNC server has not to be stoped, Please conatct network admin");
		}
		return connection;
	}
	
	

	public static void main1(String[] args) throws InterruptedException, IOException {
		String deviceId= "TA93300GXV";
		cmd = new CommandPrompt();
		String adbCommand ="adb devices";
		List<String> results =cmd.runCommand(adbCommand);
		for (String string : results) {
			if(string.contains(deviceId) && string.contains("device")){
				log.info(deviceId+ " is connected");
			}else if(string.contains(deviceId) && string.contains("offline")){
				log.info(deviceId+ " is offline");
			}if(string.contains(deviceId) && string.contains("unautherized")){
				log.info(deviceId+ " is unautherized");
			}
			
		}
	}
	public static void main2(String[] args) throws InterruptedException, IOException {
		String deviceId= "TA93300GXV";
		cmd = new CommandPrompt();
		String adbCommand ="adb -s "+deviceId+" shell ip -f inet addr show";
		List<String> results =cmd.runCommand(adbCommand);
		for (String string : results) {
		//	log.info(string);
			if(string.contains("inet") && string.contains("scope global wlan0")  ){
				String[] srt=string.split(" ");
				String[] srt2=srt[5].split("/");
				String ip= srt2[0];
				//log.info(srt2[0]);
				log.info(deviceId+ " is connected through global host :: "+ip);
			}else if(string.contains("inet") && string.contains("scope host lo")){
				String[] srt=string.split(" ");
				String[] srt2=srt[5].split("/");
				String ip= srt2[0];
				//log.info(srt2[0]);
				log.info(deviceId+ " is connected through local host :: "+ip);
			}
			
		}
	}

	public static void main(String[] args) throws InterruptedException, IOException {
		String deviceId= "TA93300GXV";
		cmd = new CommandPrompt();
		String adbCommand ="adb -s "+deviceId+" shell am start -a android.intent.action.MAIN -n com.vmlite.vncserver/.MainActivity";
		List<String> results =cmd.runCommand(adbCommand);
		
		for (String string : results) {
			
			if(string.contains("Starting")) {
				adbCommand ="adb -s "+deviceId+" shell /data/data/com.vmlite.vncserver/files/vmlitevncserver";
				results = cmd.runCommand(adbCommand);
				for (String result : results) {
					log.info(result);
				}
				//log.info(deviceId+ " is connected through global host :: "+ip);
			}else {
				log.info(string);
			}
			
		}
	}




	@Override
	public boolean cleanDeviceVNCServer(String deviceId) throws InterruptedException, IOException {
		// TODO Auto-generated method stub
		boolean connection= false;
		cmd = new CommandPrompt();
		String adbCommand ="adb -s "+deviceId+" shell am force-stop com.vmlite.vncserver";
		//  adb -s TA93300GXV shell pm clear com.vmlite.vncserver
		List<String> results =cmd.runCommand(adbCommand);
		StringBuilder sb = new StringBuilder();
		for (String string : results) {
			sb.append(string);
		}
		String totalResult=sb.toString();
		log.info(totalResult);
		if(totalResult.contains("") || totalResult.isEmpty()) {
			connection = true;
			log.info(deviceId+" device VMLite VNC server App has to be closed successfully");
		}
		if(!connection) {
			log.error(deviceId+" device VMLite VNC server App has not to be closed, Please conatct network admin");
		}
		return connection;
	}




	@Override
	public String getConnectedDevicesToServer() throws InterruptedException, IOException {
		// TODO Auto-generated method stub
		cmd = new CommandPrompt();
		String adbCommand ="adb devices";
		List<String> results =cmd.runCommand(adbCommand);
		StringBuilder sb = new StringBuilder();
		for (String string : results) {
			sb.append(string);
		}
		
		return sb.toString();
	}
	
}
