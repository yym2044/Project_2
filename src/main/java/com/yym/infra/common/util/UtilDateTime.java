package com.yym.infra.common.util;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import com.yym.infra.common.constants.Constants;

public class UtilDateTime {

	public static LocalDateTime nowLocalDateTime() throws Exception {
		LocalDateTime localDateTime = LocalDateTime.now();
		return localDateTime;
	}

	public static Date nowDate() throws Exception {
		LocalDateTime localDateTime = LocalDateTime.now();
		String localDateTimeString = localDateTime.format(DateTimeFormatter.ofPattern(Constants.DATETIME_FORMAT_BASIC));
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(Constants.DATETIME_FORMAT_BASIC);
		Date date = simpleDateFormat.parse(localDateTimeString);
		return date;
	}

	public static String nowString() throws Exception {
		LocalDateTime localDateTime = LocalDateTime.now();
		String localDateTimeString = localDateTime.format(DateTimeFormatter.ofPattern(Constants.DATE_FORMAT_BASIC));
		return localDateTimeString;
	}

	public static String calculateDayString(LocalDateTime localDateTime, int num, int type) throws Exception {
		LocalDateTime localDateTimeNew = null;

		if (type == 1) {
			if (num >= 0) {
				localDateTimeNew = localDateTime.plusDays(Math.abs(num));
			} else {
				localDateTimeNew = localDateTime.minusDays(Math.abs(num));
			}
		} else if (type == 2) {
			if (num >= 0) {
				localDateTimeNew = localDateTime.plusMonths(Math.abs(num));
			} else {
				localDateTimeNew = localDateTime.minusMonths(Math.abs(num));
			}
		} else if (type == 3) {
			if (num >= 0) {
				localDateTimeNew = localDateTime.plusYears(Math.abs(num));
			} else {
				localDateTimeNew = localDateTime.minusYears(Math.abs(num));
			}
		}

		String localDateTimeNewString = localDateTimeNew
				.format(DateTimeFormatter.ofPattern(Constants.DATE_FORMAT_BASIC));
		return localDateTimeNewString;
	}
	
	public static String addStringTime(String date) {
		return date + " 00:00:00";
	}
}
