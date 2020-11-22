package com.zjw.domain;

import java.io.Serializable;

/**
 * 会员信息，与数据库中的member表对应
 * @author 朱俊伟
 * @date 2020/11/14 16:45
 */
public class Member implements Serializable {

    /**
     * 无意义、主键uuid
     */
    private String id;

    /**
     * 姓名
     */
    private String name;

    /**
     * 昵称
     */
    private String nickName;

    /**
     * 电话号码
     */
    private String phoneNum;

    /**
     * 邮箱
     */
    private String email;

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

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "Member{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", nickName='" + nickName + '\'' +
                ", phoneNum='" + phoneNum + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}
