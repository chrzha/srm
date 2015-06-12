package com.haohe.srm.dao;

import com.haohe.srm.model.Gender;

import java.util.List;

public interface GenderMapper {
    int deleteByPrimaryKey(Integer genderId);

    int insert(Gender record);

    int insertSelective(Gender record);

    List<Gender> selectAll();
    
    Gender selectByPrimaryKey(Integer genderId);

    int updateByPrimaryKeySelective(Gender record);

    int updateByPrimaryKey(Gender record);
}