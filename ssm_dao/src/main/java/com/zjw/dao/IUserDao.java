package com.zjw.dao;

import com.zjw.domain.Role;
import com.zjw.domain.UserInfo;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author 朱俊伟
 * @date 2020/11/15
 */
public interface IUserDao {

    @Select("select * from users where username = #{username}")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "roles", column = "id" , many = @Many(select = "com.zjw.dao.IRoleDao.findRoleByUserId"))
    })
    UserInfo findByUsername(String username) throws Exception;

    @Select("select * from users")
    List<UserInfo> findAll() throws Exception;

    @Insert("insert into users(id,email,username,password,phoneNum,status) value(#{id},#{email},#{username},#{password},#{phoneNum},#{status})")
    void save(UserInfo userInfo);


    @Select("select * from users where id = #{id}")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "roles", column = "id" , many = @Many(select = "com.zjw.dao.IRoleDao.findRoleByUserId"))
    })
    UserInfo findById(String id) throws Exception;

    @Select("select * from role where id not in (select roleId from users_role where userId=#{userId})")
    List<Role> findOtherRoles(String userId);

    @Insert("insert into users_role(userId,roleId) values(#{userId},#{roleId})")
    void addRoleToUser(@Param("userId") String userId, @Param("roleId") String roleId);

    @Delete("delete from users_role where userId=#{userId} and roleId=#{roleId}")
    void deleteUserRole(@Param("userId") String userId ,@Param("roleId") String roleId);
}
