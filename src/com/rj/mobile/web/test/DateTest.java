package com.rj.mobile.web.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTest {

	public static void main(String[] args) {
		
		
		String dateStart = "11/03/14 09:29:58";
	    String dateStop = "11/03/14 09:33:43";

	    //Custom date format
	    SimpleDateFormat format = new SimpleDateFormat("yy/MM/dd HH:mm:ss");

	    Date d1 = null;
	    Date d2 = null;
	    try {
	        d1 = format.parse(dateStart);
	        d2 = format.parse(dateStop);
	    } catch (ParseException e) {
	        e.printStackTrace();
	    }
		
        long diff = d2.getTime() - d1.getTime();
        long diffSeconds = diff / 1000 % 60;
        long diffMinutes = diff / (60 * 1000) % 60;
        long diffHours = diff / (60 * 60 * 1000);
        int diffInDays = (int) ((d2.getTime() - d1.getTime()) / (1000 * 60 * 60 * 24));

        if (diffInDays > 1) {
            System.err.println("Difference in number of days (2) : " + diffInDays);
            //return false;
        } else if (diffHours > 24) {

            System.err.println(">24");
           // return false;
        } else if ((diffHours == 24) && (diffMinutes >= 1)) {
            System.err.println("minutes");
           // return false;
        }
       // return true;
	}

}
