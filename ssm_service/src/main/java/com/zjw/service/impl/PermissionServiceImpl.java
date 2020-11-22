package com.zjw.service.impl;

import com.zjw.dao.IPermissionDao;
import com.zjw.domain.Permission;
import com.zjw.service.IPermissionService;
import com.zjw.utils.UUIDUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 朱俊伟
 * @date 2020/11/19
 */
@Service
public class PermissionServiceImpl implements IPermissionService {

    @Resource
    private IPermissionDao permissionDao;

    public List<Permission> findPermissionByRoleId(String id) throws Exception{
        return permissionDao.findPermissionByRoleId(id);
    }

    /**
     * 查询所有权限信息
     * @return 权限信息列表
     * @throws Exception
     */
    @Override
    public List<Permission> findAll() throws Exception{
        return permissionDao.findAll();
    }

    /**
     * 保存权限信息
     * @param permission 存储权限信息的对象
     * @return
     * @throws Exception
     */
    @Override
    public void savePermission(Permission permission) throws Exception{
        permission.setId(UUIDUtils.getUuid());
        permissionDao.savePermission(permission);
    }

    /**
     * 根据权限id查询权限信息
     * @param id 权限id
     * @return 权限信息
     * @throws Exception
     */
    @Override
    public Permission findById(String id) throws Exception {
        return permissionDao.findById(id);
    }

    /**
     * 根据权限id删除权限
     * @param id 权限id
     * @return
     * @throws Exception
     */
    @Override
    public void deleteById(String id) throws Exception {
        permissionDao.deleteById(id);
    }
}
