package com.haohe.srm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.haohe.srm.dao.MaterialTypeMapper;
import com.haohe.srm.model.MaterialType;
import com.haohe.srm.service.MaterialTypeService;

@Service
public class MaterialTypeServiceImpl implements MaterialTypeService {

	@Autowired
	private MaterialTypeMapper materialTypeMapper;

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.haohe.srm.service.materialTypeService#selectAll()
	 */
	@Override
	public List<MaterialType> selectAll() {
		return materialTypeMapper.selectAll();
	}

}
