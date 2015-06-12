package com.haohe.srm.dao;

import com.haohe.srm.model.Workshop;

public interface WorkshopMapper {
    int deleteByPrimaryKey(Integer workshopId);

    int insert(Workshop record);

    int insertSelective(Workshop record);

    Workshop selectByPrimaryKey(Integer workshopId);

    int updateByPrimaryKeySelective(Workshop record);

    int updateByPrimaryKey(Workshop record);
}