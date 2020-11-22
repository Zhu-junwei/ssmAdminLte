package com.zjw.service;

import com.zjw.domain.Permission;

import java.util.List;

/**
 * @author 朱俊伟
 * @date 2020/11/19
 */
public interface IPermissionService {

    List<Permission> findPermissionByRoleId(String id) throws Exception;

    /**
     * 查询所有权限信息
     * @return 权限信息列表
     * @throws Exception
     */
    List<Permission> findAll() throws Exception;

    /**
     * 保存权限信息
     * @param permission 存储权限信息的对象
     * @return
     * @throws Exception
     */
    void savePermission(Permission permission) throws Exception;

    /**
     * 根据权限id查询权限信息
     * @param id 权限id
     * @return 权限信息
     * @throws Exception
     */
    Permission findById(String id) throws Exception;

    /**
     * 根据权限id删除权限
     * @param id 权限id
     * @return
     * @throws Exception
     */
    void deleteById(String id) throws Exception;
}
