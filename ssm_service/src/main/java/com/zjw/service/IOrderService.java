package com.zjw.service;

import com.zjw.domain.Order;

import java.util.List;

/**
 * @author 朱俊伟
 * @date 2020/11/14 20:54
 */
public interface IOrderService {

    List<Order> findAll() throws Exception;

    /**
     * 分页查询数据
     * @param page 当前的页数
     * @param size  每页的大小
     * @return
     * @throws Exception
     */
    List<Order> findAllWithPage(int page, int size) throws Exception;

    /**
     * 通过订单id查询订单的详情
     * @param id 订单id
     * @return  订单信息，包括会员，产品，旅客
     * @throws Exception
     */
    Order findById(String id) throws Exception;
}
