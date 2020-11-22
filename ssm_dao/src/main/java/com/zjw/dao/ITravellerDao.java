package com.zjw.dao;

import com.zjw.domain.Traveller;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author 朱俊伟
 * @date 2020/11/15
 */
public interface ITravellerDao {

    /**
     * 根据订单id查询旅客信息
     * @param orderId 订单id
     * @return 旅客信息的List集合
     */
    @Select("SELECT t.* FROM traveller t LEFT JOIN order_traveller ot ON t.id = ot.travellerId  WHERE ot.orderId = #{orderId};")
    List<Traveller> findByOrderId(String orderId);
}
