package com.zjw.service;

import com.zjw.domain.SysLog;

import java.util.List;

/**
 * @author 朱俊伟
 * @date 2020/11/22
 */
public interface ISysLogService {

    void saveSysLog(SysLog sysLog) throws Exception;

    List<SysLog> findAllWithPage(Integer page,Integer size) throws Exception;
}
