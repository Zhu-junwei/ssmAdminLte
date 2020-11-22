package com.zjw.controller;

import com.zjw.domain.Role;
import com.zjw.domain.UserInfo;
import com.zjw.service.IUserService;
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
@RequestMapping("/user")
public class UserController {

    @Resource(name = "userService")
    private IUserService userService;

    /**
     * 查询所有用户
     * @return ModelAndView
     * @throws Exception
     */
    @RequestMapping("/findAll.do")
    public ModelAndView findAll() throws Exception{
        ModelAndView mv = new ModelAndView();
        List<UserInfo> userInfoList = userService.findAll();
        mv.addObject("userList",userInfoList);
        mv.setViewName("user-list");
        return mv;
    }

    /**
     * 用户添加
     * @return 重定向的页面
     * @throws Exception
     */
    @RequestMapping("/save.do")
    public String save(UserInfo userInfo) throws Exception{
        userService.save(userInfo);
        return "redirect:/user/findAll.do";
    }

    @RequestMapping("/findById.do")
    public ModelAndView findById(String id) throws Exception{
        ModelAndView mv = new ModelAndView();
        System.out.println(id);
        UserInfo userInfo = userService.findById(id);
        mv.addObject("user",userInfo);
        mv.setViewName("user-show");
        return mv;
    }

    //查询用户以及用户可以添加的角色
    @RequestMapping("/findUserByIdAndAllRole.do")
    public ModelAndView findUserByIdAndAllRole(@RequestParam(name = "id") String userid) throws Exception {
        ModelAndView mv = new ModelAndView("user-role-add");
        //1.根据用户id查询用户
        UserInfo userInfo = userService.findById(userid);
        //2.根据用户id查询可以添加的角色
        List<Role> otherRoles = userService.findOtherRoles(userid);
        mv.addObject("user", userInfo);
        mv.addObject("roleList", otherRoles);
        return mv;
    }

    /**
     * 给用户添加角色
     * @param userId 用户id
     * @param roleIds 角色id列表
     * @return
     */
    @RequestMapping("/addRoleToUser.do")
    public String addRoleToUser(@RequestParam(name = "userId") String userId, @RequestParam(name = "ids") String[] roleIds) throws Exception{
        userService.addRoleToUser(userId, roleIds);
        return "redirect:/user/findAll.do";
    }


    /**
     * 删除用户的角色信息
     * @param userId 用户id
     * @param roleId 角色id
     * @return
     * @throws Exception
     */
    @RequestMapping("/deleteUserRole.do")
    public String deleteUserRole(@RequestParam(name = "userId") String userId, @RequestParam(name = "roleId") String roleId) throws Exception{
        userService.deleteUserRole(userId, roleId);
        return "forward:/user/findById.do?id="+userId;
    }
}
