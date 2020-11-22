package com.zjw.service.impl;

import com.github.pagehelper.PageHelper;
import com.zjw.dao.IOrderDao;
import com.zjw.domain.Order;
import com.zjw.service.IOrderService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 朱俊伟
 * @date 2020/11/14 20:55
 */
@Service
@Transactional
public class OrderServiceImpl implements IOrderService {

    @Resource
    private IOrderDao orderDao;

    @Override
    public List<Order> findAll() throws Exception {
        return orderDao.findAll();
    }

    @Override
    public List<Order> findAllWithPage(int page, int size) throws Exception {
        PageHelper.startPage(page,size);
        return orderDao.findAll();
    }

    @Override
    public Order findById(String id) throws Exception {
        return orderDao.findById(id);
    }
}
