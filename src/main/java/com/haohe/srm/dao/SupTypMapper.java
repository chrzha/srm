package com.haohe.srm.dao;

import com.haohe.srm.model.SupTyp;
import com.haohe.srm.model.SupTypKey;

public interface SupTypMapper {
    int deleteByPrimaryKey(SupTypKey key);

    int insert(SupTyp record);

    int insertSelective(SupTyp record);

    SupTyp selectByPrimaryKey(SupTypKey key);

    int updateByPrimaryKeySelective(SupTyp record);

    int updateByPrimaryKey(SupTyp record);
}