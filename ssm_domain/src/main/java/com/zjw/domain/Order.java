package com.zjw.domain;

import com.zjw.utils.DateUtils;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * 订单信息，与数据库中的order表对应
 * @author 朱俊伟
 * @date 2020/11/14 16:45
 */
public class Order implements Serializable {

    /**
     * 订单id
     */
    private String id;

    /**
     * 订单编号 不为空 唯一
     */
    private String orderNum;

    /**
     * 下单时间
     */
    private Date orderTime;

    /**
     * 下单时间
     */
    private String orderTimeStr;

    /**
     * 出行人数
     */
    private Integer peopleCount;

    /**
     * 订单描述（其他信息）
     */
    private String orderDesc;

    /**
     * 支付方式Integer类型 0 支付宝 1微信 2其它
     */
    private Integer payType;

    /**
     * 支付方式String类型 0 支付宝 1微信 2其它
     */
    private String payTypeStr;

    /**
     * 订单状态Integer类型 0未支付 1已支付
     */
    private Integer orderStatus;

    /**
     * 订单状态Integer类型 0未支付 1已支付
     */
    private String orderStatusStr;

    /**
     * 产品信息，数据库中存放产品di
     */
    private Product product;

    /**
     * 会员信息，数据库中存放会员id
     */
    private Member member;

    /**
     * 旅客，数据库根据order_traveller查询旅客信息
     */
    private List<Traveller> travellerList;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(String orderNum) {
        this.orderNum = orderNum;
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public String getOrderTimeStr() {
        if (orderTime != null){
            orderTimeStr = DateUtils.dateToString(orderTime,"yyyy-MM-dd HH:mm:ss");
        }
        return orderTimeStr;
    }

    public void setOrderTimeStr(String orderTimeStr) {
        this.orderTimeStr = orderTimeStr;
    }

    public Integer getPeopleCount() {
        return peopleCount;
    }

    public void setPeopleCount(Integer peopleCount) {
        this.peopleCount = peopleCount;
    }

    public String getOrderDesc() {
        return orderDesc;
    }

    public void setOrderDesc(String orderDesc) {
        this.orderDesc = orderDesc;
    }

    public Integer getPayType() {
        return payType;
    }

    public void setPayType(Integer payType) {
        this.payType = payType;
    }

    public String getPayTypeStr() {
        switch (payType){
            //支付方式String类型 0 支付宝 1微信 2其它
            case 0:
                payTypeStr = "支付宝" ;break;
            case 1:
                payTypeStr = "微信" ;break;
            case 2:
                payTypeStr = "其它" ;break;
            default:
        }
        return payTypeStr;
    }

    public void setPayTypeStr(String payTypeStr) {
        this.payTypeStr = payTypeStr;
    }

    public Integer getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(Integer orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getOrderStatusStr() {
        //订单状态 0未支付 1已支付
        if (orderStatus == 0){
            orderStatusStr = "未支付";
        }else if (orderStatus == 1){
            orderStatusStr = "已支付";
        }
        return orderStatusStr;
    }

    public void setOrderStatusStr(String orderStatusStr) {
        this.orderStatusStr = orderStatusStr;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    public List<Traveller> getTravellerList() {
        return travellerList;
    }

    public void setTravellerList(List<Traveller> travellerList) {
        this.travellerList = travellerList;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id='" + id + '\'' +
                ", orderNum='" + orderNum + '\'' +
                ", orderTime=" + orderTime +
                ", orderTimeStr='" + getOrderTimeStr() + '\'' +
                ", peopleCount=" + peopleCount +
                ", orderDesc='" + orderDesc + '\'' +
                ", payType=" + payType +
                ", payTypeStr='" + getPayTypeStr() + '\'' +
                ", orderStatus=" + orderStatus +
                ", orderStatusStr='" + getOrderStatusStr() + '\'' +
                ", product=" + product +
                ", member=" + member +
                ", travellerList=" + travellerList +
                '}';
    }
}
