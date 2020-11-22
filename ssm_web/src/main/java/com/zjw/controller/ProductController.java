package com.zjw.controller;

import com.zjw.domain.Product;
import com.zjw.service.IProductService;
import com.zjw.utils.UUIDUtils;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 朱俊伟
 * @date 2020/11/12 20:01
 */
@Controller
@RequestMapping("/product")
public class ProductController {

    @Resource
    private IProductService productService;

    /**
     * 查询全部产品
     * @return
     * @throws Exception
     */
    @RequestMapping("/findAll.do")
//    @RolesAllowed("ADMIN")
    @Secured("ROLE_ADMIN")
    public ModelAndView findAll() throws Exception {
        System.out.println("product...controller...");
        ModelAndView mv = new ModelAndView();
        List<Product> productList = productService.findAll();
        mv.addObject("productList", productList);
        mv.setViewName("product-list");
        return mv;
    }

    /**
     * 保存商品
     * @param product
     * @return
     */
    @RequestMapping("/save.do")
    public String save(Product product){
        product.setId(UUIDUtils.getUuid());
        productService.save(product);
        //重定向到查询所有方法
        return "redirect:/product/findAll.do";
    }


}
