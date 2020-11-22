package com.zjw.dao;

import com.zjw.domain.Product;
import org.junit.Test;

/**
 * 测试AccountService
 */
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = {"classpath:applicationContext.xml","classpath:spring-security.xml"})
public class UserServiceTest {

//    @Resource
//    private IUserService userService;

//    @Resource
//    private BCryptPasswordEncoder passwordEncoder;

    @Test
    public void testFindAll() throws Exception {
//        List<UserInfo> list = userService.findAll();
//        System.out.println(list);
//        System.out.println(passwordEncoder.encode("123"));
//        System.out.println(passwordEncoder.encode("123"));
        Class<Product> aClass = Product.class;
        System.out.println(aClass.getName());

    }

}