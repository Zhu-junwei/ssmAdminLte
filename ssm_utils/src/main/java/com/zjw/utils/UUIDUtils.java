package com.zjw.utils;

import java.util.UUID;

/**
 * @author 朱俊伟
 * @date 2020/11/14 14:54
 */
public class UUIDUtils {

    /**
     * 返回32位大写字母UUID
     * @return
     */
    public static String getUuid(){
        return UUID.randomUUID().toString().replace("-","").toUpperCase();
    }
}
