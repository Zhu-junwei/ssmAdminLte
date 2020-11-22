package com.zjw.domain;

import java.io.Serializable;
import java.util.List;

/**
 * 用户信息，与数据库中的users表对应
 * @author 朱俊伟
 * @date 2020/11/15
 */
public class UserInfo implements Serializable {

    /**
     * 无意义，主键uuid
     */
    private String id;

    /**
     * 用户名
     */
    private String username;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 密码，数据库存储加密后的密码
     */
    private String password;

    /**
     * 电话
     */
    private String phoneNum;

    /**
     * 状态Integer 0未开启 1开启
     */

    private Integer status;
    /**
     * 状态String 0未开启 1开启
     */
    private String statusStr;

    /**
     * 用户所对应的角色列表，一对多
     */
    private List<Role> roles;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getStatusStr() {
        //状态 0未开启 1开启
        if (status==0){
            statusStr = "未开启";
        }else if (status==1){
            statusStr = "开启";
        }
        return statusStr;
    }

    public void setStatusStr(String statusStr) {
        this.statusStr = statusStr;
    }

    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }

    @Override
    public String toString() {
        return "UserInfo{" +
                "id='" + id + '\'' +
                ", username='" + username + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", phoneNum='" + phoneNum + '\'' +
                ", status=" + status +
                ", statusStr='" + statusStr + '\'' +
                ", roles=" + roles +
                '}';
    }
}
