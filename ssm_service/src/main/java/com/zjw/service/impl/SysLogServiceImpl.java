package com.zjw.service.impl;

import com.github.pagehelper.PageHelper;
import com.zjw.dao.ISysLogDao;
import com.zjw.domain.SysLog;
import com.zjw.service.ISysLogService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 朱俊伟
 * @date 2020/11/22
 */
@Service
@Transactional
public class SysLogServiceImpl implements ISysLogService {

    @Resource
    private ISysLogDao sysLogDao;

    @Override
    public void saveSysLog(SysLog sysLog) throws Exception{
        sysLogDao.saveSysLog(sysLog);
    }

    @Override
    public List<SysLog> findAllWithPage(Integer page,Integer size) throws Exception{
        PageHelper.startPage(page,size);
        return sysLogDao.findAll();
    }
}
