package com.zjw.domain;

import java.io.Serializable;

/**
 * 旅客信息，与数据库中的traveller对应
 * @author 朱俊伟
 * @date 2020/11/14 16:46
 */
public class Traveller implements Serializable {


    /**
     * 主键，无意义
     */
    private String id;

    /**
     * 姓名
     */
    private String name;

    /**
     * 性别
     */
    private String sex;

    /**
     * 电话号码
     */
    private String phoneNum;

    /**
     * 证件类型 0身份证 1护照 2军官证
     */
    private Integer credentialsType;

    /**
     * 证件类型 0身份证 1护照 2军官证
     */
    private String credentialsTypeStr;

    /**
     * 证件号码
     */
    private String credentialsNum;

    /**
     * 旅客类型（人群） 0成人 1儿童
     */
    private Integer travellerType;

    /**
     * 旅客类型（人群） 0成人 1儿童
     */
    private String travellerTypeStr;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public Integer getCredentialsType() {
        return credentialsType;
    }

    public void setCredentialsType(Integer credentialsType) {
        this.credentialsType = credentialsType;
    }

    public String getCredentialsTypeStr() {
        //证件类型 0身份证 1护照 2军官证
        switch (credentialsType){
            case 0:
                credentialsTypeStr = "身份证" ;break;
            case 1:
                credentialsTypeStr = "护照" ;break;
            case 2:
                credentialsTypeStr = "军官证" ;break;
            default:
        }
        return credentialsTypeStr;
    }

    public void setCredentialsTypeStr(String credentialsTypeStr) {
        this.credentialsTypeStr = credentialsTypeStr;
    }

    public String getCredentialsNum() {
        return credentialsNum;
    }

    public void setCredentialsNum(String credentialsNum) {
        this.credentialsNum = credentialsNum;
    }

    public Integer getTravellerType() {
        return travellerType;
    }

    public void setTravellerType(Integer travellerType) {
        this.travellerType = travellerType;
    }

    public String getTravellerTypeStr() {
        // 旅客类型（人群） 0成人 1儿童
        switch (travellerType){
            case 0:
                travellerTypeStr = "成人";break;
            case 1:
                travellerTypeStr = "儿童";break;
            default:
        }
        return travellerTypeStr;
    }

    public void setTravellerTypeStr(String travellerTypeStr) {
        this.travellerTypeStr = travellerTypeStr;
    }

    @Override
    public String toString() {
        return "Traveller{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", sex='" + sex + '\'' +
                ", phoneNum='" + phoneNum + '\'' +
                ", credentialsType=" + credentialsType +
                ", credentialsTypeStr='" + getCredentialsTypeStr() + '\'' +
                ", credentialsNum='" + credentialsNum + '\'' +
                ", travellerType=" + travellerType +
                ", travellerTypeStr='" + getTravellerTypeStr() + '\'' +
                '}';
    }
}
