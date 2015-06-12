package com.haohe.srm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.haohe.srm.dao.UOMMapper;
import com.haohe.srm.model.UOM;
import com.haohe.srm.service.UOMService;

@Service
public class UOMServiceImpl implements UOMService {

	@Autowired
	private UOMMapper uOMMapper;

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.haohe.srm.service.materialTypeService#selectAll()
	 */
	@Override
	public List<UOM> selectAll() {
		return uOMMapper.selectAll();
	}

}
