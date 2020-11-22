package com.zjw.service.impl;

import com.zjw.dao.IUserDao;
import com.zjw.domain.Role;
import com.zjw.domain.UserInfo;
import com.zjw.service.IUserService;
import com.zjw.utils.UUIDUtils;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author 朱俊伟
 * @date 2020/11/15
 */
@Service("userService")
@Transactional
public class UserServiceImpl implements IUserService {

    @Resource
    private IUserDao userDao;

    /**
     * 用于密码加密类，每次得到的密码不同
     */
    @Resource(name = "passwordEncoder")
    private BCryptPasswordEncoder passwordEncoder;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserInfo userInfo = null;
        try {
            userInfo = userDao.findByUsername(username);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //构造账户方式二
        User user = new User(userInfo.getUsername(),
                userInfo.getPassword(),
                userInfo.getStatus() != 0,
                true,
                true,
                true,
                getAuthorities(userInfo.getRoles()));
        return user;
    }

    private List<SimpleGrantedAuthority> getAuthorities(List<Role> roleList){
        List<SimpleGrantedAuthority> authorityList = new ArrayList<>();
        for (Role role : roleList) {
            authorityList.add(new SimpleGrantedAuthority("ROLE_"+role.getRoleName()));
        }
        return authorityList;
    }

    @Override
    public List<UserInfo> findAll() throws Exception{
        return userDao.findAll();
    }

    @Override
    public void save(UserInfo userInfo) throws Exception {
        userInfo.setId(UUIDUtils.getUuid());
        //加密密码
        String enPassword = passwordEncoder.encode(userInfo.getPassword());
        userInfo.setPassword(enPassword);
        userDao.save(userInfo);
    }

    @Override
    public UserInfo findById(String id) throws Exception  {
        return userDao.findById(id);
    }

    @Override
    public List<Role> findOtherRoles(String userId) throws Exception{
        return userDao.findOtherRoles(userId);
    }

    @Override
    public void addRoleToUser(String userId, String[] roleIds) throws Exception{

        for(String roleId:roleIds){
            userDao.addRoleToUser(userId,roleId);
        }
    }

    @Override
    public void deleteUserRole(String userId, String roleId) throws Exception{
        userDao.deleteUserRole(userId, roleId);
    }
}
