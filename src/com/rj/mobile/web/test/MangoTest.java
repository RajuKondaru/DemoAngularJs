package com.rj.mobile.web.test;

import java.io.IOException;
import java.net.UnknownHostException;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import com.mongodb.MongoException;

public class MangoTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			// TODO Auto-generated method stub
			Mongo mongo = new Mongo("localhost", 27017);
			DB db = mongo.getDB("mobile");
			DBCollection collection = db.getCollection("appfile.files");
			BasicDBObject whereQuery = new BasicDBObject();
			whereQuery.put("UserID", "1");
			DBCursor cursor = collection.find(whereQuery);
			DBObject appinfo;
			while(cursor.hasNext()) {
				 appinfo=cursor.next();
				 String icon=appinfo.get("Icon").toString();
				 String filename=appinfo.get("filename").toString();
				 String version=appinfo.get("Version").toString();
				 String uploaddate=appinfo.get("uploadDate").toString();
				    System.out.println(filename);
				    System.out.println(version);
				    System.out.println(uploaddate);
				    
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

}
