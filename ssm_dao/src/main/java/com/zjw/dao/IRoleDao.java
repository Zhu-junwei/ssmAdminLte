package com.zjw.dao;

import com.zjw.domain.Permission;
import com.zjw.domain.Role;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author 朱俊伟
 * @date 2020/11/15
 */
public interface IRoleDao {

    /**
     * 根据用户id查询出所有对应的角色
     * @param userId 用户id
     * @return  用户所有的角色信息
     * @throws Exception
     */
    @Select("SELECT role.* FROM role,users_role WHERE role.id = users_role.roleId AND users_role.userId = #{userId}")
    @Results({
            @Result(id = true, property = "id" , column = "id"),
            @Result(property = "permissions", column = "id" , many = @Many(select = "com.zjw.dao.IPermissionDao.findPermissionByRoleId"))
    })
    List<Role> findRoleByUserId(String userId) throws Exception;

    /**
     * 查询所有角色信息
     * @return
     * @throws Exception
     */
    @Select("select * from role")
    List<Role> findAll() throws Exception;

    /**
     * 保存角色信息
     * @param role 要保存的角色对象
     * @throws Exception
     */
    @Insert("insert into role(id, roleName, roleDesc) values (#{id}, #{roleName}, #{roleDesc})")
    void saveRole(Role role) throws Exception;

    /**
     * 根据角色id查询角色详情（角色信息，权限信息）
     * @param id 角色id
     * @return
     */
    @Select("select * from role where id = #{id}")
    @Results({
            @Result(id = true, property = "id" , column = "id"),
            @Result(property = "permissions", column = "id" , many = @Many(select = "com.zjw.dao.IPermissionDao.findPermissionByRoleId"))
    })
    Role findById(String id);

    /**
     * 根据roleId查询role，并查询出可以添加的权限
     * @param roleId 角色id
     * @return
     * @throws Exception
     */
    @Select("select * from permission where id not in (select permissionId from role_permission where roleId=#{roleId})")
    List<Permission> findOtherPermissions(String roleId);

    /**
     * 给角色添加权限
     * @param roleId 角色id
     * @param permissionId 权限id
     */
    @Insert("insert into role_permission(roleId,permissionId) values(#{roleId},#{permissionId})")
    void addPermissionToRole(@Param("roleId") String roleId, @Param("permissionId") String permissionId);

    /**
     * 根据角色id删除users_role表中的角色信息
     * @param roleId 角色id
     */
    @Delete("delete from users_role where roleId=#{roleId}")
    void deleteFromUser_RoleByRoleId(String roleId);

    /**
     * 根据角色id删除role_permission表中的角色信息
     * @param roleId 角色id
     */
    @Delete("delete from role_permission where roleId=#{roleId}")
    void deleteFromRole_PermissionByRoleId(String roleId);

    /**
     * 根据角色id删除角色
     * @param roleId 角色id
     * @return
     * @throws Exception
     */
    @Delete("delete from role where id=#{roleId}")
    void deleteRoleById(String roleId) throws Exception;
}
