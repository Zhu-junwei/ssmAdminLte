package com.zjw.dao;

import com.zjw.domain.Permission;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author 朱俊伟
 * @date 2020/11/16
 */
public interface IPermissionDao {


    /**
     *  根据角色id查找所对应的权限
     * @param id 角色id
     * @return  角色id对应的权限列表
     * @throws Exception
     */
    @Select("select permission.* from permission where id in (select permissionId from role_permission where roleId=#{id})")
    List<Permission> findPermissionByRoleId(String id) throws Exception;

    /**
     * 查询所有权限信息
     * @return 权限信息列表
     * @throws Exception
     */
    @Select("select * from permission")
    List<Permission> findAll() throws Exception;

    /**
     * 保存权限信息
     * @param permission 存储权限信息的对象
     * @return
     * @throws Exception
     */
    @Insert("insert into permission(id, permissionName, url) values (#{id}, #{permissionName},#{url})")
    void savePermission(Permission permission) throws Exception;

    /**
     * 根据权限id查询权限信息
     * @param id 权限id
     * @return 权限信息
     * @throws Exception
     */
    @Select("select * from permission where id=#{id}")
    Permission findById(String id) throws Exception;

    /**
     * 根据权限id删除权限
     * @param id 权限id
     * @return
     * @throws Exception
     */
    @Delete("delete from permission where id=#{id}")
    void deleteById(String id) throws Exception ;
}
