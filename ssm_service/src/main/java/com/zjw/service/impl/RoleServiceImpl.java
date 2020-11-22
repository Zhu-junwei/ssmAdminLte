package com.zjw.service.impl;

import com.zjw.dao.IRoleDao;
import com.zjw.domain.Permission;
import com.zjw.domain.Role;
import com.zjw.service.IRoleService;
import com.zjw.utils.UUIDUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 朱俊伟
 * @date 2020/11/16
 */
@Service
@Transactional
public class RoleServiceImpl implements IRoleService {

    @Resource
    private IRoleDao roleDao;

    @Override
    public List<Role> findAll() throws Exception {
        return roleDao.findAll();
    }

    @Override
    public void saveRole(Role role) throws Exception {
        role.setId(UUIDUtils.getUuid());
        roleDao.saveRole(role);
    }

    @Override
    public Role finById(String id) throws Exception{
        return findById(id);
    }

    @Override
    public Role findById(String id) throws Exception{
        return roleDao.findById(id);
    }

    /**
     * 根据roleId查询role，并查询出可以添加的权限
     * @param roleId 角色id
     * @return
     * @throws Exception
     */
    @Override
    public List<Permission> findOtherPermissions(String roleId) throws Exception{
        return roleDao.findOtherPermissions(roleId);
    }

    /**
     * 给角色添加权限
     * @param roleId 角色id
     * @param permissionIds 权限id数组
     * @return
     * @throws Exception
     */
    @Override
    public void addPermissionToRole(String roleId, String[] permissionIds) {
        for(String permissionId:permissionIds){
            roleDao.addPermissionToRole(roleId,permissionId);
        }
    }

    /**
     * 根据角色id删除角色
     * @param roleId 角色id
     * @return
     * @throws Exception
     */
    @Override
    public void deleteRoleById(String roleId) throws Exception{

        /**
         * //从user_role表中删除
         * roleDao.deleteFromUser_RoleByRoleId(roleId);
         * //从role_permission表中删除
         * roleDao.deleteFromRole_PermissionByRoleId(roleId);
         *
         * 由于数据库采用了级联删除操作，故不需要额外删除user_role和role_permission表中的role信息，
         * 采用直接删除role表中的信息即可
         */
        roleDao.deleteRoleById(roleId);
    }
}
