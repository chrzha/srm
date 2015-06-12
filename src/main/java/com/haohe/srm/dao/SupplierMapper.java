package com.haohe.srm.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.haohe.srm.dto.PaginationTableInfo;
import com.haohe.srm.model.Supplier;

public interface SupplierMapper {
    int deleteByPrimaryKey(Integer supplierId);

    int insert(Supplier record);

    int insertSelective(Supplier record);

    Supplier selectByPrimaryKey(Integer supplierId);

    int updateByPrimaryKeySelective(Supplier record);

    int updateByPrimaryKey(Supplier record);
    
    List<Map<String, Object>> selectAllSuppliers(Map<String, String> paramMap, RowBounds rowBounds);

	int selectTotalCount(Map<String, String> paramMap);
}