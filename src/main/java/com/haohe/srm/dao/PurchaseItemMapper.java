package com.haohe.srm.dao;

import com.haohe.srm.model.PurchaseItem;

public interface PurchaseItemMapper {
    int deleteByPrimaryKey(Integer purItemId);

    int insert(PurchaseItem record);

    int insertSelective(PurchaseItem record);

    PurchaseItem selectByPrimaryKey(Integer purItemId);

    int updateByPrimaryKeySelective(PurchaseItem record);

    int updateByPrimaryKey(PurchaseItem record);
}