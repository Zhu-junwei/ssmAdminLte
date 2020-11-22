package com.zjw.dao;

import com.zjw.domain.Product;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 产品的持久层接口
 * @author 朱俊伟
 * @date 2020/11/12 19:28
 */
public interface IProductDao {


    /**
     * 查询所有的产品信息
     * @return 产品信息的List集合
     * @throws Exception 查询数据库抛出的异常
     */
    @Select("select * from product")
    List<Product> findAll() throws Exception;

    /**
     * 保存产品信息
     * @param product 传入产品对象
     */
    @Insert("insert into product(id,productNum,productName,cityName,departureTime,productPrice,productDesc,productStatus) " +
                "values(#{id},#{productNum},#{productName},#{cityName},#{departureTime},#{productPrice},#{productDesc},#{productStatus})")
    void sava(Product product);

    /**
     * 根据产品id查询产品信息
     * @param id 产品id
     * @return
     */
    @Select("select * from product where id = #{id}")
    Product findById(String id);
}
