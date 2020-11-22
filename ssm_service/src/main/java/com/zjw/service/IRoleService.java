package com.zjw.service;

import com.zjw.domain.Permission;
import com.zjw.domain.Role;

import java.util.List;

/**
 * 角色的Service层
 * @author 朱俊伟
 * @date 2020/11/16
 */
public interface IRoleService {

    /**
     * 查询所有角色信息
     * @return
     * @throws Exception
     */
    List<Role> findAll() throws Exception;

    /**
     * 保存角色信息
     * @param role 要保存的角色对象
     * @throws Exception
     */
    void saveRole(Role role) throws Exception;

    /**
     * 根据角色id查询角色详情（角色信息，权限信息）
     * @param id
     * @return
     */
    Role finById(String id) throws Exception;

    Role findById(String id) throws Exception;

    /**
     * 根据roleId查询role，并查询出可以添加的权限
     * @param roleId 角色id
     * @return
     * @throws Exception
     */
    List<Permission> findOtherPermissions(String roleId) throws Exception;

    /**
     * 给角色添加权限
     * @param roleId 角色id
     * @param permissionIds 权限id数组
     * @return
     * @throws Exception
     */
    void addPermissionToRole(String roleId, String[] permissionIds) throws Exception;

    /**
     * 根据角色id删除角色
     * @param roleId 角色id
     * @return
     * @throws Exception
     */
    void deleteRoleById(String roleId) throws Exception;

}
