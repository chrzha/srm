package com.haohe.srm.dao;

import com.haohe.srm.model.Buyer;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

public interface BuyerMapper {
    int deleteByPrimaryKey(Integer buyerId);

    int insert(Buyer record);

    int insertSelective(Buyer record);

    Buyer selectByPrimaryKey(Integer buyerId);
    
    List<Map<String, Object>> selectAll(RowBounds rowBounds);

    int updateByPrimaryKeySelective(Buyer record);

    int updateByPrimaryKey(Buyer record);
}