package com.haohe.srm.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.haohe.srm.dao.MaterialMapper;
import com.haohe.srm.dto.PaginationTableInfo;
import com.haohe.srm.model.Material;
import com.haohe.srm.service.MaterialService;
import com.haohe.srm.utils.Utilities;

@Service
public class MaterialServiceImpl implements MaterialService {

	@Autowired
	private MaterialMapper materialMapper;

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.haohe.srm.service.MaterialService#selectAll()
	 */
	@Override
	public List<Map<String, Object>> selectAll(PaginationTableInfo pti) {
		RowBounds rowBounds = new RowBounds(pti.getOffset(), pti.getLimit());

		Map<String, String> paramsMap = new HashMap<String, String>();

		if (null != pti.getSearch()) {
			String searchStr = "%" + pti.getSearch().trim() + "%";
			paramsMap.put("search", searchStr);
		}

		if (null != pti.getSort() && null != pti.getOrder()) {
			String sortStr = pti.getSort() + " " + pti.getOrder();
			paramsMap.put("sort", sortStr);
		}

		return materialMapper.selectAll(paramsMap, rowBounds);
	}

	public int selectAllCount(PaginationTableInfo pti) {

		Map<String, String> paramsMap = new HashMap<String, String>();

		if (null != pti.getSearch()) {
			String searchStr = "%" + pti.getSearch().trim() + "%";
			paramsMap.put("search", searchStr);
		}

		int rowsNum = materialMapper.selectAllCount(paramsMap);

		Utilities.p("rowsNum=" + rowsNum);

		return rowsNum;
	}

	@Override
	public int insert(Material record) {
		// TODO Auto-generated method stub
		return materialMapper.insert(record);
	}

	@Override
	public int deleteByPrimaryKey(Integer materialId) {
		// TODO Auto-generated method stub
		return materialMapper.deleteByPrimaryKey(materialId);
	}

	@Override
	public int deleteByPrimaryKeys(List<Integer> materialIds){
		return materialMapper.deleteByPrimaryKeys(materialIds);
		
	}
	@Override
	public Material selectByPrimaryKey(Integer materialId) {
		// TODO Auto-generated method stub
		return materialMapper.selectByPrimaryKey(materialId);
	}

	@Override
	public int updateByPrimaryKey(Material record) {
		// TODO Auto-generated method stub
		return materialMapper.updateByPrimaryKey(record);
	}

}
