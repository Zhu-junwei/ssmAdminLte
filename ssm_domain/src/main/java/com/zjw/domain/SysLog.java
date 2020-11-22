package com.zjw.domain;

import com.zjw.utils.DateUtils;

import java.util.Date;

/**
 * 记录日志类
 * @author 朱俊伟
 * @date 2020/11/22
 */
public class SysLog {

    /**
     * id自增长
     */
    private Long id;

    /**
     * 访问时间
     */
    private Date visitTime;

    /**
     * 访问时间 字符串
     */
    private String visitTimeStr;

    /**
     * 用户名
     */
    private String username;

    /**
     * ip地址
     */
    private String ip;

    /**
     * 访问url
     */
    private String url;

    /**
     * 执行时间
     */
    private Long executionTime;

    /**
     * 访问方法
     */
    private String method;

    public SysLog() {
    }

    public SysLog(Long id, Date visitTime, String username, String ip, String url, Long executionTime, String method) {
        this.id = id;
        this.visitTime = visitTime;
        this.username = username;
        this.ip = ip;
        this.url = url;
        this.executionTime = executionTime;
        this.method = method;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getVisitTime() {
        return visitTime;
    }

    public void setVisitTime(Date visitTime) {
        this.visitTime = visitTime;
    }

    public String getVisitTimeStr() {
        if (visitTime != null)
            visitTimeStr = DateUtils.dateToString(visitTime,"yyyy-MM-dd HH:mm:ss,SSS");
        return visitTimeStr;
    }

    public void setVisitTimeStr(String visitTimeStr) {
        this.visitTimeStr = visitTimeStr;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Long getExecutionTime() {
        return executionTime;
    }

    public void setExecutionTime(Long executionTime) {
        this.executionTime = executionTime;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    @Override
    public String toString() {
        return "SysLog{" +
                "id=" + id +
                ", visitTime=" + visitTime +
                ", visitTimeStr='" + getVisitTimeStr() + '\'' +
                ", username='" + username + '\'' +
                ", ip='" + ip + '\'' +
                ", url='" + url + '\'' +
                ", executionTime=" + executionTime +
                ", method='" + method + '\'' +
                '}';
    }
}
