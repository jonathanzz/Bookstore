package com.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	public static String getCurrentDate() {
		Date date = new Date();
		String str = null;
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss:SSS");
		str = df.format(date);
		return str;
	}
}
