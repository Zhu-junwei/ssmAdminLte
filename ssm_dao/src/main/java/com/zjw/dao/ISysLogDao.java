package com.zjw.dao;

import com.zjw.domain.SysLog;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author 朱俊伟
 * @date 2020/11/22
 */
public interface ISysLogDao {

    @Insert("insert into sysLog(visitTime,username,ip,url,executionTime,method) values(#{visitTime},#{username},#{ip},#{url},#{executionTime},#{method})")
    void saveSysLog(SysLog sysLog) throws Exception;

    @Select("select * from sysLog order by id desc")
    List<SysLog> findAll();
}
