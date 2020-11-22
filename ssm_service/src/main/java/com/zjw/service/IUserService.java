package com.zjw.service;

import com.zjw.domain.Role;
import com.zjw.domain.UserInfo;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

/**
 * @author 朱俊伟
 * @date 2020/11/15
 */
public interface IUserService extends UserDetailsService {

    List<UserInfo> findAll() throws Exception;

    void save(UserInfo userInfo) throws Exception;

    UserInfo findById(String id) throws Exception;

    List<Role> findOtherRoles(String userId) throws Exception;

    void addRoleToUser(String userId, String[] roleIds) throws Exception;

    void deleteUserRole(String userId, String roleId) throws Exception;
}
