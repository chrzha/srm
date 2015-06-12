package com.haohe.srm.dao;

import java.util.List;

import com.haohe.srm.model.SupplierRank;

public interface SupplierRankMapper {
    int deleteByPrimaryKey(Integer supRankId);

    int insert(SupplierRank record);

    int insertSelective(SupplierRank record);

    SupplierRank selectByPrimaryKey(Integer supRankId);

    int updateByPrimaryKeySelective(SupplierRank record);

    int updateByPrimaryKey(SupplierRank record);

	List<SupplierRank> selectAllSupplierRanks();
}