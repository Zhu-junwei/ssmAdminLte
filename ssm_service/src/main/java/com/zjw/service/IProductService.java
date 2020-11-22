package com.zjw.service;

import com.zjw.domain.Product;

import java.util.List;

/**
 * 产品的Service层
 * @author 朱俊伟
 * @date 2020/11/12 19:36
 */
public interface IProductService {

    /**
     * 查询所有的产品信息
     * @return 产品信息的List集合
     * @throws Exception 查询数据库抛出的异常
     */
    public List<Product> findAll() throws Exception;

    /**
     * 保存商品
     * @param product
     */
    void save(Product product);
}
