package com.zjw.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 日期操作的工具类
 * @author 朱俊伟
 * @date 2020/11/12 22:45
 */
public class DateUtils {

    /**
     * Date转为String
     * @param date 传入日期
     * @param pattern 转换格式
     * @return  转换后的日期字符串
     */
    public static String dateToString(Date date, String pattern){
       SimpleDateFormat sdf = new SimpleDateFormat(pattern);
       return sdf.format(date);
    }

    /**
     * String转Date
     * @param dateString 要转换的日期
     * @param pattern   转换格式
     * @return  转换后的日期
     */
    public static Date stringToDate(String dateString,String pattern) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
        return sdf.parse(dateString);
    }
}
