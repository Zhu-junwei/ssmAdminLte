package com.zjw.dao;

import com.zjw.domain.Member;
import com.zjw.domain.Order;
import com.zjw.domain.Product;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author 朱俊伟
 * @date 2020/11/14 17:05
 */
public interface IOrderDao {

    /**
     * 查询所有的订单信息
     * @return 订单信息的List集合
     * @throws Exception 查询数据库抛出的异常
     */
    @Select("select * from orders")
    @Results(
            @Result(property = "product", javaType = Product.class, column = "productId", one = @One(select = "com.zjw.dao.IProductDao.findById"))
    )
    List<Order> findAll() throws Exception;


    /**
     * 通过订单id查询订单的详情
     * @param id 订单id
     * @return  订单信息，包括会员，产品，旅客
     * @throws Exception
     */
    @Select("select * from orders where id = #{id}")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "product", javaType = Product.class, column = "productId", one = @One(select = "com.zjw.dao.IProductDao.findById")),
            @Result(property = "member", javaType = Member.class, column = "memberId", one = @One(select = "com.zjw.dao.IMemberDao.findById")),
            @Result(property = "travellerList",column = "id",many = @Many(select = "com.zjw.dao.ITravellerDao.findByOrderId"))
    })
    Order findById(String id) throws Exception;
}
