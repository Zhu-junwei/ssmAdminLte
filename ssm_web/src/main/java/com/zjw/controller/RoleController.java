package com.zjw.controller;

import com.zjw.domain.Permission;
import com.zjw.domain.Role;
import com.zjw.service.IRoleService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 朱俊伟
 * @date 2020/11/16
 */
@Controller
@RequestMapping("/role")
public class RoleController {

    @Resource
    private IRoleService roleService;

    /**
     * 查询所有角色信息
     * @return ModelAndView
     * @throws Exception
     */
    @RequestMapping("/findAll.do")
    public ModelAndView findAll() throws Exception{
        ModelAndView mv = new ModelAndView("role-list");
        List<Role> roleList = roleService.findAll();
        mv.addObject("roleList",roleList);
        return mv;
    }

    /**
     * 保存角色信息
     * @param role 角色信息
     * @return
     * @throws Exception
     */
    @RequestMapping("/saveRole.do")
    public String saveRole(Role role) throws Exception{
        roleService.saveRole(role);
        return "redirect:/role/findAll.do";
    }

    /**
     * 根据角色id查询角色详情信息
     * @param id 角色id
     * @return
     * @throws Exception
     */
    @RequestMapping("/findById.do")
    public ModelAndView findById(@RequestParam("id") String id) throws Exception{
        ModelAndView mv = new ModelAndView("role-show");
        Role role = roleService.finById(id);
        mv.addObject("role",role);
        return mv;
    }

    /**
     * 根据roleId查询role，并查询出可以添加的权限
     * @param roleId 角色id
     * @return
     * @throws Exception
     */
    @RequestMapping("/findRoleByIdAndAllPermission.do")
    public ModelAndView findRoleByIdAndAllPermission(@RequestParam(name = "id") String roleId) throws Exception {
        ModelAndView mv = new ModelAndView("role-permission-add");
        //根据roleId查询role
        Role role = roleService.findById(roleId);
        //根据roleId查询可以添加的权限
        List<Permission> otherPermissions = roleService.findOtherPermissions(roleId);
        mv.addObject("role", role);
        mv.addObject("permissionList", otherPermissions);
        return mv;

    }

    /**
     * 给角色添加权限
     * @param roleId 角色id
     * @param permissionIds 权限id数组
     * @return
     * @throws Exception
     */
    @RequestMapping("/addPermissionToRole.do")
    public String addPermissionToRole(@RequestParam("roleId") String roleId, @RequestParam("ids") String[] permissionIds) throws Exception{
        roleService.addPermissionToRole(roleId,permissionIds);
        return "redirect:/role/findAll.do";
    }

    /**
     * 根据角色id删除角色
     * @param roleId 角色id
     * @return
     * @throws Exception
     */
    @RequestMapping("/deleteRole.do")
    public String deleteRole(@RequestParam(name="id") String roleId) throws Exception {
        roleService.deleteRoleById(roleId);
        return "redirect:/role/findAll.do";
    }
}
