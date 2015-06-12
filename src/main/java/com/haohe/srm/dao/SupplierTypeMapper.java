package com.haohe.srm.dao;

import java.util.List;

import com.haohe.srm.model.SupplierType;

public interface SupplierTypeMapper {
    int deleteByPrimaryKey(Integer supTypeId);

    int insert(SupplierType record);

    int insertSelective(SupplierType record);

    SupplierType selectByPrimaryKey(Integer supTypeId);

    int updateByPrimaryKeySelective(SupplierType record);

    int updateByPrimaryKey(SupplierType record);

	List<SupplierType> selectAllSupplierTypes();
}