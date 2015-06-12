package com.haohe.srm.dao;

import java.util.List;
import java.util.Map;

import com.haohe.srm.model.Gender;
import com.haohe.srm.model.MaterialType;

public interface MaterialTypeMapper {
	int deleteByPrimaryKey(Integer matTypeId);

	int insert(MaterialType record);

	int insertSelective(MaterialType record);

	MaterialType selectByPrimaryKey(Integer matTypeId);

	int updateByPrimaryKeySelective(MaterialType record);

	int updateByPrimaryKey(MaterialType record);

	List<MaterialType> selectAll();
}