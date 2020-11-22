package com.zjw.service.impl;

import com.zjw.dao.IProductDao;
import com.zjw.domain.Product;
import com.zjw.service.IProductService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 朱俊伟
 * @date 2020/11/12 19:37
 */
@Service
@Transactional
public class ProductServiceImpl implements IProductService {

    @Resource
    private IProductDao productDao;

    @Override
    public List<Product> findAll() throws Exception {
        System.out.println("service....");
        List<Product> productList = productDao.findAll();
        System.out.println(productList);
        return productList;
    }

    @Override
    public void save(Product product) {
        productDao.sava(product);
    }
}
