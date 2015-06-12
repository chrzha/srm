package com.haohe.srm.service;

import java.util.List;
import java.util.Map;

import com.haohe.srm.dto.PaginationTableInfo;
import com.haohe.srm.model.Material;

public interface MaterialService {

	List<Map<String, Object>> selectAll(PaginationTableInfo pti);

	int selectAllCount(PaginationTableInfo pti);

	int insert(Material record);

	Material selectByPrimaryKey(Integer materialId);

	int deleteByPrimaryKey(Integer materialId);
	
	int deleteByPrimaryKeys(List<Integer> materialIds);

	int updateByPrimaryKey(Material record);
}
