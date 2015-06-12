package com.haohe.srm.dao;

import java.util.List;

import com.haohe.srm.model.UOM;

public interface UOMMapper {
	int deleteByPrimaryKey(Integer uomId);

	int insert(UOM record);

	int insertSelective(UOM record);

	UOM selectByPrimaryKey(Integer uomId);

	int updateByPrimaryKeySelective(UOM record);

	int updateByPrimaryKey(UOM record);

	List<UOM> selectAll();
}