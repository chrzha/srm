package com.haohe.srm.dao;

import com.haohe.srm.model.InqSup;
import com.haohe.srm.model.InqSupKey;

public interface InqSupMapper {
    int deleteByPrimaryKey(InqSupKey key);

    int insert(InqSup record);

    int insertSelective(InqSup record);

    InqSup selectByPrimaryKey(InqSupKey key);

    int updateByPrimaryKeySelective(InqSup record);

    int updateByPrimaryKey(InqSup record);
}