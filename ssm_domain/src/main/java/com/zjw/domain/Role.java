package com.zjw.domain;

import org.springframework.security.core.userdetails.User;

import java.io.Serializable;
import java.util.List;

/**
 * 角色信息，与数据库中的role表对应
 * @author 朱俊伟
 * @date 2020/11/15
 */
public class Role implements Serializable {

    /**
     * 无意义，主键uuid
     */
    private String id;

    /**
     * 角色名
     */
    private String roleName;

    /**
     * 角色描述
     */
    private String roleDesc;

    /**
     * 角色所对应的权限列表，一对多
     */
    private List<Permission> permissions;

    /**
     * 角色所对应的用户列表，一对多
     */
    private List<User> users;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getRoleDesc() {
        return roleDesc;
    }

    public void setRoleDesc(String roleDesc) {
        this.roleDesc = roleDesc;
    }

    public List<Permission> getPermissions() {
        return permissions;
    }

    public void setPermissions(List<Permission> permissions) {
        this.permissions = permissions;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    @Override
    public String toString() {
        return "Role{" +
                "id='" + id + '\'' +
                ", roleName='" + roleName + '\'' +
                ", roleDesc='" + roleDesc + '\'' +
                ", permissions=" + permissions +
                ", users=" + users +
                '}';
    }
}
