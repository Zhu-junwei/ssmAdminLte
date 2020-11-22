package com.zjw.domain;

import java.io.Serializable;
import java.util.List;

/**
 * 权限表，与数据库中的permission表对应
 * @author 朱俊伟
 * @date 2020/11/15
 */
public class Permission implements Serializable {

    /**
     * 无意义，主键uuid
     */
    private String id;

    /**
     * 权限名
     */
    private String permissionName;

    /**
     * 资源路径
     */
    private String url;

    /**
     * 权限所对应的角色列表，一对多
     */
    private List<Role> roles;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPermissionName() {
        return permissionName;
    }

    public void setPermissionName(String permissionName) {
        this.permissionName = permissionName;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }

    @Override
    public String toString() {
        return "Permission{" +
                "id='" + id + '\'' +
                ", permissionName='" + permissionName + '\'' +
                ", url='" + url + '\'' +
                ", roles=" + roles +
                '}';
    }
}
