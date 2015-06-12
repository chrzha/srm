package com.haohe.srm.service.impl;

import com.haohe.srm.dao.GenderMapper;
import com.haohe.srm.model.Gender;
import com.haohe.srm.service.GenderService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GenderServiceImpl implements GenderService {
    
    @Autowired
    private GenderMapper genderMapper;

    /* (non-Javadoc)
     * @see com.haohe.srm.service.BuyerService#selectAll()
     */
    @Override
    public List<Gender> selectAll() {
        return genderMapper.selectAll();
    }

}
