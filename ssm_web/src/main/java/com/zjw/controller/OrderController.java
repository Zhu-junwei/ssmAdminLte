package com.zjw.controller;

import com.github.pagehelper.PageInfo;
import com.zjw.domain.Order;
import com.zjw.service.IOrderService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 朱俊伟
 * @date 2020/11/14 17:04
 */

@Controller
@RequestMapping("/orders")
public class OrderController {

    @Resource
    private IOrderService orderService;

    /**
     * 查询所有订单信息，为分页
     * @return
     * @throws Exception
     */
    @RequestMapping("/findAll.do")
    public ModelAndView findAll() throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Order> orderList = orderService.findAll();
        mv.addObject("ordersList",orderList);
        mv.setViewName("orders-list");
        return mv;
    }

    /**
     *
     * @param page 要查询的页数索引
     * @param size  要查询的每一页的大小
     * @return  ModelAndView
     * @throws Exception
     */
    @RequestMapping("/findAllWithPage.do")
    public ModelAndView findAllWithPage(@RequestParam("page") Integer page, @RequestParam("size") Integer size) throws Exception {
        ModelAndView mv = new ModelAndView("orders-page-list");
        List<Order> orderList = orderService.findAllWithPage(page,size);
        PageInfo<Order> pageInfo = new PageInfo<>(orderList);
        mv.addObject("pageInfo",pageInfo);
        return mv;
    }

    /**
     * 通过订单id查询订单的详情
     * @param id 订单id
     * @return  订单信息，包括会员，产品，旅客
     * @throws Exception
     */
    @RequestMapping("findById.do")
    public ModelAndView findAllWithPage(@RequestParam("id") String id) throws Exception {
        ModelAndView mv = new ModelAndView();
        Order order = orderService.findById(id);
        mv.addObject("orders",order);
        mv.setViewName("orders-show");
        return mv;
    }

}
