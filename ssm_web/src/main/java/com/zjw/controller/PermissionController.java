package com.zjw.controller;

import com.zjw.domain.Permission;
import com.zjw.service.IPermissionService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

/**
 * 权限操作的Controller
 * @author 朱俊伟
 * @date 2020/11/19
 */
@Controller
@RequestMapping("/permission")
public class PermissionController {

    @Resource
    private IPermissionService permissionService;

    /**
     * 查询所有权限信息
     * @return ModelAndView
     * @throws Exception
     */
    @RequestMapping("/findAll.do")
    public ModelAndView findAll() throws Exception {
        ModelAndView mv = new ModelAndView("permission-list");
        List<Permission> permissionList = permissionService.findAll();
        mv.addObject("permissionList",permissionList);
        return mv;
    }

    /**
     * 保存权限信息
     * @param permission 存储权限信息的对象
     * @return 重定向的页面
     * @throws Exception
     */
    @RequestMapping("/savePermission.do")
    public String savePermission(Permission permission) throws Exception{
        permissionService.savePermission(permission);
        return "redirect:/permission/findAll.do";
    }

    /**
     * 根据权限id查询权限信息
     * @param id 权限id
     * @return ModelAndView
     * @throws Exception
     */
    @RequestMapping("/findById")
    public ModelAndView findById(String id) throws Exception {
        Permission permission=  permissionService.findById(id);
        ModelAndView mv=new ModelAndView("permission-show");
        mv.addObject("permission",permission);
        return mv;
    }

    /**
     * 根据权限id删除权限
     * @param id 权限id
     * @return 重定向的页面
     * @throws Exception
     */
    @RequestMapping("/deletePermission")
    public String deletePermission(String id) throws Exception {
        permissionService.deleteById(id);
        return "redirect:/role/findAll.do";
    }
}
