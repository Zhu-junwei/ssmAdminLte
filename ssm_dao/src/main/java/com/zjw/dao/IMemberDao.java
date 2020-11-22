package com.zjw.dao;

import com.zjw.domain.Member;
import org.apache.ibatis.annotations.Select;

/**
 * @author 朱俊伟
 * @date 2020/11/15
 */
public interface IMemberDao {

    /**
     * 根据会员id查询会员信息
     * @param id
     * @return
     */
    @Select("select * from member where id = #{id}")
    Member findById(String id);
}
