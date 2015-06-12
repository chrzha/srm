package com.haohe.srm.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.haohe.srm.model.Material;

public interface MaterialMapper {
	int deleteByPrimaryKey(Integer materialId);
	
	int deleteByPrimaryKeys(List<Integer> materialId);
	
	int insert(Material record);

	int insertSelective(Material record);

	Material selectByPrimaryKey(Integer materialId);

	int updateByPrimaryKeySelective(Material record);

	int updateByPrimaryKey(Material record);

	List<Map<String, Object>> selectAll(Map<String, String> paramsMap, RowBounds rowBounds);

	int selectAllCount(Map<String, String> paramsMap);
}